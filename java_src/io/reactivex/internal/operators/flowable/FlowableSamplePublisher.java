package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.subscribers.SerializedSubscriber;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableSamplePublisher<T> extends Flowable<T> {
    final boolean emitLast;
    final Publisher<?> other;
    final Publisher<T> source;

    public FlowableSamplePublisher(Publisher<T> source, Publisher<?> other, boolean emitLast) {
        this.source = source;
        this.other = other;
        this.emitLast = emitLast;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> s) {
        SerializedSubscriber<T> serial = new SerializedSubscriber<>(s);
        if (this.emitLast) {
            this.source.subscribe(new SampleMainEmitLast(serial, this.other));
        } else {
            this.source.subscribe(new SampleMainNoLast(serial, this.other));
        }
    }

    /* loaded from: classes3.dex */
    static abstract class SamplePublisherSubscriber<T> extends AtomicReference<T> implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = -3517602651313910099L;
        final Subscriber<? super T> actual;
        Subscription s;
        final Publisher<?> sampler;
        final AtomicLong requested = new AtomicLong();
        final AtomicReference<Subscription> other = new AtomicReference<>();

        abstract void completeMain();

        abstract void completeOther();

        abstract void run();

        SamplePublisherSubscriber(Subscriber<? super T> actual, Publisher<?> other) {
            this.actual = actual;
            this.sampler = other;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
                if (this.other.get() == null) {
                    this.sampler.subscribe(new SamplerSubscriber(this));
                    s.request(Long.MAX_VALUE);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            lazySet(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            SubscriptionHelper.cancel(this.other);
            this.actual.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            SubscriptionHelper.cancel(this.other);
            completeMain();
        }

        boolean setOther(Subscription o) {
            return SubscriptionHelper.setOnce(this.other, o);
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.add(this.requested, n);
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            SubscriptionHelper.cancel(this.other);
            this.s.cancel();
        }

        public void error(Throwable e) {
            this.s.cancel();
            this.actual.onError(e);
        }

        public void complete() {
            this.s.cancel();
            completeOther();
        }

        void emit() {
            T value = getAndSet(null);
            if (value != null) {
                long r = this.requested.get();
                if (r != 0) {
                    this.actual.onNext(value);
                    BackpressureHelper.produced(this.requested, 1L);
                    return;
                }
                cancel();
                this.actual.onError(new MissingBackpressureException("Couldn't emit value due to lack of requests!"));
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class SamplerSubscriber<T> implements FlowableSubscriber<Object> {
        final SamplePublisherSubscriber<T> parent;

        SamplerSubscriber(SamplePublisherSubscriber<T> parent) {
            this.parent = parent;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (this.parent.setOther(s)) {
                s.request(Long.MAX_VALUE);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(Object t) {
            this.parent.run();
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.parent.error(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.parent.complete();
        }
    }

    /* loaded from: classes3.dex */
    static final class SampleMainNoLast<T> extends SamplePublisherSubscriber<T> {
        private static final long serialVersionUID = -3029755663834015785L;

        SampleMainNoLast(Subscriber<? super T> actual, Publisher<?> other) {
            super(actual, other);
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableSamplePublisher.SamplePublisherSubscriber
        void completeMain() {
            this.actual.onComplete();
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableSamplePublisher.SamplePublisherSubscriber
        void completeOther() {
            this.actual.onComplete();
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableSamplePublisher.SamplePublisherSubscriber
        void run() {
            emit();
        }
    }

    /* loaded from: classes3.dex */
    static final class SampleMainEmitLast<T> extends SamplePublisherSubscriber<T> {
        private static final long serialVersionUID = -3029755663834015785L;
        volatile boolean done;
        final AtomicInteger wip;

        SampleMainEmitLast(Subscriber<? super T> actual, Publisher<?> other) {
            super(actual, other);
            this.wip = new AtomicInteger();
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableSamplePublisher.SamplePublisherSubscriber
        void completeMain() {
            this.done = true;
            if (this.wip.getAndIncrement() == 0) {
                emit();
                this.actual.onComplete();
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableSamplePublisher.SamplePublisherSubscriber
        void completeOther() {
            this.done = true;
            if (this.wip.getAndIncrement() == 0) {
                emit();
                this.actual.onComplete();
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableSamplePublisher.SamplePublisherSubscriber
        void run() {
            if (this.wip.getAndIncrement() == 0) {
                do {
                    boolean d = this.done;
                    emit();
                    if (d) {
                        this.actual.onComplete();
                        return;
                    }
                } while (this.wip.decrementAndGet() != 0);
            }
        }
    }
}
