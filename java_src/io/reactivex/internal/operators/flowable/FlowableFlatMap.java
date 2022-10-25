package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimplePlainQueue;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableFlatMap<T, U> extends AbstractFlowableWithUpstream<T, U> {
    final int bufferSize;
    final boolean delayErrors;
    final Function<? super T, ? extends Publisher<? extends U>> mapper;
    final int maxConcurrency;

    public FlowableFlatMap(Flowable<T> source, Function<? super T, ? extends Publisher<? extends U>> mapper, boolean delayErrors, int maxConcurrency, int bufferSize) {
        super(source);
        this.mapper = mapper;
        this.delayErrors = delayErrors;
        this.maxConcurrency = maxConcurrency;
        this.bufferSize = bufferSize;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super U> s) {
        if (!FlowableScalarXMap.tryScalarXMapSubscribe(this.source, s, this.mapper)) {
            this.source.subscribe((FlowableSubscriber) subscribe(s, this.mapper, this.delayErrors, this.maxConcurrency, this.bufferSize));
        }
    }

    public static <T, U> FlowableSubscriber<T> subscribe(Subscriber<? super U> s, Function<? super T, ? extends Publisher<? extends U>> mapper, boolean delayErrors, int maxConcurrency, int bufferSize) {
        return new MergeSubscriber(s, mapper, delayErrors, maxConcurrency, bufferSize);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class MergeSubscriber<T, U> extends AtomicInteger implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = -2117620485640801370L;
        final Subscriber<? super U> actual;
        final int bufferSize;
        volatile boolean cancelled;
        final boolean delayErrors;
        volatile boolean done;
        long lastId;
        int lastIndex;
        final Function<? super T, ? extends Publisher<? extends U>> mapper;
        final int maxConcurrency;
        volatile SimplePlainQueue<U> queue;
        Subscription s;
        int scalarEmitted;
        final int scalarLimit;
        long uniqueId;
        static final InnerSubscriber<?, ?>[] EMPTY = new InnerSubscriber[0];
        static final InnerSubscriber<?, ?>[] CANCELLED = new InnerSubscriber[0];
        final AtomicThrowable errs = new AtomicThrowable();
        final AtomicReference<InnerSubscriber<?, ?>[]> subscribers = new AtomicReference<>();
        final AtomicLong requested = new AtomicLong();

        MergeSubscriber(Subscriber<? super U> actual, Function<? super T, ? extends Publisher<? extends U>> mapper, boolean delayErrors, int maxConcurrency, int bufferSize) {
            this.actual = actual;
            this.mapper = mapper;
            this.delayErrors = delayErrors;
            this.maxConcurrency = maxConcurrency;
            this.bufferSize = bufferSize;
            this.scalarLimit = Math.max(1, maxConcurrency >> 1);
            this.subscribers.lazySet(EMPTY);
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
                if (!this.cancelled) {
                    if (this.maxConcurrency == Integer.MAX_VALUE) {
                        s.request(Long.MAX_VALUE);
                    } else {
                        s.request(this.maxConcurrency);
                    }
                }
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                try {
                    Publisher<? extends U> p = (Publisher) ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The mapper returned a null Publisher");
                    if (p instanceof Callable) {
                        try {
                            Object call = ((Callable) p).call();
                            if (call != null) {
                                tryEmitScalar(call);
                                return;
                            } else if (this.maxConcurrency == Integer.MAX_VALUE || this.cancelled) {
                                return;
                            } else {
                                int i = this.scalarEmitted + 1;
                                this.scalarEmitted = i;
                                if (i == this.scalarLimit) {
                                    this.scalarEmitted = 0;
                                    this.s.request(this.scalarLimit);
                                    return;
                                }
                                return;
                            }
                        } catch (Throwable ex) {
                            Exceptions.throwIfFatal(ex);
                            this.errs.addThrowable(ex);
                            drain();
                            return;
                        }
                    }
                    long j = this.uniqueId;
                    this.uniqueId = 1 + j;
                    InnerSubscriber<T, U> inner = new InnerSubscriber<>(this, j);
                    if (addInner(inner)) {
                        p.subscribe(inner);
                    }
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    this.s.cancel();
                    onError(e);
                }
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        boolean addInner(InnerSubscriber<T, U> inner) {
            InnerSubscriber<?, ?>[] a;
            InnerSubscriber[] innerSubscriberArr;
            do {
                a = this.subscribers.get();
                if (a == CANCELLED) {
                    inner.dispose();
                    return false;
                }
                int n = a.length;
                innerSubscriberArr = new InnerSubscriber[n + 1];
                System.arraycopy(a, 0, innerSubscriberArr, 0, n);
                innerSubscriberArr[n] = inner;
            } while (!this.subscribers.compareAndSet(a, innerSubscriberArr));
            return true;
        }

        void removeInner(InnerSubscriber<T, U> inner) {
            InnerSubscriber<?, ?>[] a;
            InnerSubscriber<?, ?>[] b;
            do {
                a = this.subscribers.get();
                if (a != CANCELLED && a != EMPTY) {
                    int n = a.length;
                    int j = -1;
                    int i = 0;
                    while (true) {
                        if (i >= n) {
                            break;
                        } else if (a[i] != inner) {
                            i++;
                        } else {
                            j = i;
                            break;
                        }
                    }
                    if (j >= 0) {
                        if (n == 1) {
                            b = EMPTY;
                        } else {
                            b = new InnerSubscriber[n - 1];
                            System.arraycopy(a, 0, b, 0, j);
                            System.arraycopy(a, j + 1, b, j, (n - j) - 1);
                        }
                    } else {
                        return;
                    }
                } else {
                    return;
                }
            } while (!this.subscribers.compareAndSet(a, b));
        }

        SimpleQueue<U> getMainQueue() {
            SimplePlainQueue<U> q = this.queue;
            if (q == null) {
                if (this.maxConcurrency == Integer.MAX_VALUE) {
                    q = new SpscLinkedArrayQueue<>(this.bufferSize);
                } else {
                    q = new SpscArrayQueue<>(this.maxConcurrency);
                }
                this.queue = q;
            }
            return q;
        }

        void tryEmitScalar(U value) {
            if (get() == 0 && compareAndSet(0, 1)) {
                long r = this.requested.get();
                SimpleQueue<U> q = this.queue;
                if (r != 0 && (q == null || q.isEmpty())) {
                    this.actual.onNext(value);
                    if (r != Long.MAX_VALUE) {
                        this.requested.decrementAndGet();
                    }
                    if (this.maxConcurrency != Integer.MAX_VALUE && !this.cancelled) {
                        int i = this.scalarEmitted + 1;
                        this.scalarEmitted = i;
                        if (i == this.scalarLimit) {
                            this.scalarEmitted = 0;
                            this.s.request(this.scalarLimit);
                        }
                    }
                } else {
                    if (q == null) {
                        q = getMainQueue();
                    }
                    if (!q.offer(value)) {
                        onError(new IllegalStateException("Scalar queue full?!"));
                        return;
                    }
                }
                if (decrementAndGet() == 0) {
                    return;
                }
            } else if (!getMainQueue().offer(value)) {
                onError(new IllegalStateException("Scalar queue full?!"));
                return;
            } else if (getAndIncrement() != 0) {
                return;
            }
            drainLoop();
        }

        SimpleQueue<U> getInnerQueue(InnerSubscriber<T, U> inner) {
            SimpleQueue<U> q = inner.queue;
            if (q == null) {
                SimpleQueue<U> q2 = new SpscArrayQueue<>(this.bufferSize);
                inner.queue = q2;
                return q2;
            }
            return q;
        }

        void tryEmit(U value, InnerSubscriber<T, U> inner) {
            if (get() == 0 && compareAndSet(0, 1)) {
                long r = this.requested.get();
                SimpleQueue<U> q = inner.queue;
                if (r != 0 && (q == null || q.isEmpty())) {
                    this.actual.onNext(value);
                    if (r != Long.MAX_VALUE) {
                        this.requested.decrementAndGet();
                    }
                    inner.requestMore(1L);
                } else {
                    if (q == null) {
                        q = getInnerQueue(inner);
                    }
                    if (!q.offer(value)) {
                        onError(new MissingBackpressureException("Inner queue full?!"));
                        return;
                    }
                }
                if (decrementAndGet() == 0) {
                    return;
                }
            } else {
                SimpleQueue<U> q2 = inner.queue;
                if (q2 == null) {
                    q2 = new SpscArrayQueue<>(this.bufferSize);
                    inner.queue = q2;
                }
                if (!q2.offer(value)) {
                    onError(new MissingBackpressureException("Inner queue full?!"));
                    return;
                } else if (getAndIncrement() != 0) {
                    return;
                }
            }
            drainLoop();
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
            } else if (this.errs.addThrowable(t)) {
                this.done = true;
                drain();
            } else {
                RxJavaPlugins.onError(t);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                drain();
            }
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
            SimpleQueue<U> q;
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.cancel();
                disposeAll();
                if (getAndIncrement() == 0 && (q = this.queue) != null) {
                    q.clear();
                }
            }
        }

        void drain() {
            if (getAndIncrement() == 0) {
                drainLoop();
            }
        }

        void drainLoop() {
            U u;
            Subscriber<? super U> child = this.actual;
            int missed = 1;
            while (!checkTerminate()) {
                SimplePlainQueue<U> svq = this.queue;
                long r = this.requested.get();
                boolean unbounded = r == Long.MAX_VALUE;
                long replenishMain = 0;
                if (svq != null) {
                    do {
                        long scalarEmission = 0;
                        u = (U) null;
                        while (r != 0) {
                            u = svq.mo1188poll();
                            if (!checkTerminate()) {
                                if (u == null) {
                                    break;
                                }
                                child.onNext(u);
                                replenishMain++;
                                scalarEmission++;
                                r--;
                            } else {
                                return;
                            }
                        }
                        if (scalarEmission != 0) {
                            if (unbounded) {
                                r = Long.MAX_VALUE;
                            } else {
                                r = this.requested.addAndGet(-scalarEmission);
                            }
                        }
                        if (r == 0) {
                            break;
                        }
                    } while (u != null);
                }
                boolean d = this.done;
                SimplePlainQueue<U> svq2 = this.queue;
                InnerSubscriber<?, ?>[] inner = this.subscribers.get();
                int n = inner.length;
                if (d && ((svq2 == null || svq2.isEmpty()) && n == 0)) {
                    Throwable ex = this.errs.terminate();
                    if (ex != ExceptionHelper.TERMINATED) {
                        if (ex == null) {
                            child.onComplete();
                            return;
                        } else {
                            child.onError(ex);
                            return;
                        }
                    }
                    return;
                }
                boolean innerCompleted = false;
                if (n != 0) {
                    long startId = this.lastId;
                    int index = this.lastIndex;
                    if (n <= index || inner[index].id != startId) {
                        if (n <= index) {
                            index = 0;
                        }
                        int j = index;
                        for (int i = 0; i < n && inner[j].id != startId; i++) {
                            j++;
                            if (j == n) {
                                j = 0;
                            }
                        }
                        index = j;
                        this.lastIndex = j;
                        this.lastId = inner[j].id;
                    }
                    int j2 = index;
                    int i2 = 0;
                    while (i2 < n) {
                        if (!checkTerminate()) {
                            InnerSubscriber<T, U> is = inner[j2];
                            U u2 = null;
                            while (!checkTerminate()) {
                                SimpleQueue<U> q = is.queue;
                                if (q != null) {
                                    long produced = 0;
                                    while (r != 0) {
                                        try {
                                            u2 = q.mo1188poll();
                                            if (u2 == null) {
                                                break;
                                            }
                                            child.onNext(u2);
                                            if (!checkTerminate()) {
                                                r--;
                                                produced++;
                                            } else {
                                                return;
                                            }
                                        } catch (Throwable ex2) {
                                            Exceptions.throwIfFatal(ex2);
                                            is.dispose();
                                            this.errs.addThrowable(ex2);
                                            if (!checkTerminate()) {
                                                removeInner(is);
                                                innerCompleted = true;
                                                i2++;
                                            } else {
                                                return;
                                            }
                                        }
                                    }
                                    if (produced != 0) {
                                        if (!unbounded) {
                                            r = this.requested.addAndGet(-produced);
                                        } else {
                                            r = Long.MAX_VALUE;
                                        }
                                        is.requestMore(produced);
                                    }
                                    if (r != 0) {
                                        if (u2 == null) {
                                        }
                                    }
                                }
                                boolean innerDone = is.done;
                                SimpleQueue<U> innerQueue = is.queue;
                                if (innerDone && (innerQueue == null || innerQueue.isEmpty())) {
                                    removeInner(is);
                                    if (!checkTerminate()) {
                                        replenishMain++;
                                        innerCompleted = true;
                                    } else {
                                        return;
                                    }
                                }
                                if (r == 0) {
                                    break;
                                }
                                j2++;
                                if (j2 == n) {
                                    j2 = 0;
                                }
                                i2++;
                            }
                            return;
                        }
                        return;
                    }
                    this.lastIndex = j2;
                    this.lastId = inner[j2].id;
                }
                if (replenishMain != 0 && !this.cancelled) {
                    this.s.request(replenishMain);
                }
                if (!innerCompleted && (missed = addAndGet(-missed)) == 0) {
                    return;
                }
            }
        }

        boolean checkTerminate() {
            if (this.cancelled) {
                clearScalarQueue();
                return true;
            } else if (!this.delayErrors && this.errs.get() != null) {
                clearScalarQueue();
                Throwable ex = this.errs.terminate();
                if (ex == ExceptionHelper.TERMINATED) {
                    return true;
                }
                this.actual.onError(ex);
                return true;
            } else {
                return false;
            }
        }

        void clearScalarQueue() {
            SimpleQueue<U> q = this.queue;
            if (q != null) {
                q.clear();
            }
        }

        void disposeAll() {
            InnerSubscriber<?, ?>[] a = this.subscribers.get();
            if (a != CANCELLED) {
                InnerSubscriber<?, ?>[] a2 = this.subscribers.getAndSet(CANCELLED);
                InnerSubscriber<?, ?>[] a3 = a2;
                if (a3 != CANCELLED) {
                    for (InnerSubscriber<?, ?> inner : a3) {
                        inner.dispose();
                    }
                    Throwable ex = this.errs.terminate();
                    if (ex != null && ex != ExceptionHelper.TERMINATED) {
                        RxJavaPlugins.onError(ex);
                    }
                }
            }
        }

        void innerError(InnerSubscriber<T, U> inner, Throwable t) {
            if (this.errs.addThrowable(t)) {
                inner.done = true;
                if (!this.delayErrors) {
                    this.s.cancel();
                    InnerSubscriber<?, ?>[] arr$ = this.subscribers.getAndSet(CANCELLED);
                    for (InnerSubscriber<?, ?> a : arr$) {
                        a.dispose();
                    }
                }
                drain();
                return;
            }
            RxJavaPlugins.onError(t);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class InnerSubscriber<T, U> extends AtomicReference<Subscription> implements FlowableSubscriber<U>, Disposable {
        private static final long serialVersionUID = -4606175640614850599L;
        final int bufferSize;
        volatile boolean done;
        int fusionMode;
        final long id;
        final int limit;
        final MergeSubscriber<T, U> parent;
        long produced;
        volatile SimpleQueue<U> queue;

        InnerSubscriber(MergeSubscriber<T, U> parent, long id) {
            this.id = id;
            this.parent = parent;
            this.bufferSize = parent.bufferSize;
            this.limit = this.bufferSize >> 2;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.setOnce(this, s)) {
                if (s instanceof QueueSubscription) {
                    QueueSubscription<U> qs = (QueueSubscription) s;
                    int m = qs.requestFusion(7);
                    if (m == 1) {
                        this.fusionMode = m;
                        this.queue = qs;
                        this.done = true;
                        this.parent.drain();
                        return;
                    } else if (m == 2) {
                        this.fusionMode = m;
                        this.queue = qs;
                    }
                }
                s.request(this.bufferSize);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(U t) {
            if (this.fusionMode != 2) {
                this.parent.tryEmit(t, this);
            } else {
                this.parent.drain();
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            lazySet(SubscriptionHelper.CANCELLED);
            this.parent.innerError(this, t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.done = true;
            this.parent.drain();
        }

        void requestMore(long n) {
            if (this.fusionMode != 1) {
                long p = this.produced + n;
                if (p >= this.limit) {
                    this.produced = 0L;
                    get().request(p);
                    return;
                }
                this.produced = p;
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            SubscriptionHelper.cancel(this);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return get() == SubscriptionHelper.CANCELLED;
        }
    }
}
