package io.reactivex.internal.subscriptions;

import io.reactivex.disposables.Disposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FullArbiter<T> extends FullArbiterPad2 implements Subscription {
    static final Subscription INITIAL = new InitialSubscription();
    static final Object REQUEST = new Object();
    final Subscriber<? super T> actual;
    volatile boolean cancelled;
    final SpscLinkedArrayQueue<Object> queue;
    long requested;
    Disposable resource;
    volatile Subscription s = INITIAL;

    public FullArbiter(Subscriber<? super T> actual, Disposable resource, int capacity) {
        this.actual = actual;
        this.resource = resource;
        this.queue = new SpscLinkedArrayQueue<>(capacity);
    }

    @Override // org.reactivestreams.Subscription
    public void request(long n) {
        if (SubscriptionHelper.validate(n)) {
            BackpressureHelper.add(this.missedRequested, n);
            this.queue.offer(REQUEST, REQUEST);
            drain();
        }
    }

    @Override // org.reactivestreams.Subscription
    public void cancel() {
        if (!this.cancelled) {
            this.cancelled = true;
            dispose();
        }
    }

    void dispose() {
        Disposable d = this.resource;
        this.resource = null;
        if (d != null) {
            d.dispose();
        }
    }

    public boolean setSubscription(Subscription s) {
        if (this.cancelled) {
            if (s != null) {
                s.cancel();
            }
            return false;
        }
        ObjectHelper.requireNonNull(s, "s is null");
        this.queue.offer(this.s, NotificationLite.subscription(s));
        drain();
        return true;
    }

    public boolean onNext(T value, Subscription s) {
        if (this.cancelled) {
            return false;
        }
        this.queue.offer(s, NotificationLite.next(value));
        drain();
        return true;
    }

    public void onError(Throwable value, Subscription s) {
        if (this.cancelled) {
            RxJavaPlugins.onError(value);
            return;
        }
        this.queue.offer(s, NotificationLite.error(value));
        drain();
    }

    public void onComplete(Subscription s) {
        this.queue.offer(s, NotificationLite.complete());
        drain();
    }

    void drain() {
        if (this.wip.getAndIncrement() == 0) {
            int missed = 1;
            SpscLinkedArrayQueue<Object> q = this.queue;
            Subscriber<? super T> a = this.actual;
            while (true) {
                Object o = q.mo1188poll();
                if (o != null) {
                    Object v = q.mo1188poll();
                    if (o == REQUEST) {
                        long mr = this.missedRequested.getAndSet(0L);
                        if (mr != 0) {
                            this.requested = BackpressureHelper.addCap(this.requested, mr);
                            this.s.request(mr);
                        }
                    } else if (o == this.s) {
                        if (NotificationLite.isSubscription(v)) {
                            Subscription next = NotificationLite.getSubscription(v);
                            if (!this.cancelled) {
                                this.s = next;
                                long r = this.requested;
                                if (r != 0) {
                                    next.request(r);
                                }
                            } else {
                                next.cancel();
                            }
                        } else if (NotificationLite.isError(v)) {
                            q.clear();
                            dispose();
                            Throwable ex = NotificationLite.getError(v);
                            if (!this.cancelled) {
                                this.cancelled = true;
                                a.onError(ex);
                            } else {
                                RxJavaPlugins.onError(ex);
                            }
                        } else if (NotificationLite.isComplete(v)) {
                            q.clear();
                            dispose();
                            if (!this.cancelled) {
                                this.cancelled = true;
                                a.onComplete();
                            }
                        } else {
                            long r2 = this.requested;
                            if (r2 != 0) {
                                a.onNext((Object) NotificationLite.getValue(v));
                                this.requested = r2 - 1;
                            }
                        }
                    }
                } else {
                    missed = this.wip.addAndGet(-missed);
                    if (missed == 0) {
                        return;
                    }
                }
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class InitialSubscription implements Subscription {
        InitialSubscription() {
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
        }
    }
}
