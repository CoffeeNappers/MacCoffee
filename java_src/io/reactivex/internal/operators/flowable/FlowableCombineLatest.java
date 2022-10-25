package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.annotations.NonNull;
import io.reactivex.annotations.Nullable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.operators.flowable.FlowableMap;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.subscriptions.BasicIntQueueSubscription;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableCombineLatest<T, R> extends Flowable<R> {
    @Nullable
    final Publisher<? extends T>[] array;
    final int bufferSize;
    final Function<? super Object[], ? extends R> combiner;
    final boolean delayErrors;
    @Nullable
    final Iterable<? extends Publisher<? extends T>> iterable;

    public FlowableCombineLatest(@NonNull Publisher<? extends T>[] array, @NonNull Function<? super Object[], ? extends R> combiner, int bufferSize, boolean delayErrors) {
        this.array = array;
        this.iterable = null;
        this.combiner = combiner;
        this.bufferSize = bufferSize;
        this.delayErrors = delayErrors;
    }

    public FlowableCombineLatest(@NonNull Iterable<? extends Publisher<? extends T>> iterable, @NonNull Function<? super Object[], ? extends R> combiner, int bufferSize, boolean delayErrors) {
        this.array = null;
        this.iterable = iterable;
        this.combiner = combiner;
        this.bufferSize = bufferSize;
        this.delayErrors = delayErrors;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super R> s) {
        int n;
        int n2;
        Publisher<? extends T>[] a = this.array;
        if (a == null) {
            int n3 = 0;
            a = new Publisher[8];
            try {
                Iterator<? extends Publisher<? extends T>> it = (Iterator) ObjectHelper.requireNonNull(this.iterable.iterator(), "The iterator returned is null");
                while (true) {
                    try {
                        n2 = n3;
                        boolean b = it.hasNext();
                        if (!b) {
                            break;
                        }
                        try {
                            Publisher<? extends T> p = (Publisher) ObjectHelper.requireNonNull(it.next(), "The publisher returned by the iterator is null");
                            if (n2 == a.length) {
                                Publisher<? extends T>[] c = new Publisher[(n2 >> 2) + n2];
                                System.arraycopy(a, 0, c, 0, n2);
                                a = c;
                            }
                            n3 = n2 + 1;
                            a[n2] = p;
                        } catch (Throwable e) {
                            Exceptions.throwIfFatal(e);
                            EmptySubscription.error(e, s);
                            return;
                        }
                    } catch (Throwable e2) {
                        Exceptions.throwIfFatal(e2);
                        EmptySubscription.error(e2, s);
                        return;
                    }
                }
                n = n2;
            } catch (Throwable e3) {
                Exceptions.throwIfFatal(e3);
                EmptySubscription.error(e3, s);
                return;
            }
        } else {
            n = a.length;
        }
        if (n == 0) {
            EmptySubscription.complete(s);
        } else if (n == 1) {
            a[0].subscribe(new FlowableMap.MapSubscriber(s, new SingletonArrayFunc()));
        } else {
            CombineLatestCoordinator<T, R> coordinator = new CombineLatestCoordinator<>(s, this.combiner, n, this.bufferSize, this.delayErrors);
            s.onSubscribe(coordinator);
            coordinator.subscribe(a, n);
        }
    }

    /* loaded from: classes3.dex */
    static final class CombineLatestCoordinator<T, R> extends BasicIntQueueSubscription<R> {
        private static final long serialVersionUID = -5082275438355852221L;
        final Subscriber<? super R> actual;
        volatile boolean cancelled;
        final Function<? super Object[], ? extends R> combiner;
        int completedSources;
        final boolean delayErrors;
        volatile boolean done;
        final AtomicReference<Throwable> error;
        final Object[] latest;
        int nonEmptySources;
        boolean outputFused;
        final SpscLinkedArrayQueue<Object> queue;
        final AtomicLong requested;
        final CombineLatestInnerSubscriber<T>[] subscribers;

        CombineLatestCoordinator(Subscriber<? super R> actual, Function<? super Object[], ? extends R> combiner, int n, int bufferSize, boolean delayErrors) {
            this.actual = actual;
            this.combiner = combiner;
            CombineLatestInnerSubscriber<T>[] a = new CombineLatestInnerSubscriber[n];
            for (int i = 0; i < n; i++) {
                a[i] = new CombineLatestInnerSubscriber<>(this, i, bufferSize);
            }
            this.subscribers = a;
            this.latest = new Object[n];
            this.queue = new SpscLinkedArrayQueue<>(bufferSize);
            this.requested = new AtomicLong();
            this.error = new AtomicReference<>();
            this.delayErrors = delayErrors;
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.add(this.requested, n);
                drain();
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.cancelled = true;
            cancelAll();
        }

        void subscribe(Publisher<? extends T>[] sources, int n) {
            CombineLatestInnerSubscriber<T>[] a = this.subscribers;
            for (int i = 0; i < n && !this.done && !this.cancelled; i++) {
                sources[i].subscribe(a[i]);
            }
        }

        void innerValue(int index, T value) {
            boolean replenishInsteadOfDrain;
            synchronized (this) {
                Object[] os = this.latest;
                int localNonEmptySources = this.nonEmptySources;
                if (os[index] == null) {
                    localNonEmptySources++;
                    this.nonEmptySources = localNonEmptySources;
                }
                os[index] = value;
                if (os.length == localNonEmptySources) {
                    this.queue.offer(this.subscribers[index], os.clone());
                    replenishInsteadOfDrain = false;
                } else {
                    replenishInsteadOfDrain = true;
                }
            }
            if (replenishInsteadOfDrain) {
                this.subscribers[index].requestOne();
            } else {
                drain();
            }
        }

        void innerComplete(int index) {
            synchronized (this) {
                Object[] os = this.latest;
                if (os[index] != null) {
                    int localCompletedSources = this.completedSources + 1;
                    if (localCompletedSources == os.length) {
                        this.done = true;
                    } else {
                        this.completedSources = localCompletedSources;
                        return;
                    }
                } else {
                    this.done = true;
                }
                drain();
            }
        }

        void innerError(int index, Throwable e) {
            if (ExceptionHelper.addThrowable(this.error, e)) {
                if (!this.delayErrors) {
                    cancelAll();
                    this.done = true;
                    drain();
                    return;
                }
                innerComplete(index);
                return;
            }
            RxJavaPlugins.onError(e);
        }

        void drainOutput() {
            Subscriber<? super R> a = this.actual;
            SpscLinkedArrayQueue<Object> q = this.queue;
            int missed = 1;
            while (!this.cancelled) {
                Throwable ex = this.error.get();
                if (ex != null) {
                    q.clear();
                    a.onError(ex);
                    return;
                }
                boolean d = this.done;
                boolean empty = q.isEmpty();
                if (!empty) {
                    a.onNext(null);
                }
                if (d && empty) {
                    a.onComplete();
                    return;
                }
                missed = addAndGet(-missed);
                if (missed == 0) {
                    return;
                }
            }
            q.clear();
        }

        void drainAsync() {
            Subscriber<? super R> a = this.actual;
            SpscLinkedArrayQueue<Object> q = this.queue;
            int missed = 1;
            do {
                long r = this.requested.get();
                long e = 0;
                while (e != r) {
                    boolean d = this.done;
                    Object v = q.mo1188poll();
                    boolean empty = v == null;
                    if (!checkTerminated(d, empty, a, q)) {
                        if (empty) {
                            break;
                        }
                        try {
                            a.onNext((Object) ObjectHelper.requireNonNull(this.combiner.mo1190apply((Object[]) q.mo1188poll()), "The combiner returned a null value"));
                            ((CombineLatestInnerSubscriber) v).requestOne();
                            e++;
                        } catch (Throwable ex) {
                            Exceptions.throwIfFatal(ex);
                            cancelAll();
                            ExceptionHelper.addThrowable(this.error, ex);
                            a.onError(ExceptionHelper.terminate(this.error));
                            return;
                        }
                    } else {
                        return;
                    }
                }
                if (e != r || !checkTerminated(this.done, q.isEmpty(), a, q)) {
                    if (e != 0 && r != Long.MAX_VALUE) {
                        this.requested.addAndGet(-e);
                    }
                    missed = addAndGet(-missed);
                } else {
                    return;
                }
            } while (missed != 0);
        }

        void drain() {
            if (getAndIncrement() == 0) {
                if (this.outputFused) {
                    drainOutput();
                } else {
                    drainAsync();
                }
            }
        }

        boolean checkTerminated(boolean d, boolean empty, Subscriber<?> a, SpscLinkedArrayQueue<?> q) {
            if (this.cancelled) {
                cancelAll();
                q.clear();
                return true;
            }
            if (d) {
                if (this.delayErrors) {
                    if (empty) {
                        cancelAll();
                        Throwable e = ExceptionHelper.terminate(this.error);
                        if (e != null && e != ExceptionHelper.TERMINATED) {
                            a.onError(e);
                            return true;
                        }
                        a.onComplete();
                        return true;
                    }
                } else {
                    Throwable e2 = ExceptionHelper.terminate(this.error);
                    if (e2 != null && e2 != ExceptionHelper.TERMINATED) {
                        cancelAll();
                        q.clear();
                        a.onError(e2);
                        return true;
                    } else if (empty) {
                        cancelAll();
                        a.onComplete();
                        return true;
                    }
                }
            }
            return false;
        }

        void cancelAll() {
            CombineLatestInnerSubscriber<T>[] arr$ = this.subscribers;
            for (CombineLatestInnerSubscriber<T> inner : arr$) {
                inner.cancel();
            }
        }

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public int requestFusion(int requestedMode) {
            boolean z = false;
            if ((requestedMode & 4) != 0) {
                return 0;
            }
            int m = requestedMode & 2;
            if (m != 0) {
                z = true;
            }
            this.outputFused = z;
            return m;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public R mo1188poll() throws Exception {
            Object e = this.queue.mo1188poll();
            if (e == null) {
                return null;
            }
            R mo1190apply = this.combiner.mo1190apply((Object[]) this.queue.mo1188poll());
            ((CombineLatestInnerSubscriber) e).requestOne();
            return mo1190apply;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public void clear() {
            this.queue.clear();
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public boolean isEmpty() {
            return this.queue.isEmpty();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class CombineLatestInnerSubscriber<T> extends AtomicReference<Subscription> implements FlowableSubscriber<T> {
        private static final long serialVersionUID = -8730235182291002949L;
        final int index;
        final int limit;
        final CombineLatestCoordinator<T, ?> parent;
        final int prefetch;
        int produced;

        CombineLatestInnerSubscriber(CombineLatestCoordinator<T, ?> parent, int index, int prefetch) {
            this.parent = parent;
            this.index = index;
            this.prefetch = prefetch;
            this.limit = prefetch - (prefetch >> 2);
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.setOnce(this, s)) {
                s.request(this.prefetch);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            this.parent.innerValue(this.index, t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.parent.innerError(this.index, t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.parent.innerComplete(this.index);
        }

        public void cancel() {
            SubscriptionHelper.cancel(this);
        }

        public void requestOne() {
            int p = this.produced + 1;
            if (p == this.limit) {
                this.produced = 0;
                get().request(p);
                return;
            }
            this.produced = p;
        }
    }

    /* loaded from: classes3.dex */
    final class SingletonArrayFunc implements Function<T, R> {
        SingletonArrayFunc() {
        }

        /* JADX WARN: Type inference failed for: r1v1, types: [java.lang.Object[], java.lang.Object] */
        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public R mo1190apply(T t) throws Exception {
            return FlowableCombineLatest.this.combiner.mo1190apply(new Object[]{t});
        }
    }
}
