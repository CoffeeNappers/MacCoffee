package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import java.util.concurrent.atomic.AtomicBoolean;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableTake<T> extends AbstractFlowableWithUpstream<T, T> {
    final long limit;

    public FlowableTake(Flowable<T> source, long limit) {
        super(source);
        this.limit = limit;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> s) {
        this.source.subscribe((FlowableSubscriber) new TakeSubscriber(s, this.limit));
    }

    /* loaded from: classes3.dex */
    static final class TakeSubscriber<T> extends AtomicBoolean implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = -5636543848937116287L;
        final Subscriber<? super T> actual;
        boolean done;
        final long limit;
        long remaining;
        Subscription subscription;

        /* JADX INFO: Access modifiers changed from: package-private */
        public TakeSubscriber(Subscriber<? super T> actual, long limit) {
            this.actual = actual;
            this.limit = limit;
            this.remaining = limit;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.subscription, s)) {
                this.subscription = s;
                if (this.limit == 0) {
                    s.cancel();
                    this.done = true;
                    EmptySubscription.complete(this.actual);
                    return;
                }
                this.actual.onSubscribe(this);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                long j = this.remaining;
                this.remaining = j - 1;
                if (j > 0) {
                    boolean stop = this.remaining == 0;
                    this.actual.onNext(t);
                    if (stop) {
                        this.subscription.cancel();
                        onComplete();
                    }
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (!this.done) {
                this.done = true;
                this.subscription.cancel();
                this.actual.onError(t);
            }
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
            if (SubscriptionHelper.validate(n)) {
                if (!get() && compareAndSet(false, true) && n >= this.limit) {
                    this.subscription.request(Long.MAX_VALUE);
                } else {
                    this.subscription.request(n);
                }
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.subscription.cancel();
        }
    }
}
