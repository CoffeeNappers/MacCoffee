package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableOnBackpressureLatest<T> extends AbstractFlowableWithUpstream<T, T> {
    public FlowableOnBackpressureLatest(Flowable<T> source) {
        super(source);
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> s) {
        this.source.subscribe((FlowableSubscriber) new BackpressureLatestSubscriber(s));
    }

    /* loaded from: classes3.dex */
    static final class BackpressureLatestSubscriber<T> extends AtomicInteger implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = 163080509307634843L;
        final Subscriber<? super T> actual;
        volatile boolean cancelled;
        volatile boolean done;
        Throwable error;
        Subscription s;
        final AtomicLong requested = new AtomicLong();
        final AtomicReference<T> current = new AtomicReference<>();

        BackpressureLatestSubscriber(Subscriber<? super T> actual) {
            this.actual = actual;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
                s.request(Long.MAX_VALUE);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            this.current.lazySet(t);
            drain();
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.error = t;
            this.done = true;
            drain();
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.done = true;
            drain();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.add(this.requested, n);
                drain();
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.cancel();
                if (getAndIncrement() == 0) {
                    this.current.lazySet(null);
                }
            }
        }

        void drain() {
            if (getAndIncrement() == 0) {
                Subscriber<? super T> a = this.actual;
                int missed = 1;
                AtomicLong r = this.requested;
                AtomicReference<T> q = this.current;
                do {
                    long e = 0;
                    while (e != r.get()) {
                        boolean d = this.done;
                        Object obj = (T) q.getAndSet(null);
                        boolean empty = obj == null;
                        if (!checkTerminated(d, empty, a, q)) {
                            if (empty) {
                                break;
                            }
                            a.onNext(obj);
                            e++;
                        } else {
                            return;
                        }
                    }
                    if (e == r.get()) {
                        if (checkTerminated(this.done, q.get() == null, a, q)) {
                            return;
                        }
                    }
                    if (e != 0) {
                        BackpressureHelper.produced(r, e);
                    }
                    missed = addAndGet(-missed);
                } while (missed != 0);
            }
        }

        boolean checkTerminated(boolean d, boolean empty, Subscriber<?> a, AtomicReference<T> q) {
            if (this.cancelled) {
                q.lazySet(null);
                return true;
            }
            if (d) {
                Throwable e = this.error;
                if (e != null) {
                    q.lazySet(null);
                    a.onError(e);
                    return true;
                } else if (empty) {
                    a.onComplete();
                    return true;
                }
            }
            return false;
        }
    }
}
