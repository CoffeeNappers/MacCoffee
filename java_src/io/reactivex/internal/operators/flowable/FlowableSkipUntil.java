package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.fuseable.ConditionalSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.HalfSerializer;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableSkipUntil<T, U> extends AbstractFlowableWithUpstream<T, T> {
    final Publisher<U> other;

    public FlowableSkipUntil(Flowable<T> source, Publisher<U> other) {
        super(source);
        this.other = other;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> child) {
        SkipUntilMainSubscriber<T> parent = new SkipUntilMainSubscriber<>(child);
        child.onSubscribe(parent);
        this.other.subscribe(parent.other);
        this.source.subscribe((FlowableSubscriber) parent);
    }

    /* loaded from: classes3.dex */
    static final class SkipUntilMainSubscriber<T> extends AtomicInteger implements ConditionalSubscriber<T>, Subscription {
        private static final long serialVersionUID = -6270983465606289181L;
        final Subscriber<? super T> actual;
        volatile boolean gate;
        final AtomicReference<Subscription> s = new AtomicReference<>();
        final AtomicLong requested = new AtomicLong();
        final SkipUntilMainSubscriber<T>.OtherSubscriber other = new OtherSubscriber();
        final AtomicThrowable error = new AtomicThrowable();

        SkipUntilMainSubscriber(Subscriber<? super T> actual) {
            this.actual = actual;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            SubscriptionHelper.deferredSetOnce(this.s, this.requested, s);
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!tryOnNext(t)) {
                this.s.get().request(1L);
            }
        }

        @Override // io.reactivex.internal.fuseable.ConditionalSubscriber
        public boolean tryOnNext(T t) {
            if (this.gate) {
                HalfSerializer.onNext(this.actual, t, this, this.error);
                return true;
            }
            return false;
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            SubscriptionHelper.cancel(this.other);
            HalfSerializer.onError(this.actual, t, this, this.error);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            SubscriptionHelper.cancel(this.other);
            HalfSerializer.onComplete(this.actual, this, this.error);
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            SubscriptionHelper.deferredRequest(this.s, this.requested, n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            SubscriptionHelper.cancel(this.s);
            SubscriptionHelper.cancel(this.other);
        }

        /* loaded from: classes3.dex */
        final class OtherSubscriber extends AtomicReference<Subscription> implements FlowableSubscriber<Object> {
            private static final long serialVersionUID = -5592042965931999169L;

            OtherSubscriber() {
            }

            @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
            public void onSubscribe(Subscription s) {
                if (SubscriptionHelper.setOnce(this, s)) {
                    s.request(Long.MAX_VALUE);
                }
            }

            @Override // org.reactivestreams.Subscriber
            public void onNext(Object t) {
                SkipUntilMainSubscriber.this.gate = true;
                get().cancel();
            }

            @Override // org.reactivestreams.Subscriber
            public void onError(Throwable t) {
                SubscriptionHelper.cancel(SkipUntilMainSubscriber.this.s);
                HalfSerializer.onError(SkipUntilMainSubscriber.this.actual, t, SkipUntilMainSubscriber.this, SkipUntilMainSubscriber.this.error);
            }

            @Override // org.reactivestreams.Subscriber
            public void onComplete() {
                SkipUntilMainSubscriber.this.gate = true;
            }
        }
    }
}
