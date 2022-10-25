package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.EmptyComponent;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableDetach<T> extends AbstractFlowableWithUpstream<T, T> {
    public FlowableDetach(Flowable<T> source) {
        super(source);
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> s) {
        this.source.subscribe((FlowableSubscriber) new DetachSubscriber(s));
    }

    /* loaded from: classes3.dex */
    static final class DetachSubscriber<T> implements FlowableSubscriber<T>, Subscription {
        Subscriber<? super T> actual;
        Subscription s;

        DetachSubscriber(Subscriber<? super T> actual) {
            this.actual = actual;
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            this.s.request(n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            Subscription s = this.s;
            this.s = EmptyComponent.INSTANCE;
            this.actual = EmptyComponent.asSubscriber();
            s.cancel();
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
            this.actual.onNext(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            Subscriber<? super T> a = this.actual;
            this.s = EmptyComponent.INSTANCE;
            this.actual = EmptyComponent.asSubscriber();
            a.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            Subscriber<? super T> a = this.actual;
            this.s = EmptyComponent.INSTANCE;
            this.actual = EmptyComponent.asSubscriber();
            a.onComplete();
        }
    }
}
