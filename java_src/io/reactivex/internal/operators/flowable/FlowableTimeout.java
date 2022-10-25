package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.subscribers.FullArbiterSubscriber;
import io.reactivex.internal.subscriptions.FullArbiter;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import io.reactivex.subscribers.DisposableSubscriber;
import io.reactivex.subscribers.SerializedSubscriber;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableTimeout<T, U, V> extends AbstractFlowableWithUpstream<T, T> {
    final Publisher<U> firstTimeoutIndicator;
    final Function<? super T, ? extends Publisher<V>> itemTimeoutIndicator;
    final Publisher<? extends T> other;

    /* loaded from: classes3.dex */
    interface OnTimeout {
        void onError(Throwable th);

        void timeout(long j);
    }

    public FlowableTimeout(Flowable<T> source, Publisher<U> firstTimeoutIndicator, Function<? super T, ? extends Publisher<V>> itemTimeoutIndicator, Publisher<? extends T> other) {
        super(source);
        this.firstTimeoutIndicator = firstTimeoutIndicator;
        this.itemTimeoutIndicator = itemTimeoutIndicator;
        this.other = other;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> s) {
        if (this.other == null) {
            this.source.subscribe((FlowableSubscriber) new TimeoutSubscriber(new SerializedSubscriber(s), this.firstTimeoutIndicator, this.itemTimeoutIndicator));
        } else {
            this.source.subscribe((FlowableSubscriber) new TimeoutOtherSubscriber(s, this.firstTimeoutIndicator, this.itemTimeoutIndicator, this.other));
        }
    }

    /* loaded from: classes3.dex */
    static final class TimeoutSubscriber<T, U, V> implements FlowableSubscriber<T>, Subscription, OnTimeout {
        final Subscriber<? super T> actual;
        volatile boolean cancelled;
        final Publisher<U> firstTimeoutIndicator;
        volatile long index;
        final Function<? super T, ? extends Publisher<V>> itemTimeoutIndicator;
        Subscription s;
        final AtomicReference<Disposable> timeout = new AtomicReference<>();

        TimeoutSubscriber(Subscriber<? super T> actual, Publisher<U> firstTimeoutIndicator, Function<? super T, ? extends Publisher<V>> itemTimeoutIndicator) {
            this.actual = actual;
            this.firstTimeoutIndicator = firstTimeoutIndicator;
            this.itemTimeoutIndicator = itemTimeoutIndicator;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                if (!this.cancelled) {
                    Subscriber<? super T> a = this.actual;
                    Publisher<U> p = this.firstTimeoutIndicator;
                    if (p != null) {
                        TimeoutInnerSubscriber<T, U, V> tis = new TimeoutInnerSubscriber<>(this, 0L);
                        if (this.timeout.compareAndSet(null, tis)) {
                            a.onSubscribe(this);
                            p.subscribe(tis);
                            return;
                        }
                        return;
                    }
                    a.onSubscribe(this);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            long idx = this.index + 1;
            this.index = idx;
            this.actual.onNext(t);
            Disposable d = this.timeout.get();
            if (d != null) {
                d.dispose();
            }
            try {
                Publisher<V> p = (Publisher) ObjectHelper.requireNonNull(this.itemTimeoutIndicator.mo1190apply(t), "The publisher returned is null");
                TimeoutInnerSubscriber<T, U, V> tis = new TimeoutInnerSubscriber<>(this, idx);
                if (this.timeout.compareAndSet(d, tis)) {
                    p.subscribe(tis);
                }
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                cancel();
                this.actual.onError(e);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            cancel();
            this.actual.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            cancel();
            this.actual.onComplete();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            this.s.request(n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.cancelled = true;
            this.s.cancel();
            DisposableHelper.dispose(this.timeout);
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableTimeout.OnTimeout
        public void timeout(long idx) {
            if (idx == this.index) {
                cancel();
                this.actual.onError(new TimeoutException());
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class TimeoutInnerSubscriber<T, U, V> extends DisposableSubscriber<Object> {
        boolean done;
        final long index;
        final OnTimeout parent;

        TimeoutInnerSubscriber(OnTimeout parent, long index) {
            this.parent = parent;
            this.index = index;
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(Object t) {
            if (!this.done) {
                this.done = true;
                cancel();
                this.parent.timeout(this.index);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.parent.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.parent.timeout(this.index);
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class TimeoutOtherSubscriber<T, U, V> implements FlowableSubscriber<T>, Disposable, OnTimeout {
        final Subscriber<? super T> actual;
        final FullArbiter<T> arbiter;
        volatile boolean cancelled;
        boolean done;
        final Publisher<U> firstTimeoutIndicator;
        volatile long index;
        final Function<? super T, ? extends Publisher<V>> itemTimeoutIndicator;
        final Publisher<? extends T> other;
        Subscription s;
        final AtomicReference<Disposable> timeout = new AtomicReference<>();

        TimeoutOtherSubscriber(Subscriber<? super T> actual, Publisher<U> firstTimeoutIndicator, Function<? super T, ? extends Publisher<V>> itemTimeoutIndicator, Publisher<? extends T> other) {
            this.actual = actual;
            this.firstTimeoutIndicator = firstTimeoutIndicator;
            this.itemTimeoutIndicator = itemTimeoutIndicator;
            this.other = other;
            this.arbiter = new FullArbiter<>(actual, this, 8);
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                if (this.arbiter.setSubscription(s)) {
                    Subscriber<? super T> a = this.actual;
                    Publisher<U> p = this.firstTimeoutIndicator;
                    if (p != null) {
                        TimeoutInnerSubscriber<T, U, V> tis = new TimeoutInnerSubscriber<>(this, 0L);
                        if (this.timeout.compareAndSet(null, tis)) {
                            a.onSubscribe(this.arbiter);
                            p.subscribe(tis);
                            return;
                        }
                        return;
                    }
                    a.onSubscribe(this.arbiter);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                long idx = this.index + 1;
                this.index = idx;
                if (this.arbiter.onNext(t, this.s)) {
                    Disposable d = this.timeout.get();
                    if (d != null) {
                        d.dispose();
                    }
                    try {
                        Publisher<V> p = (Publisher) ObjectHelper.requireNonNull(this.itemTimeoutIndicator.mo1190apply(t), "The publisher returned is null");
                        TimeoutInnerSubscriber<T, U, V> tis = new TimeoutInnerSubscriber<>(this, idx);
                        if (this.timeout.compareAndSet(d, tis)) {
                            p.subscribe(tis);
                        }
                    } catch (Throwable e) {
                        Exceptions.throwIfFatal(e);
                        this.actual.onError(e);
                    }
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            dispose();
            this.arbiter.onError(t, this.s);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                dispose();
                this.arbiter.onComplete(this.s);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.cancelled = true;
            this.s.cancel();
            DisposableHelper.dispose(this.timeout);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableTimeout.OnTimeout
        public void timeout(long idx) {
            if (idx == this.index) {
                dispose();
                this.other.subscribe(new FullArbiterSubscriber(this.arbiter));
            }
        }
    }
}
