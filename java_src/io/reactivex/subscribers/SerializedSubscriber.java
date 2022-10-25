package io.reactivex.subscribers;

import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AppendOnlyLinkedArrayList;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class SerializedSubscriber<T> implements FlowableSubscriber<T>, Subscription {
    static final int QUEUE_LINK_SIZE = 4;
    final Subscriber<? super T> actual;
    final boolean delayError;
    volatile boolean done;
    boolean emitting;
    AppendOnlyLinkedArrayList<Object> queue;
    Subscription subscription;

    public SerializedSubscriber(Subscriber<? super T> actual) {
        this(actual, false);
    }

    public SerializedSubscriber(Subscriber<? super T> actual, boolean delayError) {
        this.actual = actual;
        this.delayError = delayError;
    }

    @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
    public void onSubscribe(Subscription s) {
        if (SubscriptionHelper.validate(this.subscription, s)) {
            this.subscription = s;
            this.actual.onSubscribe(this);
        }
    }

    @Override // org.reactivestreams.Subscriber
    public void onNext(T t) {
        if (!this.done) {
            if (t == null) {
                this.subscription.cancel();
                onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
                return;
            }
            synchronized (this) {
                if (!this.done) {
                    if (this.emitting) {
                        AppendOnlyLinkedArrayList<Object> q = this.queue;
                        if (q == null) {
                            q = new AppendOnlyLinkedArrayList<>(4);
                            this.queue = q;
                        }
                        q.add(NotificationLite.next(t));
                        return;
                    }
                    this.emitting = true;
                    this.actual.onNext(t);
                    emitLoop();
                }
            }
        }
    }

    @Override // org.reactivestreams.Subscriber
    public void onError(Throwable t) {
        boolean reportError;
        if (this.done) {
            RxJavaPlugins.onError(t);
            return;
        }
        synchronized (this) {
            if (this.done) {
                reportError = true;
            } else if (this.emitting) {
                this.done = true;
                AppendOnlyLinkedArrayList<Object> q = this.queue;
                if (q == null) {
                    q = new AppendOnlyLinkedArrayList<>(4);
                    this.queue = q;
                }
                Object err = NotificationLite.error(t);
                if (this.delayError) {
                    q.add(err);
                } else {
                    q.setFirst(err);
                }
                return;
            } else {
                this.done = true;
                this.emitting = true;
                reportError = false;
            }
            if (reportError) {
                RxJavaPlugins.onError(t);
            } else {
                this.actual.onError(t);
            }
        }
    }

    @Override // org.reactivestreams.Subscriber
    public void onComplete() {
        if (!this.done) {
            synchronized (this) {
                if (!this.done) {
                    if (this.emitting) {
                        AppendOnlyLinkedArrayList<Object> q = this.queue;
                        if (q == null) {
                            q = new AppendOnlyLinkedArrayList<>(4);
                            this.queue = q;
                        }
                        q.add(NotificationLite.complete());
                        return;
                    }
                    this.done = true;
                    this.emitting = true;
                    this.actual.onComplete();
                }
            }
        }
    }

    void emitLoop() {
        AppendOnlyLinkedArrayList<Object> q;
        do {
            synchronized (this) {
                q = this.queue;
                if (q == null) {
                    this.emitting = false;
                    return;
                }
                this.queue = null;
            }
        } while (!q.accept((Subscriber<? super T>) this.actual));
    }

    @Override // org.reactivestreams.Subscription
    public void request(long n) {
        this.subscription.request(n);
    }

    @Override // org.reactivestreams.Subscription
    public void cancel() {
        this.subscription.cancel();
    }
}
