package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.internal.subscribers.QueueDrainSubscriber;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.QueueDrainHelper;
import io.reactivex.plugins.RxJavaPlugins;
import io.reactivex.subscribers.DisposableSubscriber;
import io.reactivex.subscribers.SerializedSubscriber;
import java.util.Collection;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableBufferBoundarySupplier<T, U extends Collection<? super T>, B> extends AbstractFlowableWithUpstream<T, U> {
    final Callable<? extends Publisher<B>> boundarySupplier;
    final Callable<U> bufferSupplier;

    public FlowableBufferBoundarySupplier(Flowable<T> source, Callable<? extends Publisher<B>> boundarySupplier, Callable<U> bufferSupplier) {
        super(source);
        this.boundarySupplier = boundarySupplier;
        this.bufferSupplier = bufferSupplier;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super U> s) {
        this.source.subscribe((FlowableSubscriber) new BufferBoundarySupplierSubscriber(new SerializedSubscriber(s), this.bufferSupplier, this.boundarySupplier));
    }

    /* loaded from: classes3.dex */
    static final class BufferBoundarySupplierSubscriber<T, U extends Collection<? super T>, B> extends QueueDrainSubscriber<T, U, U> implements FlowableSubscriber<T>, Subscription, Disposable {
        final Callable<? extends Publisher<B>> boundarySupplier;
        U buffer;
        final Callable<U> bufferSupplier;
        final AtomicReference<Disposable> other;
        Subscription s;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.internal.subscribers.QueueDrainSubscriber, io.reactivex.internal.util.QueueDrain
        public /* bridge */ /* synthetic */ boolean accept(Subscriber x0, Object x1) {
            return accept((Subscriber<? super Subscriber>) x0, (Subscriber) ((Collection) x1));
        }

        BufferBoundarySupplierSubscriber(Subscriber<? super U> actual, Callable<U> bufferSupplier, Callable<? extends Publisher<B>> boundarySupplier) {
            super(actual, new MpscLinkedQueue());
            this.other = new AtomicReference<>();
            this.bufferSupplier = bufferSupplier;
            this.boundarySupplier = boundarySupplier;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                Subscriber<? super V> subscriber = this.actual;
                try {
                    U b = (U) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The buffer supplied is null");
                    this.buffer = b;
                    try {
                        Publisher<B> boundary = (Publisher) ObjectHelper.requireNonNull(this.boundarySupplier.call(), "The boundary publisher supplied is null");
                        BufferBoundarySubscriber<T, U, B> bs = new BufferBoundarySubscriber<>(this);
                        this.other.set(bs);
                        subscriber.onSubscribe(this);
                        if (!this.cancelled) {
                            s.request(Long.MAX_VALUE);
                            boundary.subscribe(bs);
                        }
                    } catch (Throwable ex) {
                        Exceptions.throwIfFatal(ex);
                        this.cancelled = true;
                        s.cancel();
                        EmptySubscription.error(ex, subscriber);
                    }
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    this.cancelled = true;
                    s.cancel();
                    EmptySubscription.error(e, subscriber);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            synchronized (this) {
                U b = this.buffer;
                if (b != null) {
                    b.add(t);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            cancel();
            this.actual.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            synchronized (this) {
                U b = this.buffer;
                if (b != null) {
                    this.buffer = null;
                    this.queue.offer(b);
                    this.done = true;
                    if (enter()) {
                        QueueDrainHelper.drainMaxLoop(this.queue, this.actual, false, this, this);
                    }
                }
            }
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            requested(n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.cancel();
                disposeOther();
                if (enter()) {
                    this.queue.clear();
                }
            }
        }

        void disposeOther() {
            DisposableHelper.dispose(this.other);
        }

        void next() {
            try {
                U next = (U) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The buffer supplied is null");
                try {
                    Publisher<B> boundary = (Publisher) ObjectHelper.requireNonNull(this.boundarySupplier.call(), "The boundary publisher supplied is null");
                    BufferBoundarySubscriber<T, U, B> bs = new BufferBoundarySubscriber<>(this);
                    Disposable o = this.other.get();
                    if (this.other.compareAndSet(o, bs)) {
                        synchronized (this) {
                            U b = this.buffer;
                            if (b != null) {
                                this.buffer = next;
                                boundary.subscribe(bs);
                                fastPathEmitMax(b, false, this);
                            }
                        }
                    }
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    this.cancelled = true;
                    this.s.cancel();
                    this.actual.onError(ex);
                }
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                cancel();
                this.actual.onError(e);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.s.cancel();
            disposeOther();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.other.get() == DisposableHelper.DISPOSED;
        }

        public boolean accept(Subscriber<? super U> a, U v) {
            this.actual.onNext(v);
            return true;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class BufferBoundarySubscriber<T, U extends Collection<? super T>, B> extends DisposableSubscriber<B> {
        boolean once;
        final BufferBoundarySupplierSubscriber<T, U, B> parent;

        BufferBoundarySubscriber(BufferBoundarySupplierSubscriber<T, U, B> parent) {
            this.parent = parent;
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(B t) {
            if (!this.once) {
                this.once = true;
                cancel();
                this.parent.next();
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.once) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.once = true;
            this.parent.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.once) {
                this.once = true;
                this.parent.next();
            }
        }
    }
}
