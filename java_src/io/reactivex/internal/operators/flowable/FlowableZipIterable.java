package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiFunction;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Iterator;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableZipIterable<T, U, V> extends AbstractFlowableWithUpstream<T, V> {
    final Iterable<U> other;
    final BiFunction<? super T, ? super U, ? extends V> zipper;

    public FlowableZipIterable(Flowable<T> source, Iterable<U> other, BiFunction<? super T, ? super U, ? extends V> zipper) {
        super(source);
        this.other = other;
        this.zipper = zipper;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super V> t) {
        try {
            Iterator<U> it = (Iterator) ObjectHelper.requireNonNull(this.other.iterator(), "The iterator returned by other is null");
            try {
                boolean b = it.hasNext();
                if (!b) {
                    EmptySubscription.complete(t);
                } else {
                    this.source.subscribe((FlowableSubscriber) new ZipIterableSubscriber(t, it, this.zipper));
                }
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                EmptySubscription.error(e, t);
            }
        } catch (Throwable e2) {
            Exceptions.throwIfFatal(e2);
            EmptySubscription.error(e2, t);
        }
    }

    /* loaded from: classes3.dex */
    static final class ZipIterableSubscriber<T, U, V> implements FlowableSubscriber<T>, Subscription {
        final Subscriber<? super V> actual;
        boolean done;
        final Iterator<U> iterator;
        Subscription s;
        final BiFunction<? super T, ? super U, ? extends V> zipper;

        ZipIterableSubscriber(Subscriber<? super V> actual, Iterator<U> iterator, BiFunction<? super T, ? super U, ? extends V> zipper) {
            this.actual = actual;
            this.iterator = iterator;
            this.zipper = zipper;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                try {
                    try {
                        this.actual.onNext(ObjectHelper.requireNonNull(this.zipper.apply(t, ObjectHelper.requireNonNull(this.iterator.next(), "The iterator returned a null value")), "The zipper function returned a null value"));
                        try {
                            boolean b = this.iterator.hasNext();
                            if (!b) {
                                this.done = true;
                                this.s.cancel();
                                this.actual.onComplete();
                            }
                        } catch (Throwable e) {
                            error(e);
                        }
                    } catch (Throwable e2) {
                        error(e2);
                    }
                } catch (Throwable e3) {
                    error(e3);
                }
            }
        }

        void error(Throwable e) {
            Exceptions.throwIfFatal(e);
            this.done = true;
            this.s.cancel();
            this.actual.onError(e);
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
