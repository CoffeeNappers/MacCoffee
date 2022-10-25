package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.Scheduler;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.schedulers.Timed;
import java.util.concurrent.TimeUnit;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableTimeInterval<T> extends AbstractFlowableWithUpstream<T, Timed<T>> {
    final Scheduler scheduler;
    final TimeUnit unit;

    public FlowableTimeInterval(Flowable<T> source, TimeUnit unit, Scheduler scheduler) {
        super(source);
        this.scheduler = scheduler;
        this.unit = unit;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super Timed<T>> s) {
        this.source.subscribe((FlowableSubscriber) new TimeIntervalSubscriber(s, this.unit, this.scheduler));
    }

    /* loaded from: classes3.dex */
    static final class TimeIntervalSubscriber<T> implements FlowableSubscriber<T>, Subscription {
        final Subscriber<? super Timed<T>> actual;
        long lastTime;
        Subscription s;
        final Scheduler scheduler;
        final TimeUnit unit;

        TimeIntervalSubscriber(Subscriber<? super Timed<T>> actual, TimeUnit unit, Scheduler scheduler) {
            this.actual = actual;
            this.scheduler = scheduler;
            this.unit = unit;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.lastTime = this.scheduler.now(this.unit);
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            long now = this.scheduler.now(this.unit);
            long last = this.lastTime;
            this.lastTime = now;
            long delta = now - last;
            this.actual.onNext(new Timed(t, delta, this.unit));
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.actual.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.actual.onComplete();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            this.s.request(n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.s.cancel();
        }
    }
}
