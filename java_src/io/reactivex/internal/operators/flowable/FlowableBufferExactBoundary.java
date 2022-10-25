package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.internal.subscribers.QueueDrainSubscriber;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.QueueDrainHelper;
import io.reactivex.subscribers.DisposableSubscriber;
import io.reactivex.subscribers.SerializedSubscriber;
import java.util.Collection;
import java.util.concurrent.Callable;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableBufferExactBoundary<T, U extends Collection<? super T>, B> extends AbstractFlowableWithUpstream<T, U> {
    final Publisher<B> boundary;
    final Callable<U> bufferSupplier;

    public FlowableBufferExactBoundary(Flowable<T> source, Publisher<B> boundary, Callable<U> bufferSupplier) {
        super(source);
        this.boundary = boundary;
        this.bufferSupplier = bufferSupplier;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super U> s) {
        this.source.subscribe((FlowableSubscriber) new BufferExactBoundarySubscriber(new SerializedSubscriber(s), this.bufferSupplier, this.boundary));
    }

    /* loaded from: classes3.dex */
    static final class BufferExactBoundarySubscriber<T, U extends Collection<? super T>, B> extends QueueDrainSubscriber<T, U, U> implements FlowableSubscriber<T>, Subscription, Disposable {
        final Publisher<B> boundary;
        U buffer;
        final Callable<U> bufferSupplier;
        Disposable other;
        Subscription s;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // io.reactivex.internal.subscribers.QueueDrainSubscriber, io.reactivex.internal.util.QueueDrain
        public /* bridge */ /* synthetic */ boolean accept(Subscriber x0, Object x1) {
            return accept((Subscriber<? super Subscriber>) x0, (Subscriber) ((Collection) x1));
        }

        BufferExactBoundarySubscriber(Subscriber<? super U> actual, Callable<U> bufferSupplier, Publisher<B> boundary) {
            super(actual, new MpscLinkedQueue());
            this.bufferSupplier = bufferSupplier;
            this.boundary = boundary;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                try {
                    U b = (U) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The buffer supplied is null");
                    this.buffer = b;
                    BufferBoundarySubscriber<T, U, B> bs = new BufferBoundarySubscriber<>(this);
                    this.other = bs;
                    this.actual.onSubscribe(this);
                    if (!this.cancelled) {
                        s.request(Long.MAX_VALUE);
                        this.boundary.subscribe(bs);
                    }
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    this.cancelled = true;
                    s.cancel();
                    EmptySubscription.error(e, this.actual);
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
                this.other.dispose();
                this.s.cancel();
                if (enter()) {
                    this.queue.clear();
                }
            }
        }

        void next() {
            try {
                U next = (U) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The buffer supplied is null");
                synchronized (this) {
                    U b = this.buffer;
                    if (b != null) {
                        this.buffer = next;
                        fastPathEmitMax(b, false, this);
                    }
                }
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                cancel();
                this.actual.onError(e);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            cancel();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        public boolean accept(Subscriber<? super U> a, U v) {
            this.actual.onNext(v);
            return true;
        }
    }

    /* loaded from: classes3.dex */
    static final class BufferBoundarySubscriber<T, U extends Collection<? super T>, B> extends DisposableSubscriber<B> {
        final BufferExactBoundarySubscriber<T, U, B> parent;

        BufferBoundarySubscriber(BufferExactBoundarySubscriber<T, U, B> parent) {
            this.parent = parent;
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(B t) {
            this.parent.next();
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.parent.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.parent.onComplete();
        }
    }
}
