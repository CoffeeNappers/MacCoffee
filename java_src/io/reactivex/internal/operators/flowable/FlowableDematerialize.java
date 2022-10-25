package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.Notification;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableDematerialize<T> extends AbstractFlowableWithUpstream<Notification<T>, T> {
    public FlowableDematerialize(Flowable<Notification<T>> source) {
        super(source);
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> s) {
        this.source.subscribe((FlowableSubscriber) new DematerializeSubscriber(s));
    }

    /* loaded from: classes3.dex */
    static final class DematerializeSubscriber<T> implements FlowableSubscriber<Notification<T>>, Subscription {
        final Subscriber<? super T> actual;
        boolean done;
        Subscription s;

        @Override // org.reactivestreams.Subscriber
        public /* bridge */ /* synthetic */ void onNext(Object x0) {
            onNext((Notification) ((Notification) x0));
        }

        DematerializeSubscriber(Subscriber<? super T> actual) {
            this.actual = actual;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        public void onNext(Notification<T> t) {
            if (this.done) {
                if (t.isOnError()) {
                    RxJavaPlugins.onError(t.getError());
                }
            } else if (t.isOnError()) {
                this.s.cancel();
                onError(t.getError());
            } else if (t.isOnComplete()) {
                this.s.cancel();
                onComplete();
            } else {
                this.actual.onNext(t.getValue());
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
                this.actual.onComplete();
            }
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
