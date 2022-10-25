package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.SimplePlainQueue;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.internal.subscribers.QueueDrainSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;
import io.reactivex.processors.UnicastProcessor;
import io.reactivex.subscribers.DisposableSubscriber;
import io.reactivex.subscribers.SerializedSubscriber;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableWindowBoundarySupplier<T, B> extends AbstractFlowableWithUpstream<T, Flowable<T>> {
    final int bufferSize;
    final Callable<? extends Publisher<B>> other;

    public FlowableWindowBoundarySupplier(Flowable<T> source, Callable<? extends Publisher<B>> other, int bufferSize) {
        super(source);
        this.other = other;
        this.bufferSize = bufferSize;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super Flowable<T>> s) {
        this.source.subscribe((FlowableSubscriber) new WindowBoundaryMainSubscriber(new SerializedSubscriber(s), this.other, this.bufferSize));
    }

    /* loaded from: classes3.dex */
    static final class WindowBoundaryMainSubscriber<T, B> extends QueueDrainSubscriber<T, Object, Flowable<T>> implements Subscription {
        static final Object NEXT = new Object();
        final AtomicReference<Disposable> boundary;
        final int bufferSize;
        final Callable<? extends Publisher<B>> other;
        Subscription s;
        UnicastProcessor<T> window;
        final AtomicLong windows;

        WindowBoundaryMainSubscriber(Subscriber<? super Flowable<T>> actual, Callable<? extends Publisher<B>> other, int bufferSize) {
            super(actual, new MpscLinkedQueue());
            this.boundary = new AtomicReference<>();
            this.windows = new AtomicLong();
            this.other = other;
            this.bufferSize = bufferSize;
            this.windows.lazySet(1L);
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                Subscriber<? super V> subscriber = this.actual;
                subscriber.onSubscribe(this);
                if (!this.cancelled) {
                    try {
                        Publisher<B> p = (Publisher) ObjectHelper.requireNonNull(this.other.call(), "The first window publisher supplied is null");
                        UnicastProcessor<T> w = UnicastProcessor.create(this.bufferSize);
                        long r = requested();
                        if (r != 0) {
                            subscriber.onNext(w);
                            if (r != Long.MAX_VALUE) {
                                produced(1L);
                            }
                            this.window = w;
                            WindowBoundaryInnerSubscriber<T, B> inner = new WindowBoundaryInnerSubscriber<>(this);
                            if (this.boundary.compareAndSet(null, inner)) {
                                this.windows.getAndIncrement();
                                s.request(Long.MAX_VALUE);
                                p.subscribe(inner);
                                return;
                            }
                            return;
                        }
                        s.cancel();
                        subscriber.onError(new MissingBackpressureException("Could not deliver first window due to lack of requests"));
                    } catch (Throwable e) {
                        Exceptions.throwIfFatal(e);
                        s.cancel();
                        subscriber.onError(e);
                    }
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                if (fastEnter()) {
                    UnicastProcessor<T> w = this.window;
                    w.onNext(t);
                    if (leave(-1) == 0) {
                        return;
                    }
                } else {
                    this.queue.offer(NotificationLite.next(t));
                    if (!enter()) {
                        return;
                    }
                }
                drainLoop();
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
            if (enter()) {
                drainLoop();
            }
            if (this.windows.decrementAndGet() == 0) {
                DisposableHelper.dispose(this.boundary);
            }
            this.actual.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                if (enter()) {
                    drainLoop();
                }
                if (this.windows.decrementAndGet() == 0) {
                    DisposableHelper.dispose(this.boundary);
                }
                this.actual.onComplete();
            }
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            requested(n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.cancelled = true;
        }

        /* JADX WARN: Multi-variable type inference failed */
        void drainLoop() {
            SimplePlainQueue<Object> q = this.queue;
            Subscriber<? super V> subscriber = this.actual;
            int missed = 1;
            UnicastProcessor<T> unicastProcessor = this.window;
            while (true) {
                boolean d = this.done;
                Object o = q.mo1188poll();
                boolean empty = o == null;
                if (d && empty) {
                    DisposableHelper.dispose(this.boundary);
                    Throwable e = this.error;
                    if (e != null) {
                        UnicastProcessor<T> w = unicastProcessor;
                        w.onError(e);
                        return;
                    }
                    UnicastProcessor<T> w2 = unicastProcessor;
                    w2.onComplete();
                    return;
                } else if (!empty) {
                    if (o == NEXT) {
                        UnicastProcessor<T> w3 = unicastProcessor;
                        w3.onComplete();
                        if (this.windows.decrementAndGet() == 0) {
                            DisposableHelper.dispose(this.boundary);
                            return;
                        } else if (!this.cancelled) {
                            try {
                                Publisher<B> p = (Publisher) ObjectHelper.requireNonNull(this.other.call(), "The publisher supplied is null");
                                UnicastProcessor<T> w4 = UnicastProcessor.create(this.bufferSize);
                                unicastProcessor = w4;
                                long r = requested();
                                if (r != 0) {
                                    this.windows.getAndIncrement();
                                    subscriber.onNext(unicastProcessor);
                                    if (r != Long.MAX_VALUE) {
                                        produced(1L);
                                    }
                                    this.window = unicastProcessor;
                                    WindowBoundaryInnerSubscriber<T, B> b = new WindowBoundaryInnerSubscriber<>(this);
                                    if (this.boundary.compareAndSet(this.boundary.get(), b)) {
                                        p.subscribe(b);
                                    }
                                } else {
                                    this.cancelled = true;
                                    subscriber.onError(new MissingBackpressureException("Could not deliver new window due to lack of requests"));
                                }
                            } catch (Throwable e2) {
                                Exceptions.throwIfFatal(e2);
                                DisposableHelper.dispose(this.boundary);
                                subscriber.onError(e2);
                                return;
                            }
                        } else {
                            continue;
                        }
                    } else {
                        UnicastProcessor<T> w5 = unicastProcessor;
                        w5.onNext(NotificationLite.getValue(o));
                    }
                } else {
                    missed = leave(-missed);
                    if (missed == 0) {
                        return;
                    }
                }
            }
        }

        void next() {
            this.queue.offer(NEXT);
            if (enter()) {
                drainLoop();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class WindowBoundaryInnerSubscriber<T, B> extends DisposableSubscriber<B> {
        boolean done;
        final WindowBoundaryMainSubscriber<T, B> parent;

        WindowBoundaryInnerSubscriber(WindowBoundaryMainSubscriber<T, B> parent) {
            this.parent = parent;
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(B t) {
            if (!this.done) {
                this.done = true;
                cancel();
                this.parent.next();
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
                this.parent.onComplete();
            }
        }
    }
}
