package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionArbiter;
import java.util.concurrent.atomic.AtomicInteger;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableRepeat<T> extends AbstractFlowableWithUpstream<T, T> {
    final long count;

    public FlowableRepeat(Flowable<T> source, long count) {
        super(source);
        this.count = count;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super T> s) {
        long j = Long.MAX_VALUE;
        SubscriptionArbiter sa = new SubscriptionArbiter();
        s.onSubscribe(sa);
        if (this.count != Long.MAX_VALUE) {
            j = this.count - 1;
        }
        RepeatSubscriber<T> rs = new RepeatSubscriber<>(s, j, sa, this.source);
        rs.subscribeNext();
    }

    /* loaded from: classes3.dex */
    static final class RepeatSubscriber<T> extends AtomicInteger implements FlowableSubscriber<T> {
        private static final long serialVersionUID = -7098360935104053232L;
        final Subscriber<? super T> actual;
        long remaining;
        final SubscriptionArbiter sa;
        final Publisher<? extends T> source;

        RepeatSubscriber(Subscriber<? super T> actual, long count, SubscriptionArbiter sa, Publisher<? extends T> source) {
            this.actual = actual;
            this.sa = sa;
            this.source = source;
            this.remaining = count;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            this.sa.setSubscription(s);
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            this.actual.onNext(t);
            this.sa.produced(1L);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.actual.onError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            long r = this.remaining;
            if (r != Long.MAX_VALUE) {
                this.remaining = r - 1;
            }
            if (r != 0) {
                subscribeNext();
            } else {
                this.actual.onComplete();
            }
        }

        void subscribeNext() {
            if (getAndIncrement() == 0) {
                int missed = 1;
                while (!this.sa.isCancelled()) {
                    this.source.subscribe(this);
                    missed = addAndGet(-missed);
                    if (missed == 0) {
                        return;
                    }
                }
            }
        }
    }
}
