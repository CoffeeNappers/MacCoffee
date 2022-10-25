package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionArbiter;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.ErrorMode;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicInteger;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableConcatMap<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final ErrorMode errorMode;
    final Function<? super T, ? extends Publisher<? extends R>> mapper;
    final int prefetch;

    /* loaded from: classes3.dex */
    interface ConcatMapSupport<T> {
        void innerComplete();

        void innerError(Throwable th);

        void innerNext(T t);
    }

    public FlowableConcatMap(Flowable<T> source, Function<? super T, ? extends Publisher<? extends R>> mapper, int prefetch, ErrorMode errorMode) {
        super(source);
        this.mapper = mapper;
        this.prefetch = prefetch;
        this.errorMode = errorMode;
    }

    public static <T, R> Subscriber<T> subscribe(Subscriber<? super R> s, Function<? super T, ? extends Publisher<? extends R>> mapper, int prefetch, ErrorMode errorMode) {
        switch (errorMode) {
            case BOUNDARY:
                return new ConcatMapDelayed(s, mapper, prefetch, false);
            case END:
                return new ConcatMapDelayed(s, mapper, prefetch, true);
            default:
                return new ConcatMapImmediate(s, mapper, prefetch);
        }
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super R> s) {
        if (!FlowableScalarXMap.tryScalarXMapSubscribe(this.source, s, this.mapper)) {
            this.source.subscribe(subscribe(s, this.mapper, this.prefetch, this.errorMode));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static abstract class BaseConcatMapSubscriber<T, R> extends AtomicInteger implements FlowableSubscriber<T>, ConcatMapSupport<R>, Subscription {
        private static final long serialVersionUID = -3511336836796789179L;
        volatile boolean active;
        volatile boolean cancelled;
        int consumed;
        volatile boolean done;
        final int limit;
        final Function<? super T, ? extends Publisher<? extends R>> mapper;
        final int prefetch;
        SimpleQueue<T> queue;
        Subscription s;
        int sourceMode;
        final ConcatMapInner<R> inner = new ConcatMapInner<>(this);
        final AtomicThrowable errors = new AtomicThrowable();

        abstract void drain();

        abstract void subscribeActual();

        BaseConcatMapSubscriber(Function<? super T, ? extends Publisher<? extends R>> mapper, int prefetch) {
            this.mapper = mapper;
            this.prefetch = prefetch;
            this.limit = prefetch - (prefetch >> 2);
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public final void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                if (s instanceof QueueSubscription) {
                    QueueSubscription<T> f = (QueueSubscription) s;
                    int m = f.requestFusion(3);
                    if (m == 1) {
                        this.sourceMode = m;
                        this.queue = f;
                        this.done = true;
                        subscribeActual();
                        drain();
                        return;
                    } else if (m == 2) {
                        this.sourceMode = m;
                        this.queue = f;
                        subscribeActual();
                        s.request(this.prefetch);
                        return;
                    }
                }
                this.queue = new SpscArrayQueue(this.prefetch);
                subscribeActual();
                s.request(this.prefetch);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public final void onNext(T t) {
            if (this.sourceMode != 2 && !this.queue.offer(t)) {
                this.s.cancel();
                onError(new IllegalStateException("Queue full?!"));
                return;
            }
            drain();
        }

        @Override // org.reactivestreams.Subscriber
        public final void onComplete() {
            this.done = true;
            drain();
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableConcatMap.ConcatMapSupport
        public final void innerComplete() {
            this.active = false;
            drain();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ConcatMapImmediate<T, R> extends BaseConcatMapSubscriber<T, R> {
        private static final long serialVersionUID = 7898995095634264146L;
        final Subscriber<? super R> actual;
        final AtomicInteger wip;

        ConcatMapImmediate(Subscriber<? super R> actual, Function<? super T, ? extends Publisher<? extends R>> mapper, int prefetch) {
            super(mapper, prefetch);
            this.actual = actual;
            this.wip = new AtomicInteger();
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableConcatMap.BaseConcatMapSubscriber
        void subscribeActual() {
            this.actual.onSubscribe(this);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.errors.addThrowable(t)) {
                this.inner.cancel();
                if (getAndIncrement() == 0) {
                    this.actual.onError(this.errors.terminate());
                    return;
                }
                return;
            }
            RxJavaPlugins.onError(t);
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableConcatMap.ConcatMapSupport
        public void innerNext(R value) {
            if (get() == 0 && compareAndSet(0, 1)) {
                this.actual.onNext(value);
                if (!compareAndSet(1, 0)) {
                    this.actual.onError(this.errors.terminate());
                }
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableConcatMap.ConcatMapSupport
        public void innerError(Throwable e) {
            if (this.errors.addThrowable(e)) {
                this.s.cancel();
                if (getAndIncrement() == 0) {
                    this.actual.onError(this.errors.terminate());
                    return;
                }
                return;
            }
            RxJavaPlugins.onError(e);
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            this.inner.request(n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.inner.cancel();
                this.s.cancel();
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableConcatMap.BaseConcatMapSubscriber
        void drain() {
            if (this.wip.getAndIncrement() == 0) {
                while (!this.cancelled) {
                    if (!this.active) {
                        boolean d = this.done;
                        try {
                            T v = this.queue.mo1188poll();
                            boolean empty = v == null;
                            if (d && empty) {
                                this.actual.onComplete();
                                return;
                            } else if (!empty) {
                                try {
                                    Publisher<? extends R> p = (Publisher) ObjectHelper.requireNonNull(this.mapper.mo1190apply(v), "The mapper returned a null Publisher");
                                    if (this.sourceMode != 1) {
                                        int c = this.consumed + 1;
                                        if (c == this.limit) {
                                            this.consumed = 0;
                                            this.s.request(c);
                                        } else {
                                            this.consumed = c;
                                        }
                                    }
                                    if (p instanceof Callable) {
                                        Callable<R> callable = (Callable) p;
                                        try {
                                            Object call = callable.call();
                                            if (call == null) {
                                                continue;
                                            } else if (this.inner.isUnbounded()) {
                                                if (get() == 0 && compareAndSet(0, 1)) {
                                                    this.actual.onNext(call);
                                                    if (!compareAndSet(1, 0)) {
                                                        this.actual.onError(this.errors.terminate());
                                                        return;
                                                    }
                                                }
                                            } else {
                                                this.active = true;
                                                this.inner.setSubscription(new WeakScalarSubscription(call, this.inner));
                                            }
                                        } catch (Throwable e) {
                                            Exceptions.throwIfFatal(e);
                                            this.s.cancel();
                                            this.errors.addThrowable(e);
                                            this.actual.onError(this.errors.terminate());
                                            return;
                                        }
                                    } else {
                                        this.active = true;
                                        p.subscribe(this.inner);
                                    }
                                } catch (Throwable e2) {
                                    Exceptions.throwIfFatal(e2);
                                    this.s.cancel();
                                    this.errors.addThrowable(e2);
                                    this.actual.onError(this.errors.terminate());
                                    return;
                                }
                            }
                        } catch (Throwable e3) {
                            Exceptions.throwIfFatal(e3);
                            this.s.cancel();
                            this.errors.addThrowable(e3);
                            this.actual.onError(this.errors.terminate());
                            return;
                        }
                    }
                    if (this.wip.decrementAndGet() == 0) {
                        return;
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class WeakScalarSubscription<T> implements Subscription {
        final Subscriber<? super T> actual;
        boolean once;
        final T value;

        WeakScalarSubscription(T value, Subscriber<? super T> actual) {
            this.value = value;
            this.actual = actual;
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (n > 0 && !this.once) {
                this.once = true;
                Subscriber<? super T> a = this.actual;
                a.onNext((T) this.value);
                a.onComplete();
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ConcatMapDelayed<T, R> extends BaseConcatMapSubscriber<T, R> {
        private static final long serialVersionUID = -2945777694260521066L;
        final Subscriber<? super R> actual;
        final boolean veryEnd;

        ConcatMapDelayed(Subscriber<? super R> actual, Function<? super T, ? extends Publisher<? extends R>> mapper, int prefetch, boolean veryEnd) {
            super(mapper, prefetch);
            this.actual = actual;
            this.veryEnd = veryEnd;
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableConcatMap.BaseConcatMapSubscriber
        void subscribeActual() {
            this.actual.onSubscribe(this);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.errors.addThrowable(t)) {
                this.done = true;
                drain();
                return;
            }
            RxJavaPlugins.onError(t);
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableConcatMap.ConcatMapSupport
        public void innerNext(R value) {
            this.actual.onNext(value);
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableConcatMap.ConcatMapSupport
        public void innerError(Throwable e) {
            if (this.errors.addThrowable(e)) {
                if (!this.veryEnd) {
                    this.s.cancel();
                    this.done = true;
                }
                this.active = false;
                drain();
                return;
            }
            RxJavaPlugins.onError(e);
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            this.inner.request(n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.inner.cancel();
                this.s.cancel();
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableConcatMap.BaseConcatMapSubscriber
        void drain() {
            if (getAndIncrement() == 0) {
                while (!this.cancelled) {
                    if (!this.active) {
                        boolean d = this.done;
                        if (d && !this.veryEnd && this.errors.get() != null) {
                            this.actual.onError(this.errors.terminate());
                            return;
                        }
                        try {
                            T v = this.queue.mo1188poll();
                            boolean empty = v == null;
                            if (d && empty) {
                                Throwable ex = this.errors.terminate();
                                if (ex != null) {
                                    this.actual.onError(ex);
                                    return;
                                } else {
                                    this.actual.onComplete();
                                    return;
                                }
                            } else if (!empty) {
                                try {
                                    Publisher<? extends R> p = (Publisher) ObjectHelper.requireNonNull(this.mapper.mo1190apply(v), "The mapper returned a null Publisher");
                                    if (this.sourceMode != 1) {
                                        int c = this.consumed + 1;
                                        if (c == this.limit) {
                                            this.consumed = 0;
                                            this.s.request(c);
                                        } else {
                                            this.consumed = c;
                                        }
                                    }
                                    if (p instanceof Callable) {
                                        Callable<R> supplier = (Callable) p;
                                        try {
                                            Object call = supplier.call();
                                            if (call == null) {
                                                continue;
                                            } else if (this.inner.isUnbounded()) {
                                                this.actual.onNext(call);
                                            } else {
                                                this.active = true;
                                                this.inner.setSubscription(new WeakScalarSubscription(call, this.inner));
                                            }
                                        } catch (Throwable e) {
                                            Exceptions.throwIfFatal(e);
                                            this.s.cancel();
                                            this.errors.addThrowable(e);
                                            this.actual.onError(this.errors.terminate());
                                            return;
                                        }
                                    } else {
                                        this.active = true;
                                        p.subscribe(this.inner);
                                    }
                                } catch (Throwable e2) {
                                    Exceptions.throwIfFatal(e2);
                                    this.s.cancel();
                                    this.errors.addThrowable(e2);
                                    this.actual.onError(this.errors.terminate());
                                    return;
                                }
                            }
                        } catch (Throwable e3) {
                            Exceptions.throwIfFatal(e3);
                            this.s.cancel();
                            this.errors.addThrowable(e3);
                            this.actual.onError(this.errors.terminate());
                            return;
                        }
                    }
                    if (decrementAndGet() == 0) {
                        return;
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ConcatMapInner<R> extends SubscriptionArbiter implements FlowableSubscriber<R> {
        private static final long serialVersionUID = 897683679971470653L;
        final ConcatMapSupport<R> parent;
        long produced;

        ConcatMapInner(ConcatMapSupport<R> parent) {
            this.parent = parent;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            setSubscription(s);
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(R t) {
            this.produced++;
            this.parent.innerNext(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            long p = this.produced;
            if (p != 0) {
                this.produced = 0L;
                produced(p);
            }
            this.parent.innerError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            long p = this.produced;
            if (p != 0) {
                this.produced = 0L;
                produced(p);
            }
            this.parent.innerComplete();
        }
    }
}
