package io.reactivex.subscribers;

import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public abstract class DisposableSubscriber<T> implements FlowableSubscriber<T>, Disposable {
    final AtomicReference<Subscription> s = new AtomicReference<>();

    @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
    public final void onSubscribe(Subscription s) {
        if (SubscriptionHelper.setOnce(this.s, s)) {
            onStart();
        }
    }

    protected void onStart() {
        this.s.get().request(Long.MAX_VALUE);
    }

    protected final void request(long n) {
        this.s.get().request(n);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void cancel() {
        dispose();
    }

    @Override // io.reactivex.disposables.Disposable
    public final boolean isDisposed() {
        return this.s.get() == SubscriptionHelper.CANCELLED;
    }

    @Override // io.reactivex.disposables.Disposable
    public final void dispose() {
        SubscriptionHelper.cancel(this.s);
    }
}
