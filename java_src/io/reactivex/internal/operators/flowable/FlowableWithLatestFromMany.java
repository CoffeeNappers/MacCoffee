package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.annotations.NonNull;
import io.reactivex.annotations.Nullable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.HalfSerializer;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Arrays;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicReferenceArray;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableWithLatestFromMany<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final Function<? super Object[], R> combiner;
    @Nullable
    final Publisher<?>[] otherArray;
    @Nullable
    final Iterable<? extends Publisher<?>> otherIterable;

    public FlowableWithLatestFromMany(@NonNull Flowable<T> source, @NonNull Publisher<?>[] otherArray, Function<? super Object[], R> combiner) {
        super(source);
        this.otherArray = otherArray;
        this.otherIterable = null;
        this.combiner = combiner;
    }

    public FlowableWithLatestFromMany(@NonNull Flowable<T> source, @NonNull Iterable<? extends Publisher<?>> otherIterable, @NonNull Function<? super Object[], R> combiner) {
        super(source);
        this.otherArray = null;
        this.otherIterable = otherIterable;
        this.combiner = combiner;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super R> s) {
        int n;
        int n2;
        Publisher<?>[] others = this.otherArray;
        int n3 = 0;
        if (others == null) {
            others = new Publisher[8];
            try {
                Iterator i$ = this.otherIterable.iterator();
                while (true) {
                    try {
                        n2 = n3;
                        if (!i$.hasNext()) {
                            break;
                        }
                        Publisher<?> p = i$.next();
                        if (n2 == others.length) {
                            others = (Publisher[]) Arrays.copyOf(others, (n2 >> 1) + n2);
                        }
                        n3 = n2 + 1;
                        others[n2] = p;
                    } catch (Throwable th) {
                        ex = th;
                        Exceptions.throwIfFatal(ex);
                        EmptySubscription.error(ex, s);
                        return;
                    }
                }
                n = n2;
            } catch (Throwable th2) {
                ex = th2;
            }
        } else {
            n = others.length;
        }
        if (n == 0) {
            new FlowableMap(this.source, new SingletonArrayFunc()).subscribeActual(s);
            return;
        }
        WithLatestFromSubscriber<T, R> parent = new WithLatestFromSubscriber<>(s, this.combiner, n);
        s.onSubscribe(parent);
        parent.subscribe(others, n);
        this.source.subscribe((FlowableSubscriber) parent);
    }

    /* loaded from: classes3.dex */
    static final class WithLatestFromSubscriber<T, R> extends AtomicInteger implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = 1577321883966341961L;
        final Subscriber<? super R> actual;
        final Function<? super Object[], R> combiner;
        volatile boolean done;
        final AtomicThrowable error;
        final AtomicLong requested;
        final AtomicReference<Subscription> s;
        final WithLatestInnerSubscriber[] subscribers;
        final AtomicReferenceArray<Object> values;

        WithLatestFromSubscriber(Subscriber<? super R> actual, Function<? super Object[], R> combiner, int n) {
            this.actual = actual;
            this.combiner = combiner;
            WithLatestInnerSubscriber[] s = new WithLatestInnerSubscriber[n];
            for (int i = 0; i < n; i++) {
                s[i] = new WithLatestInnerSubscriber(this, i);
            }
            this.subscribers = s;
            this.values = new AtomicReferenceArray<>(n);
            this.s = new AtomicReference<>();
            this.requested = new AtomicLong();
            this.error = new AtomicThrowable();
        }

        void subscribe(Publisher<?>[] others, int n) {
            WithLatestInnerSubscriber[] subscribers = this.subscribers;
            AtomicReference<Subscription> s = this.s;
            for (int i = 0; i < n && !SubscriptionHelper.isCancelled(s.get()) && !this.done; i++) {
                others[i].subscribe(subscribers[i]);
            }
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            SubscriptionHelper.deferredSetOnce(this.s, this.requested, s);
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                AtomicReferenceArray<Object> ara = this.values;
                int n = ara.length();
                Object[] objects = new Object[n + 1];
                objects[0] = t;
                for (int i = 0; i < n; i++) {
                    Object o = ara.get(i);
                    if (o == null) {
                        this.s.get().request(1L);
                        return;
                    }
                    objects[i + 1] = o;
                }
                try {
                    HalfSerializer.onNext(this.actual, ObjectHelper.requireNonNull(this.combiner.mo1190apply(objects), "combiner returned a null value"), this, this.error);
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    cancel();
                    onError(ex);
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
            cancelAllBut(-1);
            HalfSerializer.onError(this.actual, t, this, this.error);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            if (!this.done) {
                this.done = true;
                cancelAllBut(-1);
                HalfSerializer.onComplete(this.actual, this, this.error);
            }
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            SubscriptionHelper.deferredRequest(this.s, this.requested, n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            SubscriptionHelper.cancel(this.s);
            Disposable[] arr$ = this.subscribers;
            for (Disposable s : arr$) {
                s.dispose();
            }
        }

        void innerNext(int index, Object o) {
            this.values.set(index, o);
        }

        void innerError(int index, Throwable t) {
            this.done = true;
            SubscriptionHelper.cancel(this.s);
            cancelAllBut(index);
            HalfSerializer.onError(this.actual, t, this, this.error);
        }

        void innerComplete(int index, boolean nonEmpty) {
            if (!nonEmpty) {
                this.done = true;
                cancelAllBut(index);
                HalfSerializer.onComplete(this.actual, this, this.error);
            }
        }

        void cancelAllBut(int index) {
            WithLatestInnerSubscriber[] subscribers = this.subscribers;
            for (int i = 0; i < subscribers.length; i++) {
                if (i != index) {
                    subscribers[i].dispose();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class WithLatestInnerSubscriber extends AtomicReference<Subscription> implements FlowableSubscriber<Object>, Disposable {
        private static final long serialVersionUID = 3256684027868224024L;
        boolean hasValue;
        final int index;
        final WithLatestFromSubscriber<?, ?> parent;

        WithLatestInnerSubscriber(WithLatestFromSubscriber<?, ?> parent, int index) {
            this.parent = parent;
            this.index = index;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.setOnce(this, s)) {
                s.request(Long.MAX_VALUE);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(Object t) {
            if (!this.hasValue) {
                this.hasValue = true;
            }
            this.parent.innerNext(this.index, t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.parent.innerError(this.index, t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.parent.innerComplete(this.index, this.hasValue);
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return SubscriptionHelper.isCancelled(get());
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            SubscriptionHelper.cancel(this);
        }
    }

    /* loaded from: classes3.dex */
    final class SingletonArrayFunc implements Function<T, R> {
        SingletonArrayFunc() {
        }

        /* JADX WARN: Type inference failed for: r1v1, types: [java.lang.Object[], java.lang.Object] */
        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public R mo1190apply(T t) throws Exception {
            return FlowableWithLatestFromMany.this.combiner.mo1190apply(new Object[]{t});
        }
    }
}
