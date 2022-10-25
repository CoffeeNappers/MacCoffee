package io.reactivex.internal.subscribers;

import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.subscriptions.FullArbiter;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FullArbiterSubscriber<T> implements FlowableSubscriber<T> {
    final FullArbiter<T> arbiter;
    Subscription s;

    public FullArbiterSubscriber(FullArbiter<T> arbiter) {
        this.arbiter = arbiter;
    }

    @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
    public void onSubscribe(Subscription s) {
        if (SubscriptionHelper.validate(this.s, s)) {
            this.s = s;
            this.arbiter.setSubscription(s);
        }
    }

    @Override // org.reactivestreams.Subscriber
    public void onNext(T t) {
        this.arbiter.onNext(t, this.s);
    }

    @Override // org.reactivestreams.Subscriber
    public void onError(Throwable t) {
        this.arbiter.onError(t, this.s);
    }

    @Override // org.reactivestreams.Subscriber
    public void onComplete() {
        this.arbiter.onComplete(this.s);
    }
}
