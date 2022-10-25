package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.Scheduler;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableSubscribeOn<T> extends AbstractFlowableWithUpstream<T, T> {
    final boolean nonScheduledRequests;
    final Scheduler scheduler;

    public FlowableSubscribeOn(Flowable<T> source, Scheduler scheduler, boolean nonScheduledRequests) {
        super(source);
        this.scheduler = scheduler;
        this.nonScheduledRequests = nonScheduledRequests;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super T> s) {
        Scheduler.Worker w = this.scheduler.createWorker();
        SubscribeOnSubscriber<T> sos = new SubscribeOnSubscriber<>(s, w, this.source, this.nonScheduledRequests);
        s.onSubscribe(sos);
        w.schedule(sos);
    }

    /* loaded from: classes3.dex */
    static final class SubscribeOnSubscriber<T> extends AtomicReference<Thread> implements FlowableSubscriber<T>, Subscription, Runnable {
        private static final long serialVersionUID = 8094547886072529208L;
        final Subscriber<? super T> actual;
        final boolean nonScheduledRequests;
        Publisher<T> source;
        final Scheduler.Worker worker;
        final AtomicReference<Subscription> s = new AtomicReference<>();
        final AtomicLong requested = new AtomicLong();

        SubscribeOnSubscriber(Subscriber<? super T> actual, Scheduler.Worker worker, Publisher<T> source, boolean nonScheduledRequests) {
            this.actual = actual;
            this.worker = worker;
            this.source = source;
            this.nonScheduledRequests = nonScheduledRequests;
        }

        @Override // java.lang.Runnable
        public void run() {
            lazySet(Thread.currentThread());
            Publisher<T> src = this.source;
            this.source = null;
            src.subscribe(this);
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.setOnce(this.s, s)) {
                long r = this.requested.getAndSet(0L);
                if (r != 0) {
                    requestUpstream(r, s);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            this.actual.onNext(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.actual.onError(t);
            this.worker.dispose();
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.actual.onComplete();
            this.worker.dispose();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                Subscription s = this.s.get();
                if (s != null) {
                    requestUpstream(n, s);
                    return;
                }
                BackpressureHelper.add(this.requested, n);
                Subscription s2 = this.s.get();
                if (s2 != null) {
                    long r = this.requested.getAndSet(0L);
                    if (r != 0) {
                        requestUpstream(r, s2);
                    }
                }
            }
        }

        void requestUpstream(long n, Subscription s) {
            if (this.nonScheduledRequests || Thread.currentThread() == get()) {
                s.request(n);
            } else {
                this.worker.schedule(new Request(s, n));
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            SubscriptionHelper.cancel(this.s);
            this.worker.dispose();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public static final class Request implements Runnable {
            private final long n;
            private final Subscription s;

            Request(Subscription s, long n) {
                this.s = s;
                this.n = n;
            }

            @Override // java.lang.Runnable
            public void run() {
                this.s.request(this.n);
            }
        }
    }
}
