package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BooleanSupplier;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.QueueDrainHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.ArrayDeque;
import java.util.Collection;
import java.util.Iterator;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableBuffer<T, C extends Collection<? super T>> extends AbstractFlowableWithUpstream<T, C> {
    final Callable<C> bufferSupplier;
    final int size;
    final int skip;

    public FlowableBuffer(Flowable<T> source, int size, int skip, Callable<C> bufferSupplier) {
        super(source);
        this.size = size;
        this.skip = skip;
        this.bufferSupplier = bufferSupplier;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super C> s) {
        if (this.size == this.skip) {
            this.source.subscribe((FlowableSubscriber) new PublisherBufferExactSubscriber(s, this.size, this.bufferSupplier));
        } else if (this.skip > this.size) {
            this.source.subscribe((FlowableSubscriber) new PublisherBufferSkipSubscriber(s, this.size, this.skip, this.bufferSupplier));
        } else {
            this.source.subscribe((FlowableSubscriber) new PublisherBufferOverlappingSubscriber(s, this.size, this.skip, this.bufferSupplier));
        }
    }

    /* loaded from: classes3.dex */
    static final class PublisherBufferExactSubscriber<T, C extends Collection<? super T>> implements FlowableSubscriber<T>, Subscription {
        final Subscriber<? super C> actual;
        C buffer;
        final Callable<C> bufferSupplier;
        boolean done;
        int index;
        Subscription s;
        final int size;

        PublisherBufferExactSubscriber(Subscriber<? super C> actual, int size, Callable<C> bufferSupplier) {
            this.actual = actual;
            this.size = size;
            this.bufferSupplier = bufferSupplier;
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                this.s.request(BackpressureHelper.multiplyCap(n, this.size));
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.s.cancel();
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                C b = this.buffer;
                if (b == null) {
                    try {
                        b = (C) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The bufferSupplier returned a null buffer");
                        this.buffer = b;
                    } catch (Throwable e) {
                        Exceptions.throwIfFatal(e);
                        cancel();
                        onError(e);
                        return;
                    }
                }
                b.add(t);
                int i = this.index + 1;
                if (i == this.size) {
                    this.index = 0;
                    this.buffer = null;
                    this.actual.onNext(b);
                    return;
                }
                this.index = i;
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.actual.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                C b = this.buffer;
                if (b != null && !b.isEmpty()) {
                    this.actual.onNext(b);
                }
                this.actual.onComplete();
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class PublisherBufferSkipSubscriber<T, C extends Collection<? super T>> extends AtomicInteger implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = -5616169793639412593L;
        final Subscriber<? super C> actual;
        C buffer;
        final Callable<C> bufferSupplier;
        boolean done;
        int index;
        Subscription s;
        final int size;
        final int skip;

        PublisherBufferSkipSubscriber(Subscriber<? super C> actual, int size, int skip, Callable<C> bufferSupplier) {
            this.actual = actual;
            this.size = size;
            this.skip = skip;
            this.bufferSupplier = bufferSupplier;
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                if (get() == 0 && compareAndSet(0, 1)) {
                    long u = BackpressureHelper.multiplyCap(n, this.size);
                    long v = BackpressureHelper.multiplyCap(this.skip - this.size, n - 1);
                    this.s.request(BackpressureHelper.addCap(u, v));
                    return;
                }
                this.s.request(BackpressureHelper.multiplyCap(this.skip, n));
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.s.cancel();
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                C b = this.buffer;
                int i = this.index;
                int i2 = i + 1;
                if (i == 0) {
                    try {
                        b = (C) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The bufferSupplier returned a null buffer");
                        this.buffer = b;
                    } catch (Throwable e) {
                        Exceptions.throwIfFatal(e);
                        cancel();
                        onError(e);
                        return;
                    }
                }
                if (b != null) {
                    b.add(t);
                    if (b.size() == this.size) {
                        this.buffer = null;
                        this.actual.onNext(b);
                    }
                }
                this.index = i2 == this.skip ? 0 : i2;
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.buffer = null;
            this.actual.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                C b = this.buffer;
                this.buffer = null;
                if (b != null) {
                    this.actual.onNext(b);
                }
                this.actual.onComplete();
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class PublisherBufferOverlappingSubscriber<T, C extends Collection<? super T>> extends AtomicLong implements FlowableSubscriber<T>, Subscription, BooleanSupplier {
        private static final long serialVersionUID = -7370244972039324525L;
        final Subscriber<? super C> actual;
        final Callable<C> bufferSupplier;
        volatile boolean cancelled;
        boolean done;
        int index;
        long produced;
        Subscription s;
        final int size;
        final int skip;
        final AtomicBoolean once = new AtomicBoolean();
        final ArrayDeque<C> buffers = new ArrayDeque<>();

        PublisherBufferOverlappingSubscriber(Subscriber<? super C> actual, int size, int skip, Callable<C> bufferSupplier) {
            this.actual = actual;
            this.size = size;
            this.skip = skip;
            this.bufferSupplier = bufferSupplier;
        }

        @Override // io.reactivex.functions.BooleanSupplier
        public boolean getAsBoolean() {
            return this.cancelled;
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n) && !QueueDrainHelper.postCompleteRequest(n, this.actual, this.buffers, this, this)) {
                if (!this.once.get() && this.once.compareAndSet(false, true)) {
                    long u = BackpressureHelper.multiplyCap(this.skip, n - 1);
                    long r = BackpressureHelper.addCap(this.size, u);
                    this.s.request(r);
                    return;
                }
                long r2 = BackpressureHelper.multiplyCap(this.skip, n);
                this.s.request(r2);
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.cancelled = true;
            this.s.cancel();
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                ArrayDeque<C> bs = this.buffers;
                int i = this.index;
                int i2 = i + 1;
                if (i == 0) {
                    try {
                        bs.offer((Collection) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The bufferSupplier returned a null buffer"));
                    } catch (Throwable e) {
                        Exceptions.throwIfFatal(e);
                        cancel();
                        onError(e);
                        return;
                    }
                }
                C b = bs.peek();
                if (b != null && b.size() + 1 == this.size) {
                    bs.poll();
                    b.add(t);
                    this.produced++;
                    this.actual.onNext(b);
                }
                Iterator i$ = bs.iterator();
                while (i$.hasNext()) {
                    ((Collection) i$.next()).add(t);
                }
                this.index = i2 == this.skip ? 0 : i2;
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.done = true;
            this.buffers.clear();
            this.actual.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                long p = this.produced;
                if (p != 0) {
                    BackpressureHelper.produced(this, p);
                }
                QueueDrainHelper.postComplete(this.actual, this.buffers, this, this);
            }
        }
    }
}
