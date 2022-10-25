package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableInterval extends Flowable<Long> {
    final long initialDelay;
    final long period;
    final Scheduler scheduler;
    final TimeUnit unit;

    public FlowableInterval(long initialDelay, long period, TimeUnit unit, Scheduler scheduler) {
        this.initialDelay = initialDelay;
        this.period = period;
        this.unit = unit;
        this.scheduler = scheduler;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super Long> s) {
        IntervalSubscriber is = new IntervalSubscriber(s);
        s.onSubscribe(is);
        Disposable d = this.scheduler.schedulePeriodicallyDirect(is, this.initialDelay, this.period, this.unit);
        is.setResource(d);
    }

    /* loaded from: classes3.dex */
    static final class IntervalSubscriber extends AtomicLong implements Subscription, Runnable {
        private static final long serialVersionUID = -2809475196591179431L;
        final Subscriber<? super Long> actual;
        long count;
        final AtomicReference<Disposable> resource = new AtomicReference<>();

        IntervalSubscriber(Subscriber<? super Long> actual) {
            this.actual = actual;
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.add(this, n);
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            DisposableHelper.dispose(this.resource);
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.resource.get() != DisposableHelper.DISPOSED) {
                long r = get();
                if (r != 0) {
                    Subscriber<? super Long> subscriber = this.actual;
                    long j = this.count;
                    this.count = j + 1;
                    subscriber.onNext(Long.valueOf(j));
                    BackpressureHelper.produced(this, 1L);
                    return;
                }
                this.actual.onError(new MissingBackpressureException("Can't deliver value " + this.count + " due to lack of requests"));
                DisposableHelper.dispose(this.resource);
            }
        }

        public void setResource(Disposable d) {
            DisposableHelper.setOnce(this.resource, d);
        }
    }
}
