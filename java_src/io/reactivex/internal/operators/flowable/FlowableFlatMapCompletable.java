package io.reactivex.internal.operators.flowable;

import io.reactivex.CompletableObserver;
import io.reactivex.CompletableSource;
import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.annotations.Nullable;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.subscriptions.BasicIntQueueSubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableFlatMapCompletable<T> extends AbstractFlowableWithUpstream<T, T> {
    final boolean delayErrors;
    final Function<? super T, ? extends CompletableSource> mapper;
    final int maxConcurrency;

    public FlowableFlatMapCompletable(Flowable<T> source, Function<? super T, ? extends CompletableSource> mapper, boolean delayErrors, int maxConcurrency) {
        super(source);
        this.mapper = mapper;
        this.delayErrors = delayErrors;
        this.maxConcurrency = maxConcurrency;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> observer) {
        this.source.subscribe((FlowableSubscriber) new FlatMapCompletableMainSubscriber(observer, this.mapper, this.delayErrors, this.maxConcurrency));
    }

    /* loaded from: classes3.dex */
    static final class FlatMapCompletableMainSubscriber<T> extends BasicIntQueueSubscription<T> implements FlowableSubscriber<T> {
        private static final long serialVersionUID = 8443155186132538303L;
        final Subscriber<? super T> actual;
        final boolean delayErrors;
        final Function<? super T, ? extends CompletableSource> mapper;
        final int maxConcurrency;
        Subscription s;
        final AtomicThrowable errors = new AtomicThrowable();
        final CompositeDisposable set = new CompositeDisposable();

        FlatMapCompletableMainSubscriber(Subscriber<? super T> observer, Function<? super T, ? extends CompletableSource> mapper, boolean delayErrors, int maxConcurrency) {
            this.actual = observer;
            this.mapper = mapper;
            this.delayErrors = delayErrors;
            this.maxConcurrency = maxConcurrency;
            lazySet(1);
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
                    s.request(m);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T value) {
            try {
                CompletableSource cs = (CompletableSource) ObjectHelper.requireNonNull(this.mapper.mo1190apply(value), "The mapper returned a null CompletableSource");
                getAndIncrement();
                FlatMapCompletableMainSubscriber<T>.InnerConsumer inner = new InnerConsumer();
                if (this.set.add(inner)) {
                    cs.subscribe(inner);
                }
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.s.cancel();
                onError(ex);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable e) {
            if (this.errors.addThrowable(e)) {
                if (this.delayErrors) {
                    if (decrementAndGet() == 0) {
                        Throwable ex = this.errors.terminate();
                        this.actual.onError(ex);
                        return;
                    } else if (this.maxConcurrency != Integer.MAX_VALUE) {
                        this.s.request(1L);
                        return;
                    } else {
                        return;
                    }
                }
                cancel();
                if (getAndSet(0) > 0) {
                    Throwable ex2 = this.errors.terminate();
                    this.actual.onError(ex2);
                    return;
                }
                return;
            }
            RxJavaPlugins.onError(e);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (decrementAndGet() == 0) {
                Throwable ex = this.errors.terminate();
                if (ex != null) {
                    this.actual.onError(ex);
                } else {
                    this.actual.onComplete();
                }
            } else if (this.maxConcurrency != Integer.MAX_VALUE) {
                this.s.request(1L);
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.s.cancel();
            this.set.dispose();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public T mo1188poll() throws Exception {
            return null;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public boolean isEmpty() {
            return true;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public void clear() {
        }

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public int requestFusion(int mode) {
            return mode & 2;
        }

        void innerComplete(FlatMapCompletableMainSubscriber<T>.InnerConsumer inner) {
            this.set.delete(inner);
            onComplete();
        }

        void innerError(FlatMapCompletableMainSubscriber<T>.InnerConsumer inner, Throwable e) {
            this.set.delete(inner);
            onError(e);
        }

        /* loaded from: classes3.dex */
        final class InnerConsumer extends AtomicReference<Disposable> implements CompletableObserver, Disposable {
            private static final long serialVersionUID = 8606673141535671828L;

            InnerConsumer() {
            }

            @Override // io.reactivex.CompletableObserver
            public void onSubscribe(Disposable d) {
                DisposableHelper.setOnce(this, d);
            }

            @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
            public void onComplete() {
                FlatMapCompletableMainSubscriber.this.innerComplete(this);
            }

            @Override // io.reactivex.CompletableObserver
            public void onError(Throwable e) {
                FlatMapCompletableMainSubscriber.this.innerError(this, e);
            }

            @Override // io.reactivex.disposables.Disposable
            public void dispose() {
                DisposableHelper.dispose(this);
            }

            @Override // io.reactivex.disposables.Disposable
            public boolean isDisposed() {
                return DisposableHelper.isDisposed(get());
            }
        }
    }
}