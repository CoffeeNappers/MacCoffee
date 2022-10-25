package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiFunction;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableScan<T> extends AbstractFlowableWithUpstream<T, T> {
    final BiFunction<T, T, T> accumulator;

    public FlowableScan(Flowable<T> source, BiFunction<T, T, T> accumulator) {
        super(source);
        this.accumulator = accumulator;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> s) {
        this.source.subscribe((FlowableSubscriber) new ScanSubscriber(s, this.accumulator));
    }

    /* loaded from: classes3.dex */
    static final class ScanSubscriber<T> implements FlowableSubscriber<T>, Subscription {
        final BiFunction<T, T, T> accumulator;
        final Subscriber<? super T> actual;
        boolean done;
        Subscription s;
        T value;

        ScanSubscriber(Subscriber<? super T> actual, BiFunction<T, T, T> accumulator) {
            this.actual = actual;
            this.accumulator = accumulator;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        /* JADX WARN: Type inference failed for: r2v0, types: [T, java.lang.Object] */
        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                Subscriber<? super T> a = this.actual;
                T v = this.value;
                if (v == null) {
                    this.value = t;
                    a.onNext(t);
                    return;
                }
                try {
                    ?? r2 = (T) ObjectHelper.requireNonNull(this.accumulator.apply(v, t), "The value returned by the accumulator is null");
                    this.value = r2;
                    a.onNext(r2);
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    this.s.cancel();
                    onError(e);
                }
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
