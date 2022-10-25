package io.reactivex.internal.subscribers;

import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.fuseable.ConditionalSubscriber;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public abstract class BasicFuseableConditionalSubscriber<T, R> implements ConditionalSubscriber<T>, QueueSubscription<R> {
    protected final ConditionalSubscriber<? super R> actual;
    protected boolean done;
    protected QueueSubscription<T> qs;
    protected Subscription s;
    protected int sourceMode;

    public BasicFuseableConditionalSubscriber(ConditionalSubscriber<? super R> actual) {
        this.actual = actual;
    }

    @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
    public final void onSubscribe(Subscription s) {
        if (SubscriptionHelper.validate(this.s, s)) {
            this.s = s;
            if (s instanceof QueueSubscription) {
                this.qs = (QueueSubscription) s;
            }
            if (beforeDownstream()) {
                this.actual.onSubscribe(this);
                afterDownstream();
            }
        }
    }

    protected boolean beforeDownstream() {
        return true;
    }

    protected void afterDownstream() {
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

    /* JADX INFO: Access modifiers changed from: protected */
    public final void fail(Throwable t) {
        Exceptions.throwIfFatal(t);
        this.s.cancel();
        onError(t);
    }

    @Override // org.reactivestreams.Subscriber
    public void onComplete() {
        if (!this.done) {
            this.done = true;
            this.actual.onComplete();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final int transitiveBoundaryFusion(int mode) {
        QueueSubscription<T> qs = this.qs;
        if (qs == null || (mode & 4) != 0) {
            return 0;
        }
        int m = qs.requestFusion(mode);
        if (m != 0) {
            this.sourceMode = m;
            return m;
        }
        return m;
    }

    @Override // org.reactivestreams.Subscription
    public void request(long n) {
        this.s.request(n);
    }

    @Override // org.reactivestreams.Subscription
    public void cancel() {
        this.s.cancel();
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    public boolean isEmpty() {
        return this.qs.isEmpty();
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    public void clear() {
        this.qs.clear();
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    public final boolean offer(R e) {
        throw new UnsupportedOperationException("Should not be called!");
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    public final boolean offer(R v1, R v2) {
        throw new UnsupportedOperationException("Should not be called!");
    }
}
