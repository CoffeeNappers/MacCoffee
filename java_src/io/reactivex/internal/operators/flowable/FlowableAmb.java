package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableAmb<T> extends Flowable<T> {
    final Publisher<? extends T>[] sources;
    final Iterable<? extends Publisher<? extends T>> sourcesIterable;

    public FlowableAmb(Publisher<? extends T>[] sources, Iterable<? extends Publisher<? extends T>> sourcesIterable) {
        this.sources = sources;
        this.sourcesIterable = sourcesIterable;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super T> s) {
        int count;
        Publisher<? extends T>[] sources = this.sources;
        int count2 = 0;
        if (sources == null) {
            sources = new Publisher[8];
            try {
                Iterator i$ = this.sourcesIterable.iterator();
                while (true) {
                    try {
                        int count3 = count2;
                        if (!i$.hasNext()) {
                            count = count3;
                            break;
                        }
                        Publisher<? extends T> p = i$.next();
                        if (p == null) {
                            EmptySubscription.error(new NullPointerException("One of the sources is null"), s);
                            return;
                        }
                        if (count3 == sources.length) {
                            Publisher<? extends T>[] b = new Publisher[(count3 >> 2) + count3];
                            System.arraycopy(sources, 0, b, 0, count3);
                            sources = b;
                        }
                        count2 = count3 + 1;
                        sources[count3] = p;
                    } catch (Throwable th) {
                        e = th;
                        Exceptions.throwIfFatal(e);
                        EmptySubscription.error(e, s);
                        return;
                    }
                }
            } catch (Throwable th2) {
                e = th2;
            }
        } else {
            count = sources.length;
        }
        if (count == 0) {
            EmptySubscription.complete(s);
        } else if (count == 1) {
            sources[0].subscribe(s);
        } else {
            AmbCoordinator<T> ac = new AmbCoordinator<>(s, count);
            ac.subscribe(sources);
        }
    }

    /* loaded from: classes3.dex */
    static final class AmbCoordinator<T> implements Subscription {
        final Subscriber<? super T> actual;
        final AmbInnerSubscriber<T>[] subscribers;
        final AtomicInteger winner = new AtomicInteger();

        AmbCoordinator(Subscriber<? super T> actual, int count) {
            this.actual = actual;
            this.subscribers = new AmbInnerSubscriber[count];
        }

        public void subscribe(Publisher<? extends T>[] sources) {
            AmbInnerSubscriber<T>[] as = this.subscribers;
            int len = as.length;
            for (int i = 0; i < len; i++) {
                as[i] = new AmbInnerSubscriber<>(this, i + 1, this.actual);
            }
            this.winner.lazySet(0);
            this.actual.onSubscribe(this);
            for (int i2 = 0; i2 < len && this.winner.get() == 0; i2++) {
                sources[i2].subscribe(as[i2]);
            }
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                int w = this.winner.get();
                if (w > 0) {
                    this.subscribers[w - 1].request(n);
                } else if (w == 0) {
                    AmbInnerSubscriber<T>[] arr$ = this.subscribers;
                    for (AmbInnerSubscriber<T> a : arr$) {
                        a.request(n);
                    }
                }
            }
        }

        public boolean win(int index) {
            int w = this.winner.get();
            if (w != 0 || !this.winner.compareAndSet(0, index)) {
                return false;
            }
            AmbInnerSubscriber<T>[] a = this.subscribers;
            int n = a.length;
            for (int i = 0; i < n; i++) {
                if (i + 1 != index) {
                    a[i].cancel();
                }
            }
            return true;
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (this.winner.get() != -1) {
                this.winner.lazySet(-1);
                AmbInnerSubscriber<T>[] arr$ = this.subscribers;
                for (AmbInnerSubscriber<T> a : arr$) {
                    a.cancel();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class AmbInnerSubscriber<T> extends AtomicReference<Subscription> implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = -1185974347409665484L;
        final Subscriber<? super T> actual;
        final int index;
        final AtomicLong missedRequested = new AtomicLong();
        final AmbCoordinator<T> parent;
        boolean won;

        AmbInnerSubscriber(AmbCoordinator<T> parent, int index, Subscriber<? super T> actual) {
            this.parent = parent;
            this.index = index;
            this.actual = actual;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            SubscriptionHelper.deferredSetOnce(this, this.missedRequested, s);
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            SubscriptionHelper.deferredRequest(this, this.missedRequested, n);
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (this.won) {
                this.actual.onNext(t);
            } else if (this.parent.win(this.index)) {
                this.won = true;
                this.actual.onNext(t);
            } else {
                get().cancel();
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            if (this.won) {
                this.actual.onError(t);
            } else if (this.parent.win(this.index)) {
                this.won = true;
                this.actual.onError(t);
            } else {
                get().cancel();
                RxJavaPlugins.onError(t);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (this.won) {
                this.actual.onComplete();
            } else if (this.parent.win(this.index)) {
                this.won = true;
                this.actual.onComplete();
            } else {
                get().cancel();
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            SubscriptionHelper.cancel(this);
        }
    }
}
