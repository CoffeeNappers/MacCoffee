package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BooleanSupplier;
import io.reactivex.internal.subscriptions.SubscriptionArbiter;
import java.util.concurrent.atomic.AtomicInteger;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableRepeatUntil<T> extends AbstractFlowableWithUpstream<T, T> {
    final BooleanSupplier until;

    public FlowableRepeatUntil(Flowable<T> source, BooleanSupplier until) {
        super(source);
        this.until = until;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super T> s) {
        SubscriptionArbiter sa = new SubscriptionArbiter();
        s.onSubscribe(sa);
        RepeatSubscriber<T> rs = new RepeatSubscriber<>(s, this.until, sa, this.source);
        rs.subscribeNext();
    }

    /* loaded from: classes3.dex */
    static final class RepeatSubscriber<T> extends AtomicInteger implements FlowableSubscriber<T> {
        private static final long serialVersionUID = -7098360935104053232L;
        final Subscriber<? super T> actual;
        final SubscriptionArbiter sa;
        final Publisher<? extends T> source;
        final BooleanSupplier stop;

        RepeatSubscriber(Subscriber<? super T> actual, BooleanSupplier until, SubscriptionArbiter sa, Publisher<? extends T> source) {
            this.actual = actual;
            this.sa = sa;
            this.source = source;
            this.stop = until;
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
            try {
                boolean b = this.stop.getAsBoolean();
                if (b) {
                    this.actual.onComplete();
                } else {
                    subscribeNext();
                }
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                this.actual.onError(e);
            }
        }

        void subscribeNext() {
            if (getAndIncrement() == 0) {
                int missed = 1;
                do {
                    this.source.subscribe(this);
                    missed = addAndGet(-missed);
                } while (missed != 0);
            }
        }
    }
}
