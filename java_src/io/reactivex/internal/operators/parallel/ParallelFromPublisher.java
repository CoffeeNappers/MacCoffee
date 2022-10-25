package io.reactivex.internal.operators.parallel;

import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.parallel.ParallelFlowable;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLongArray;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class ParallelFromPublisher<T> extends ParallelFlowable<T> {
    final int parallelism;
    final int prefetch;
    final Publisher<? extends T> source;

    public ParallelFromPublisher(Publisher<? extends T> source, int parallelism, int prefetch) {
        this.source = source;
        this.parallelism = parallelism;
        this.prefetch = prefetch;
    }

    @Override // io.reactivex.parallel.ParallelFlowable
    public int parallelism() {
        return this.parallelism;
    }

    @Override // io.reactivex.parallel.ParallelFlowable
    public void subscribe(Subscriber<? super T>[] subscribers) {
        if (validate(subscribers)) {
            this.source.subscribe(new ParallelDispatcher(subscribers, this.prefetch));
        }
    }

    /* loaded from: classes3.dex */
    static final class ParallelDispatcher<T> extends AtomicInteger implements FlowableSubscriber<T> {
        private static final long serialVersionUID = -4470634016609963609L;
        volatile boolean cancelled;
        volatile boolean done;
        final long[] emissions;
        Throwable error;
        int index;
        final int limit;
        final int prefetch;
        int produced;
        SimpleQueue<T> queue;
        final AtomicLongArray requests;
        Subscription s;
        int sourceMode;
        final AtomicInteger subscriberCount = new AtomicInteger();
        final Subscriber<? super T>[] subscribers;

        ParallelDispatcher(Subscriber<? super T>[] subscribers, int prefetch) {
            this.subscribers = subscribers;
            this.prefetch = prefetch;
            this.limit = prefetch - (prefetch >> 2);
            int m = subscribers.length;
            this.requests = new AtomicLongArray(m + m + 1);
            this.requests.lazySet(m + m, m);
            this.emissions = new long[m];
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                if (s instanceof QueueSubscription) {
                    QueueSubscription<T> qs = (QueueSubscription) s;
                    int m = qs.requestFusion(3);
                    if (m == 1) {
                        this.sourceMode = m;
                        this.queue = qs;
                        this.done = true;
                        setupSubscribers();
                        drain();
                        return;
                    } else if (m == 2) {
                        this.sourceMode = m;
                        this.queue = qs;
                        setupSubscribers();
                        s.request(this.prefetch);
                        return;
                    }
                }
                this.queue = new SpscArrayQueue(this.prefetch);
                setupSubscribers();
                s.request(this.prefetch);
            }
        }

        void setupSubscribers() {
            Subscriber<? super T>[] subs = this.subscribers;
            int m = subs.length;
            for (int i = 0; i < m && !this.cancelled; i++) {
                this.subscriberCount.lazySet(i + 1);
                subs[i].onSubscribe(new RailSubscription(i, m));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public final class RailSubscription implements Subscription {
            final int j;
            final int m;

            RailSubscription(int j, int m) {
                this.j = j;
                this.m = m;
            }

            @Override // org.reactivestreams.Subscription
            public void request(long n) {
                long r;
                long u;
                if (SubscriptionHelper.validate(n)) {
                    AtomicLongArray ra = ParallelDispatcher.this.requests;
                    do {
                        r = ra.get(this.j);
                        if (r != Long.MAX_VALUE) {
                            u = BackpressureHelper.addCap(r, n);
                        } else {
                            return;
                        }
                    } while (!ra.compareAndSet(this.j, r, u));
                    if (ParallelDispatcher.this.subscriberCount.get() == this.m) {
                        ParallelDispatcher.this.drain();
                    }
                }
            }

            @Override // org.reactivestreams.Subscription
            public void cancel() {
                if (ParallelDispatcher.this.requests.compareAndSet(this.m + this.j, 0L, 1L)) {
                    ParallelDispatcher.this.cancel(this.m + this.m);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (this.sourceMode == 0 && !this.queue.offer(t)) {
                this.s.cancel();
                onError(new MissingBackpressureException("Queue is full?"));
                return;
            }
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

        void cancel(int m) {
            if (this.requests.decrementAndGet(m) == 0) {
                this.cancelled = true;
                this.s.cancel();
                if (getAndIncrement() == 0) {
                    this.queue.clear();
                }
            }
        }

        void drainAsync() {
            Throwable ex;
            int missed = 1;
            SimpleQueue<T> q = this.queue;
            Subscriber<? super T>[] a = this.subscribers;
            AtomicLongArray r = this.requests;
            long[] e = this.emissions;
            int n = e.length;
            int idx = this.index;
            int consumed = this.produced;
            while (true) {
                int notReady = 0;
                while (!this.cancelled) {
                    boolean d = this.done;
                    if (d && (ex = this.error) != null) {
                        q.clear();
                        for (Subscriber<? super T> s : a) {
                            s.onError(ex);
                        }
                        return;
                    }
                    boolean empty = q.isEmpty();
                    if (d && empty) {
                        for (Subscriber<? super T> s2 : a) {
                            s2.onComplete();
                        }
                        return;
                    }
                    if (!empty) {
                        long requestAtIndex = r.get(idx);
                        long emissionAtIndex = e[idx];
                        if (requestAtIndex != emissionAtIndex && r.get(n + idx) == 0) {
                            try {
                                T v = q.mo1188poll();
                                if (v != null) {
                                    a[idx].onNext(v);
                                    e[idx] = 1 + emissionAtIndex;
                                    consumed++;
                                    if (consumed == this.limit) {
                                        consumed = 0;
                                        this.s.request(consumed);
                                    }
                                    notReady = 0;
                                }
                            } catch (Throwable ex2) {
                                Exceptions.throwIfFatal(ex2);
                                this.s.cancel();
                                for (Subscriber<? super T> s3 : a) {
                                    s3.onError(ex2);
                                }
                                return;
                            }
                        } else {
                            notReady++;
                        }
                        idx++;
                        if (idx == n) {
                            idx = 0;
                        }
                        if (notReady == n) {
                        }
                    }
                    int w = get();
                    if (w == missed) {
                        this.index = idx;
                        this.produced = consumed;
                        missed = addAndGet(-missed);
                        if (missed == 0) {
                            return;
                        }
                    } else {
                        missed = w;
                    }
                }
                q.clear();
                return;
            }
        }

        void drainSync() {
            int missed = 1;
            SimpleQueue<T> q = this.queue;
            Subscriber<? super T>[] a = this.subscribers;
            AtomicLongArray r = this.requests;
            long[] e = this.emissions;
            int n = e.length;
            int idx = this.index;
            while (true) {
                int notReady = 0;
                while (!this.cancelled) {
                    boolean empty = q.isEmpty();
                    if (empty) {
                        for (Subscriber<? super T> s : a) {
                            s.onComplete();
                        }
                        return;
                    }
                    long requestAtIndex = r.get(idx);
                    long emissionAtIndex = e[idx];
                    if (requestAtIndex != emissionAtIndex && r.get(n + idx) == 0) {
                        try {
                            T v = q.mo1188poll();
                            if (v == null) {
                                for (Subscriber<? super T> s2 : a) {
                                    s2.onComplete();
                                }
                                return;
                            }
                            a[idx].onNext(v);
                            e[idx] = 1 + emissionAtIndex;
                            notReady = 0;
                        } catch (Throwable ex) {
                            Exceptions.throwIfFatal(ex);
                            this.s.cancel();
                            for (Subscriber<? super T> s3 : a) {
                                s3.onError(ex);
                            }
                            return;
                        }
                    } else {
                        notReady++;
                    }
                    idx++;
                    if (idx == n) {
                        idx = 0;
                        continue;
                    }
                    if (notReady == n) {
                        int w = get();
                        if (w == missed) {
                            this.index = idx;
                            missed = addAndGet(-missed);
                            if (missed == 0) {
                                return;
                            }
                        } else {
                            missed = w;
                        }
                    }
                }
                q.clear();
                return;
            }
        }

        void drain() {
            if (getAndIncrement() == 0) {
                if (this.sourceMode == 1) {
                    drainSync();
                } else {
                    drainAsync();
                }
            }
        }
    }
}
