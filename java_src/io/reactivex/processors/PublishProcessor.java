package io.reactivex.processors;

import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.annotations.Experimental;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes.dex */
public final class PublishProcessor<T> extends FlowableProcessor<T> {
    Throwable error;
    final AtomicReference<PublishSubscription<T>[]> subscribers = new AtomicReference<>(EMPTY);
    static final PublishSubscription[] TERMINATED = new PublishSubscription[0];
    static final PublishSubscription[] EMPTY = new PublishSubscription[0];

    @CheckReturnValue
    public static <T> PublishProcessor<T> create() {
        return new PublishProcessor<>();
    }

    PublishProcessor() {
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super T> t) {
        PublishSubscription<T> ps = new PublishSubscription<>(t, this);
        t.onSubscribe(ps);
        if (add(ps)) {
            if (ps.isCancelled()) {
                remove(ps);
                return;
            }
            return;
        }
        Throwable ex = this.error;
        if (ex != null) {
            t.onError(ex);
        } else {
            t.onComplete();
        }
    }

    boolean add(PublishSubscription<T> ps) {
        PublishSubscription<T>[] a;
        PublishSubscription<T>[] b;
        do {
            a = this.subscribers.get();
            if (a == TERMINATED) {
                return false;
            }
            int n = a.length;
            b = new PublishSubscription[n + 1];
            System.arraycopy(a, 0, b, 0, n);
            b[n] = ps;
        } while (!this.subscribers.compareAndSet(a, b));
        return true;
    }

    void remove(PublishSubscription<T> ps) {
        PublishSubscription<T>[] a;
        PublishSubscription<T>[] b;
        do {
            a = this.subscribers.get();
            if (a != TERMINATED && a != EMPTY) {
                int n = a.length;
                int j = -1;
                int i = 0;
                while (true) {
                    if (i >= n) {
                        break;
                    } else if (a[i] != ps) {
                        i++;
                    } else {
                        j = i;
                        break;
                    }
                }
                if (j >= 0) {
                    if (n == 1) {
                        b = EMPTY;
                    } else {
                        b = new PublishSubscription[n - 1];
                        System.arraycopy(a, 0, b, 0, j);
                        System.arraycopy(a, j + 1, b, j, (n - j) - 1);
                    }
                } else {
                    return;
                }
            } else {
                return;
            }
        } while (!this.subscribers.compareAndSet(a, b));
    }

    @Override // org.reactivestreams.Subscriber
    public void onSubscribe(Subscription s) {
        if (this.subscribers.get() == TERMINATED) {
            s.cancel();
        } else {
            s.request(Long.MAX_VALUE);
        }
    }

    @Override // org.reactivestreams.Subscriber
    public void onNext(T t) {
        if (this.subscribers.get() != TERMINATED) {
            if (t == null) {
                onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
                return;
            }
            PublishSubscription<T>[] arr$ = this.subscribers.get();
            for (PublishSubscription<T> s : arr$) {
                s.onNext(t);
            }
        }
    }

    @Override // org.reactivestreams.Subscriber
    public void onError(Throwable t) {
        if (this.subscribers.get() == TERMINATED) {
            RxJavaPlugins.onError(t);
            return;
        }
        if (t == null) {
            t = new NullPointerException("onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        }
        this.error = t;
        PublishSubscription<T>[] arr$ = this.subscribers.getAndSet(TERMINATED);
        for (PublishSubscription<T> s : arr$) {
            s.onError(t);
        }
    }

    @Override // org.reactivestreams.Subscriber
    public void onComplete() {
        if (this.subscribers.get() != TERMINATED) {
            PublishSubscription<T>[] arr$ = this.subscribers.getAndSet(TERMINATED);
            for (PublishSubscription<T> s : arr$) {
                s.onComplete();
            }
        }
    }

    @Experimental
    public boolean offer(T t) {
        if (t == null) {
            onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
            return true;
        }
        PublishSubscription<T>[] array = this.subscribers.get();
        for (PublishSubscription<T> s : array) {
            if (s.isFull()) {
                return false;
            }
        }
        for (PublishSubscription<T> s2 : array) {
            s2.onNext(t);
        }
        return true;
    }

    @Override // io.reactivex.processors.FlowableProcessor
    public boolean hasSubscribers() {
        return this.subscribers.get().length != 0;
    }

    @Override // io.reactivex.processors.FlowableProcessor
    public Throwable getThrowable() {
        if (this.subscribers.get() == TERMINATED) {
            return this.error;
        }
        return null;
    }

    @Override // io.reactivex.processors.FlowableProcessor
    public boolean hasThrowable() {
        return this.subscribers.get() == TERMINATED && this.error != null;
    }

    @Override // io.reactivex.processors.FlowableProcessor
    public boolean hasComplete() {
        return this.subscribers.get() == TERMINATED && this.error == null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class PublishSubscription<T> extends AtomicLong implements Subscription {
        private static final long serialVersionUID = 3562861878281475070L;
        final Subscriber<? super T> actual;
        final PublishProcessor<T> parent;

        PublishSubscription(Subscriber<? super T> actual, PublishProcessor<T> parent) {
            this.actual = actual;
            this.parent = parent;
        }

        public void onNext(T t) {
            long r = get();
            if (r != Long.MIN_VALUE) {
                if (r != 0) {
                    this.actual.onNext(t);
                    if (r != Long.MAX_VALUE) {
                        decrementAndGet();
                        return;
                    }
                    return;
                }
                cancel();
                this.actual.onError(new MissingBackpressureException("Could not emit value due to lack of requests"));
            }
        }

        public void onError(Throwable t) {
            if (get() != Long.MIN_VALUE) {
                this.actual.onError(t);
            } else {
                RxJavaPlugins.onError(t);
            }
        }

        public void onComplete() {
            if (get() != Long.MIN_VALUE) {
                this.actual.onComplete();
            }
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.addCancel(this, n);
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (getAndSet(Long.MIN_VALUE) != Long.MIN_VALUE) {
                this.parent.remove(this);
            }
        }

        public boolean isCancelled() {
            return get() == Long.MIN_VALUE;
        }

        boolean isFull() {
            return get() == 0;
        }
    }
}
