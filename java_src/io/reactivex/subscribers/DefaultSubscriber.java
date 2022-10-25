package io.reactivex.subscribers;

import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public abstract class DefaultSubscriber<T> implements FlowableSubscriber<T> {
    private Subscription s;

    @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
    public final void onSubscribe(Subscription s) {
        if (SubscriptionHelper.validate(this.s, s)) {
            this.s = s;
            onStart();
        }
    }

    protected final void request(long n) {
        Subscription s = this.s;
        if (s != null) {
            s.request(n);
        }
    }

    protected final void cancel() {
        Subscription s = this.s;
        this.s = SubscriptionHelper.CANCELLED;
        s.cancel();
    }

    protected void onStart() {
        request(Long.MAX_VALUE);
    }
}
