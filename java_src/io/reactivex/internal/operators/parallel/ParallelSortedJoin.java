package io.reactivex.internal.operators.parallel;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.parallel.ParallelFlowable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class ParallelSortedJoin<T> extends Flowable<T> {
    final Comparator<? super T> comparator;
    final ParallelFlowable<List<T>> source;

    public ParallelSortedJoin(ParallelFlowable<List<T>> source, Comparator<? super T> comparator) {
        this.source = source;
        this.comparator = comparator;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super T> s) {
        SortedJoinSubscription<T> parent = new SortedJoinSubscription<>(s, this.source.parallelism(), this.comparator);
        s.onSubscribe(parent);
        this.source.subscribe(parent.subscribers);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class SortedJoinSubscription<T> extends AtomicInteger implements Subscription {
        private static final long serialVersionUID = 3481980673745556697L;
        final Subscriber<? super T> actual;
        volatile boolean cancelled;
        final Comparator<? super T> comparator;
        final int[] indexes;
        final List<T>[] lists;
        final SortedJoinInnerSubscriber<T>[] subscribers;
        final AtomicLong requested = new AtomicLong();
        final AtomicInteger remaining = new AtomicInteger();
        final AtomicReference<Throwable> error = new AtomicReference<>();

        SortedJoinSubscription(Subscriber<? super T> actual, int n, Comparator<? super T> comparator) {
            this.actual = actual;
            this.comparator = comparator;
            SortedJoinInnerSubscriber<T>[] s = new SortedJoinInnerSubscriber[n];
            for (int i = 0; i < n; i++) {
                s[i] = new SortedJoinInnerSubscriber<>(this, i);
            }
            this.subscribers = s;
            this.lists = new List[n];
            this.indexes = new int[n];
            this.remaining.lazySet(n);
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.add(this.requested, n);
                if (this.remaining.get() == 0) {
                    drain();
                }
            }
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                cancelAll();
                if (getAndIncrement() == 0) {
                    Arrays.fill(this.lists, (Object) null);
                }
            }
        }

        void cancelAll() {
            SortedJoinInnerSubscriber<T>[] arr$ = this.subscribers;
            for (SortedJoinInnerSubscriber<T> s : arr$) {
                s.cancel();
            }
        }

        void innerNext(List<T> value, int index) {
            this.lists[index] = value;
            if (this.remaining.decrementAndGet() == 0) {
                drain();
            }
        }

        void innerError(Throwable e) {
            if (this.error.compareAndSet(null, e)) {
                drain();
            } else if (e != this.error.get()) {
                RxJavaPlugins.onError(e);
            }
        }

        void drain() {
            if (getAndIncrement() == 0) {
                int missed = 1;
                Subscriber<? super T> a = this.actual;
                List<T>[] lists = this.lists;
                int[] indexes = this.indexes;
                int n = indexes.length;
                while (true) {
                    long r = this.requested.get();
                    long e = 0;
                    while (e != r) {
                        if (this.cancelled) {
                            Arrays.fill(lists, (Object) null);
                            return;
                        }
                        Throwable ex = this.error.get();
                        if (ex != null) {
                            cancelAll();
                            Arrays.fill(lists, (Object) null);
                            a.onError(ex);
                            return;
                        }
                        T min = null;
                        int minIndex = -1;
                        for (int i = 0; i < n; i++) {
                            List<T> list = lists[i];
                            int index = indexes[i];
                            if (list.size() != index) {
                                if (min == null) {
                                    min = list.get(index);
                                    minIndex = i;
                                } else {
                                    T b = list.get(index);
                                    try {
                                        boolean smaller = this.comparator.compare(min, b) > 0;
                                        if (smaller) {
                                            min = b;
                                            minIndex = i;
                                        }
                                    } catch (Throwable exc) {
                                        Exceptions.throwIfFatal(exc);
                                        cancelAll();
                                        Arrays.fill(lists, (Object) null);
                                        if (!this.error.compareAndSet(null, exc)) {
                                            RxJavaPlugins.onError(exc);
                                        }
                                        a.onError(this.error.get());
                                        return;
                                    }
                                }
                            }
                        }
                        if (min == null) {
                            Arrays.fill(lists, (Object) null);
                            a.onComplete();
                            return;
                        }
                        a.onNext((Object) min);
                        indexes[minIndex] = indexes[minIndex] + 1;
                        e++;
                    }
                    if (e == r) {
                        if (this.cancelled) {
                            Arrays.fill(lists, (Object) null);
                            return;
                        }
                        Throwable ex2 = this.error.get();
                        if (ex2 != null) {
                            cancelAll();
                            Arrays.fill(lists, (Object) null);
                            a.onError(ex2);
                            return;
                        }
                        boolean empty = true;
                        int i2 = 0;
                        while (true) {
                            if (i2 < n) {
                                if (indexes[i2] == lists[i2].size()) {
                                    i2++;
                                } else {
                                    empty = false;
                                    break;
                                }
                            } else {
                                break;
                            }
                        }
                        if (empty) {
                            Arrays.fill(lists, (Object) null);
                            a.onComplete();
                            return;
                        }
                    }
                    if (e != 0 && r != Long.MAX_VALUE) {
                        this.requested.addAndGet(-e);
                    }
                    int w = get();
                    if (w == missed) {
                        missed = addAndGet(-missed);
                        if (missed == 0) {
                            return;
                        }
                    } else {
                        missed = w;
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class SortedJoinInnerSubscriber<T> extends AtomicReference<Subscription> implements FlowableSubscriber<List<T>> {
        private static final long serialVersionUID = 6751017204873808094L;
        final int index;
        final SortedJoinSubscription<T> parent;

        @Override // org.reactivestreams.Subscriber
        public /* bridge */ /* synthetic */ void onNext(Object x0) {
            onNext((List) ((List) x0));
        }

        SortedJoinInnerSubscriber(SortedJoinSubscription<T> parent, int index) {
            this.parent = parent;
            this.index = index;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.setOnce(this, s)) {
                s.request(Long.MAX_VALUE);
            }
        }

        public void onNext(List<T> t) {
            this.parent.innerNext(t, this.index);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.parent.innerError(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
        }

        void cancel() {
            SubscriptionHelper.cancel(this);
        }
    }
}
