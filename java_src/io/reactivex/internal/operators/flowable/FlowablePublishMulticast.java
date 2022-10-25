package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.QueueDrainHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowablePublishMulticast<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final boolean delayError;
    final int prefetch;
    final Function<? super Flowable<T>, ? extends Publisher<? extends R>> selector;

    public FlowablePublishMulticast(Flowable<T> source, Function<? super Flowable<T>, ? extends Publisher<? extends R>> selector, int prefetch, boolean delayError) {
        super(source);
        this.selector = selector;
        this.prefetch = prefetch;
        this.delayError = delayError;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super R> s) {
        MulticastProcessor<T> mp = new MulticastProcessor<>(this.prefetch, this.delayError);
        try {
            Publisher<? extends R> other = (Publisher) ObjectHelper.requireNonNull(this.selector.mo1190apply(mp), "selector returned a null Publisher");
            OutputCanceller<R> out = new OutputCanceller<>(s, mp);
            other.subscribe(out);
            this.source.subscribe((FlowableSubscriber) mp);
        } catch (Throwable ex) {
            Exceptions.throwIfFatal(ex);
            EmptySubscription.error(ex, s);
        }
    }

    /* loaded from: classes3.dex */
    static final class OutputCanceller<R> implements FlowableSubscriber<R>, Subscription {
        final Subscriber<? super R> actual;
        final MulticastProcessor<?> processor;
        Subscription s;

        OutputCanceller(Subscriber<? super R> actual, MulticastProcessor<?> processor) {
            this.actual = actual;
            this.processor = processor;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(R t) {
            this.actual.onNext(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.actual.onError(t);
            this.processor.dispose();
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.actual.onComplete();
            this.processor.dispose();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            this.s.request(n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.s.cancel();
            this.processor.dispose();
        }
    }

    /* loaded from: classes3.dex */
    static final class MulticastProcessor<T> extends Flowable<T> implements FlowableSubscriber<T>, Disposable {
        static final MulticastSubscription[] EMPTY = new MulticastSubscription[0];
        static final MulticastSubscription[] TERMINATED = new MulticastSubscription[0];
        int consumed;
        final boolean delayError;
        volatile boolean done;
        Throwable error;
        final int limit;
        final int prefetch;
        volatile SimpleQueue<T> queue;
        int sourceMode;
        final AtomicInteger wip = new AtomicInteger();
        final AtomicReference<Subscription> s = new AtomicReference<>();
        final AtomicReference<MulticastSubscription<T>[]> subscribers = new AtomicReference<>(EMPTY);

        MulticastProcessor(int prefetch, boolean delayError) {
            this.prefetch = prefetch;
            this.limit = prefetch - (prefetch >> 2);
            this.delayError = delayError;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.setOnce(this.s, s)) {
                if (s instanceof QueueSubscription) {
                    QueueSubscription<T> qs = (QueueSubscription) s;
                    int m = qs.requestFusion(3);
                    if (m == 1) {
                        this.sourceMode = m;
                        this.queue = qs;
                        this.done = true;
                        drain();
                        return;
                    } else if (m == 2) {
                        this.sourceMode = m;
                        this.queue = qs;
                        QueueDrainHelper.request(s, this.prefetch);
                        return;
                    }
                }
                this.queue = QueueDrainHelper.createQueue(this.prefetch);
                QueueDrainHelper.request(s, this.prefetch);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            SimpleQueue<T> q;
            SubscriptionHelper.cancel(this.s);
            if (this.wip.getAndIncrement() == 0 && (q = this.queue) != null) {
                q.clear();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return SubscriptionHelper.isCancelled(this.s.get());
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                if (this.sourceMode == 0 && !this.queue.offer(t)) {
                    this.s.get().cancel();
                    onError(new MissingBackpressureException());
                    return;
                }
                drain();
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.error = t;
            this.done = true;
            drain();
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                drain();
            }
        }

        boolean add(MulticastSubscription<T> s) {
            MulticastSubscription<T>[] current;
            MulticastSubscription<T>[] next;
            do {
                current = this.subscribers.get();
                if (current == TERMINATED) {
                    return false;
                }
                int n = current.length;
                next = new MulticastSubscription[n + 1];
                System.arraycopy(current, 0, next, 0, n);
                next[n] = s;
            } while (!this.subscribers.compareAndSet(current, next));
            return true;
        }

        void remove(MulticastSubscription<T> s) {
            MulticastSubscription<T>[] current;
            MulticastSubscription<T>[] next;
            do {
                current = this.subscribers.get();
                if (current != TERMINATED && current != EMPTY) {
                    int n = current.length;
                    int j = -1;
                    int i = 0;
                    while (true) {
                        if (i >= n) {
                            break;
                        } else if (current[i] != s) {
                            i++;
                        } else {
                            j = i;
                            break;
                        }
                    }
                    if (j >= 0) {
                        if (n == 1) {
                            next = EMPTY;
                        } else {
                            next = new MulticastSubscription[n - 1];
                            System.arraycopy(current, 0, next, 0, j);
                            System.arraycopy(current, j + 1, next, j, (n - j) - 1);
                        }
                    } else {
                        return;
                    }
                } else {
                    return;
                }
            } while (!this.subscribers.compareAndSet(current, next));
        }

        @Override // io.reactivex.Flowable
        protected void subscribeActual(Subscriber<? super T> s) {
            MulticastSubscription<T> ms = new MulticastSubscription<>(s, this);
            s.onSubscribe(ms);
            if (add(ms)) {
                if (ms.isCancelled()) {
                    remove(ms);
                    return;
                } else {
                    drain();
                    return;
                }
            }
            Throwable ex = this.error;
            if (ex != null) {
                s.onError(ex);
            } else {
                s.onComplete();
            }
        }

        void drain() {
            Throwable ex;
            Throwable ex2;
            if (this.wip.getAndIncrement() == 0) {
                int missed = 1;
                SimpleQueue<T> q = this.queue;
                int upstreamConsumed = this.consumed;
                int localLimit = this.limit;
                boolean canRequest = this.sourceMode != 1;
                while (true) {
                    MulticastSubscription<T>[] array = this.subscribers.get();
                    int n = array.length;
                    if (q != null && n != 0) {
                        long r = Long.MAX_VALUE;
                        for (MulticastSubscription<T> ms : array) {
                            long u = ms.get();
                            if (u != Long.MIN_VALUE && r > u) {
                                r = u;
                            }
                        }
                        long e = 0;
                        while (e != r) {
                            if (isDisposed()) {
                                q.clear();
                                return;
                            }
                            boolean d = this.done;
                            if (d && !this.delayError && (ex2 = this.error) != null) {
                                errorAll(ex2);
                                return;
                            }
                            try {
                                T v = q.mo1188poll();
                                boolean empty = v == null;
                                if (d && empty) {
                                    Throwable ex3 = this.error;
                                    if (ex3 != null) {
                                        errorAll(ex3);
                                        return;
                                    } else {
                                        completeAll();
                                        return;
                                    }
                                } else if (empty) {
                                    break;
                                } else {
                                    for (MulticastSubscription<T> ms2 : array) {
                                        if (ms2.get() != Long.MIN_VALUE) {
                                            ms2.actual.onNext(v);
                                        }
                                    }
                                    e++;
                                    if (canRequest) {
                                        upstreamConsumed++;
                                        if (upstreamConsumed == localLimit) {
                                            upstreamConsumed = 0;
                                            this.s.get().request(localLimit);
                                        }
                                    }
                                }
                            } catch (Throwable ex4) {
                                Exceptions.throwIfFatal(ex4);
                                SubscriptionHelper.cancel(this.s);
                                errorAll(ex4);
                                return;
                            }
                        }
                        if (e == r) {
                            if (isDisposed()) {
                                q.clear();
                                return;
                            }
                            boolean d2 = this.done;
                            if (d2 && !this.delayError && (ex = this.error) != null) {
                                errorAll(ex);
                                return;
                            } else if (d2 && q.isEmpty()) {
                                Throwable ex5 = this.error;
                                if (ex5 != null) {
                                    errorAll(ex5);
                                    return;
                                } else {
                                    completeAll();
                                    return;
                                }
                            }
                        }
                        for (MulticastSubscription<T> ms3 : array) {
                            BackpressureHelper.produced(ms3, e);
                        }
                    }
                    this.consumed = upstreamConsumed;
                    missed = this.wip.addAndGet(-missed);
                    if (missed != 0) {
                        if (q == null) {
                            q = this.queue;
                        }
                    } else {
                        return;
                    }
                }
            }
        }

        void errorAll(Throwable ex) {
            MulticastSubscription<T>[] arr$ = this.subscribers.getAndSet(TERMINATED);
            for (MulticastSubscription<T> ms : arr$) {
                if (ms.get() != Long.MIN_VALUE) {
                    ms.actual.onError(ex);
                }
            }
        }

        void completeAll() {
            MulticastSubscription<T>[] arr$ = this.subscribers.getAndSet(TERMINATED);
            for (MulticastSubscription<T> ms : arr$) {
                if (ms.get() != Long.MIN_VALUE) {
                    ms.actual.onComplete();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class MulticastSubscription<T> extends AtomicLong implements Subscription {
        private static final long serialVersionUID = 8664815189257569791L;
        final Subscriber<? super T> actual;
        final MulticastProcessor<T> parent;

        MulticastSubscription(Subscriber<? super T> actual, MulticastProcessor<T> parent) {
            this.actual = actual;
            this.parent = parent;
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.addCancel(this, n);
                this.parent.drain();
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (getAndSet(Long.MIN_VALUE) != Long.MIN_VALUE) {
                this.parent.remove(this);
                this.parent.drain();
            }
        }

        public boolean isCancelled() {
            return get() == Long.MIN_VALUE;
        }
    }
}
