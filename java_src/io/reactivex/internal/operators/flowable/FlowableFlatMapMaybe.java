package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableFlatMapMaybe<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final boolean delayErrors;
    final Function<? super T, ? extends MaybeSource<? extends R>> mapper;
    final int maxConcurrency;

    public FlowableFlatMapMaybe(Flowable<T> source, Function<? super T, ? extends MaybeSource<? extends R>> mapper, boolean delayError, int maxConcurrency) {
        super(source);
        this.mapper = mapper;
        this.delayErrors = delayError;
        this.maxConcurrency = maxConcurrency;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super R> s) {
        this.source.subscribe((FlowableSubscriber) new FlatMapMaybeSubscriber(s, this.mapper, this.delayErrors, this.maxConcurrency));
    }

    /* loaded from: classes3.dex */
    static final class FlatMapMaybeSubscriber<T, R> extends AtomicInteger implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = 8600231336733376951L;
        final Subscriber<? super R> actual;
        volatile boolean cancelled;
        final boolean delayErrors;
        final Function<? super T, ? extends MaybeSource<? extends R>> mapper;
        final int maxConcurrency;
        Subscription s;
        final AtomicLong requested = new AtomicLong();
        final CompositeDisposable set = new CompositeDisposable();
        final AtomicThrowable errors = new AtomicThrowable();
        final AtomicInteger active = new AtomicInteger(1);
        final AtomicReference<SpscLinkedArrayQueue<R>> queue = new AtomicReference<>();

        FlatMapMaybeSubscriber(Subscriber<? super R> actual, Function<? super T, ? extends MaybeSource<? extends R>> mapper, boolean delayErrors, int maxConcurrency) {
            this.actual = actual;
            this.mapper = mapper;
            this.delayErrors = delayErrors;
            this.maxConcurrency = maxConcurrency;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
                int m = this.maxConcurrency;
                if (m == Integer.MAX_VALUE) {
                    s.request(Long.MAX_VALUE);
                } else {
                    s.request(this.maxConcurrency);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            try {
                MaybeSource<? extends R> ms = (MaybeSource) ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The mapper returned a null MaybeSource");
                this.active.getAndIncrement();
                FlatMapMaybeSubscriber<T, R>.InnerObserver inner = new InnerObserver();
                if (this.set.add(inner)) {
                    ms.subscribe(inner);
                }
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.s.cancel();
                onError(ex);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.active.decrementAndGet();
            if (this.errors.addThrowable(t)) {
                if (!this.delayErrors) {
                    this.set.dispose();
                }
                drain();
                return;
            }
            RxJavaPlugins.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.active.decrementAndGet();
            drain();
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.cancelled = true;
            this.s.cancel();
            this.set.dispose();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.add(this.requested, n);
                drain();
            }
        }

        void innerSuccess(FlatMapMaybeSubscriber<T, R>.InnerObserver inner, R value) {
            boolean d = true;
            this.set.delete(inner);
            if (get() == 0 && compareAndSet(0, 1)) {
                if (this.active.decrementAndGet() != 0) {
                    d = false;
                }
                if (this.requested.get() != 0) {
                    this.actual.onNext(value);
                    SpscLinkedArrayQueue<R> q = this.queue.get();
                    if (d && (q == null || q.isEmpty())) {
                        Throwable ex = this.errors.terminate();
                        if (ex != null) {
                            this.actual.onError(ex);
                            return;
                        } else {
                            this.actual.onComplete();
                            return;
                        }
                    }
                    BackpressureHelper.produced(this.requested, 1L);
                    if (this.maxConcurrency != Integer.MAX_VALUE) {
                        this.s.request(1L);
                    }
                } else {
                    SpscLinkedArrayQueue<R> q2 = getOrCreateQueue();
                    synchronized (q2) {
                        q2.offer(value);
                    }
                }
                if (decrementAndGet() == 0) {
                    return;
                }
            } else {
                SpscLinkedArrayQueue<R> q3 = getOrCreateQueue();
                synchronized (q3) {
                    q3.offer(value);
                }
                this.active.decrementAndGet();
                if (getAndIncrement() != 0) {
                    return;
                }
            }
            drainLoop();
        }

        /* JADX WARN: Generic types in debug info not equals: java.lang.Object != io.reactivex.internal.queue.SpscLinkedArrayQueue<R> */
        SpscLinkedArrayQueue<R> getOrCreateQueue() {
            SpscLinkedArrayQueue<R> current;
            do {
                SpscLinkedArrayQueue<R> current2 = this.queue.get();
                if (current2 != null) {
                    return current2;
                }
                current = new SpscLinkedArrayQueue<>(Flowable.bufferSize());
            } while (!this.queue.compareAndSet(null, current));
            return current;
        }

        void innerError(FlatMapMaybeSubscriber<T, R>.InnerObserver inner, Throwable e) {
            this.set.delete(inner);
            if (this.errors.addThrowable(e)) {
                if (!this.delayErrors) {
                    this.s.cancel();
                    this.set.dispose();
                }
                this.active.decrementAndGet();
                drain();
                return;
            }
            RxJavaPlugins.onError(e);
        }

        void innerComplete(FlatMapMaybeSubscriber<T, R>.InnerObserver inner) {
            boolean d = true;
            this.set.delete(inner);
            if (get() == 0 && compareAndSet(0, 1)) {
                if (this.active.decrementAndGet() != 0) {
                    d = false;
                }
                SpscLinkedArrayQueue<R> q = this.queue.get();
                if (d && (q == null || q.isEmpty())) {
                    Throwable ex = this.errors.terminate();
                    if (ex != null) {
                        this.actual.onError(ex);
                        return;
                    } else {
                        this.actual.onComplete();
                        return;
                    }
                } else if (decrementAndGet() != 0) {
                    drainLoop();
                    return;
                } else {
                    return;
                }
            }
            this.active.decrementAndGet();
            drain();
        }

        void drain() {
            if (getAndIncrement() == 0) {
                drainLoop();
            }
        }

        void clear() {
            SpscLinkedArrayQueue<R> q = this.queue.get();
            if (q != null) {
                q.clear();
            }
        }

        void drainLoop() {
            int missed = 1;
            Subscriber<? super R> a = this.actual;
            AtomicInteger n = this.active;
            AtomicReference<SpscLinkedArrayQueue<R>> qr = this.queue;
            do {
                long r = this.requested.get();
                long e = 0;
                while (e != r) {
                    if (this.cancelled) {
                        clear();
                        return;
                    } else if (!this.delayErrors && this.errors.get() != null) {
                        Throwable ex = this.errors.terminate();
                        clear();
                        a.onError(ex);
                        return;
                    } else {
                        boolean d = n.get() == 0;
                        SpscLinkedArrayQueue<R> q = qr.get();
                        R mo1188poll = q != null ? q.mo1188poll() : (Object) null;
                        boolean empty = mo1188poll == null;
                        if (d && empty) {
                            Throwable ex2 = this.errors.terminate();
                            if (ex2 != null) {
                                a.onError(ex2);
                                return;
                            } else {
                                a.onComplete();
                                return;
                            }
                        } else if (empty) {
                            break;
                        } else {
                            a.onNext(mo1188poll);
                            e++;
                        }
                    }
                }
                if (e == r) {
                    if (this.cancelled) {
                        clear();
                        return;
                    } else if (!this.delayErrors && this.errors.get() != null) {
                        Throwable ex3 = this.errors.terminate();
                        clear();
                        a.onError(ex3);
                        return;
                    } else {
                        boolean d2 = n.get() == 0;
                        SpscLinkedArrayQueue<R> q2 = qr.get();
                        boolean empty2 = q2 == null || q2.isEmpty();
                        if (d2 && empty2) {
                            Throwable ex4 = this.errors.terminate();
                            if (ex4 != null) {
                                a.onError(ex4);
                                return;
                            } else {
                                a.onComplete();
                                return;
                            }
                        }
                    }
                }
                if (e != 0) {
                    BackpressureHelper.produced(this.requested, e);
                    if (this.maxConcurrency != Integer.MAX_VALUE) {
                        this.s.request(e);
                    }
                }
                missed = addAndGet(-missed);
            } while (missed != 0);
        }

        /* loaded from: classes3.dex */
        final class InnerObserver extends AtomicReference<Disposable> implements MaybeObserver<R>, Disposable {
            private static final long serialVersionUID = -502562646270949838L;

            InnerObserver() {
            }

            @Override // io.reactivex.MaybeObserver
            public void onSubscribe(Disposable d) {
                DisposableHelper.setOnce(this, d);
            }

            @Override // io.reactivex.MaybeObserver
            public void onSuccess(R value) {
                FlatMapMaybeSubscriber.this.innerSuccess(this, value);
            }

            @Override // io.reactivex.MaybeObserver
            public void onError(Throwable e) {
                FlatMapMaybeSubscriber.this.innerError(this, e);
            }

            @Override // io.reactivex.MaybeObserver
            public void onComplete() {
                FlatMapMaybeSubscriber.this.innerComplete(this);
            }

            @Override // io.reactivex.disposables.Disposable
            public boolean isDisposed() {
                return DisposableHelper.isDisposed(get());
            }

            @Override // io.reactivex.disposables.Disposable
            public void dispose() {
                DisposableHelper.dispose(this);
            }
        }
    }
}
