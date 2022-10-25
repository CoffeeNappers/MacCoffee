package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.Scheduler;
import io.reactivex.annotations.Nullable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.internal.fuseable.ConditionalSubscriber;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.subscriptions.BasicIntQueueSubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicLong;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableObserveOn<T> extends AbstractFlowableWithUpstream<T, T> {
    final boolean delayError;
    final int prefetch;
    final Scheduler scheduler;

    public FlowableObserveOn(Flowable<T> source, Scheduler scheduler, boolean delayError, int prefetch) {
        super(source);
        this.scheduler = scheduler;
        this.delayError = delayError;
        this.prefetch = prefetch;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super T> s) {
        Scheduler.Worker worker = this.scheduler.createWorker();
        if (s instanceof ConditionalSubscriber) {
            this.source.subscribe((FlowableSubscriber) new ObserveOnConditionalSubscriber((ConditionalSubscriber) s, worker, this.delayError, this.prefetch));
        } else {
            this.source.subscribe((FlowableSubscriber) new ObserveOnSubscriber(s, worker, this.delayError, this.prefetch));
        }
    }

    /* loaded from: classes3.dex */
    static abstract class BaseObserveOnSubscriber<T> extends BasicIntQueueSubscription<T> implements FlowableSubscriber<T>, Runnable {
        private static final long serialVersionUID = -8241002408341274697L;
        volatile boolean cancelled;
        final boolean delayError;
        volatile boolean done;
        Throwable error;
        final int limit;
        boolean outputFused;
        final int prefetch;
        long produced;
        SimpleQueue<T> queue;
        final AtomicLong requested = new AtomicLong();
        Subscription s;
        int sourceMode;
        final Scheduler.Worker worker;

        abstract void runAsync();

        abstract void runBackfused();

        abstract void runSync();

        BaseObserveOnSubscriber(Scheduler.Worker worker, boolean delayError, int prefetch) {
            this.worker = worker;
            this.delayError = delayError;
            this.prefetch = prefetch;
            this.limit = prefetch - (prefetch >> 2);
        }

        @Override // org.reactivestreams.Subscriber
        public final void onNext(T t) {
            if (!this.done) {
                if (this.sourceMode == 2) {
                    trySchedule();
                    return;
                }
                if (!this.queue.offer(t)) {
                    this.s.cancel();
                    this.error = new MissingBackpressureException("Queue is full?!");
                    this.done = true;
                }
                trySchedule();
            }
        }

        @Override // org.reactivestreams.Subscriber
        public final void onError(Throwable t) {
            if (this.done) {
                RxJavaPlugins.onError(t);
                return;
            }
            this.error = t;
            this.done = true;
            trySchedule();
        }

        @Override // org.reactivestreams.Subscriber
        public final void onComplete() {
            if (!this.done) {
                this.done = true;
                trySchedule();
            }
        }

        @Override // org.reactivestreams.Subscription
        public final void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.add(this.requested, n);
                trySchedule();
            }
        }

        @Override // org.reactivestreams.Subscription
        public final void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.cancel();
                this.worker.dispose();
                if (getAndIncrement() == 0) {
                    this.queue.clear();
                }
            }
        }

        final void trySchedule() {
            if (getAndIncrement() == 0) {
                this.worker.schedule(this);
            }
        }

        @Override // java.lang.Runnable
        public final void run() {
            if (this.outputFused) {
                runBackfused();
            } else if (this.sourceMode == 1) {
                runSync();
            } else {
                runAsync();
            }
        }

        final boolean checkTerminated(boolean d, boolean empty, Subscriber<?> a) {
            if (this.cancelled) {
                clear();
                return true;
            }
            if (d) {
                if (this.delayError) {
                    if (empty) {
                        Throwable e = this.error;
                        if (e != null) {
                            a.onError(e);
                        } else {
                            a.onComplete();
                        }
                        this.worker.dispose();
                        return true;
                    }
                } else {
                    Throwable e2 = this.error;
                    if (e2 != null) {
                        clear();
                        a.onError(e2);
                        this.worker.dispose();
                        return true;
                    } else if (empty) {
                        a.onComplete();
                        this.worker.dispose();
                        return true;
                    }
                }
            }
            return false;
        }

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public final int requestFusion(int requestedMode) {
            if ((requestedMode & 2) != 0) {
                this.outputFused = true;
                return 2;
            }
            return 0;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public final void clear() {
            this.queue.clear();
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public final boolean isEmpty() {
            return this.queue.isEmpty();
        }
    }

    /* loaded from: classes3.dex */
    static final class ObserveOnSubscriber<T> extends BaseObserveOnSubscriber<T> implements FlowableSubscriber<T> {
        private static final long serialVersionUID = -4547113800637756442L;
        final Subscriber<? super T> actual;

        ObserveOnSubscriber(Subscriber<? super T> actual, Scheduler.Worker worker, boolean delayError, int prefetch) {
            super(worker, delayError, prefetch);
            this.actual = actual;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                if (s instanceof QueueSubscription) {
                    QueueSubscription<T> f = (QueueSubscription) s;
                    int m = f.requestFusion(7);
                    if (m == 1) {
                        this.sourceMode = 1;
                        this.queue = f;
                        this.done = true;
                        this.actual.onSubscribe(this);
                        return;
                    } else if (m == 2) {
                        this.sourceMode = 2;
                        this.queue = f;
                        this.actual.onSubscribe(this);
                        s.request(this.prefetch);
                        return;
                    }
                }
                this.queue = new SpscArrayQueue(this.prefetch);
                this.actual.onSubscribe(this);
                s.request(this.prefetch);
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableObserveOn.BaseObserveOnSubscriber
        void runSync() {
            int missed = 1;
            Subscriber<? super T> a = this.actual;
            SimpleQueue<T> q = this.queue;
            long e = this.produced;
            while (true) {
                long r = this.requested.get();
                while (e != r) {
                    try {
                        Object obj = (T) q.mo1188poll();
                        if (!this.cancelled) {
                            if (obj == null) {
                                a.onComplete();
                                this.worker.dispose();
                                return;
                            }
                            a.onNext(obj);
                            e++;
                        } else {
                            return;
                        }
                    } catch (Throwable ex) {
                        Exceptions.throwIfFatal(ex);
                        this.s.cancel();
                        a.onError(ex);
                        this.worker.dispose();
                        return;
                    }
                }
                if (!this.cancelled) {
                    if (q.isEmpty()) {
                        a.onComplete();
                        this.worker.dispose();
                        return;
                    }
                    int w = get();
                    if (missed == w) {
                        this.produced = e;
                        missed = addAndGet(-missed);
                        if (missed == 0) {
                            return;
                        }
                    } else {
                        missed = w;
                    }
                } else {
                    return;
                }
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableObserveOn.BaseObserveOnSubscriber
        void runAsync() {
            int missed = 1;
            Subscriber<? super T> a = this.actual;
            SimpleQueue<T> q = this.queue;
            long e = this.produced;
            while (true) {
                long r = this.requested.get();
                while (e != r) {
                    boolean d = this.done;
                    try {
                        Object obj = (T) q.mo1188poll();
                        boolean empty = obj == null;
                        if (!checkTerminated(d, empty, a)) {
                            if (empty) {
                                break;
                            }
                            a.onNext(obj);
                            e++;
                            if (e == this.limit) {
                                if (r != Long.MAX_VALUE) {
                                    r = this.requested.addAndGet(-e);
                                }
                                this.s.request(e);
                                e = 0;
                            }
                        } else {
                            return;
                        }
                    } catch (Throwable ex) {
                        Exceptions.throwIfFatal(ex);
                        this.s.cancel();
                        q.clear();
                        a.onError(ex);
                        this.worker.dispose();
                        return;
                    }
                }
                if (e != r || !checkTerminated(this.done, q.isEmpty(), a)) {
                    int w = get();
                    if (missed == w) {
                        this.produced = e;
                        missed = addAndGet(-missed);
                        if (missed == 0) {
                            return;
                        }
                    } else {
                        missed = w;
                    }
                } else {
                    return;
                }
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableObserveOn.BaseObserveOnSubscriber
        void runBackfused() {
            int missed = 1;
            while (!this.cancelled) {
                boolean d = this.done;
                this.actual.onNext(null);
                if (d) {
                    Throwable e = this.error;
                    if (e != null) {
                        this.actual.onError(e);
                    } else {
                        this.actual.onComplete();
                    }
                    this.worker.dispose();
                    return;
                }
                missed = addAndGet(-missed);
                if (missed == 0) {
                    return;
                }
            }
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public T mo1188poll() throws Exception {
            T v = this.queue.mo1188poll();
            if (v != null && this.sourceMode != 1) {
                long p = this.produced + 1;
                if (p == this.limit) {
                    this.produced = 0L;
                    this.s.request(p);
                } else {
                    this.produced = p;
                }
            }
            return v;
        }
    }

    /* loaded from: classes3.dex */
    static final class ObserveOnConditionalSubscriber<T> extends BaseObserveOnSubscriber<T> {
        private static final long serialVersionUID = 644624475404284533L;
        final ConditionalSubscriber<? super T> actual;
        long consumed;

        ObserveOnConditionalSubscriber(ConditionalSubscriber<? super T> actual, Scheduler.Worker worker, boolean delayError, int prefetch) {
            super(worker, delayError, prefetch);
            this.actual = actual;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                if (s instanceof QueueSubscription) {
                    QueueSubscription<T> f = (QueueSubscription) s;
                    int m = f.requestFusion(7);
                    if (m == 1) {
                        this.sourceMode = 1;
                        this.queue = f;
                        this.done = true;
                        this.actual.onSubscribe(this);
                        return;
                    } else if (m == 2) {
                        this.sourceMode = 2;
                        this.queue = f;
                        this.actual.onSubscribe(this);
                        s.request(this.prefetch);
                        return;
                    }
                }
                this.queue = new SpscArrayQueue(this.prefetch);
                this.actual.onSubscribe(this);
                s.request(this.prefetch);
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableObserveOn.BaseObserveOnSubscriber
        void runSync() {
            int missed = 1;
            ConditionalSubscriber<? super T> a = this.actual;
            SimpleQueue<T> q = this.queue;
            long e = this.produced;
            while (true) {
                long r = this.requested.get();
                while (e != r) {
                    try {
                        Object obj = (T) q.mo1188poll();
                        if (!this.cancelled) {
                            if (obj == null) {
                                a.onComplete();
                                this.worker.dispose();
                                return;
                            } else if (a.tryOnNext(obj)) {
                                e++;
                            }
                        } else {
                            return;
                        }
                    } catch (Throwable ex) {
                        Exceptions.throwIfFatal(ex);
                        this.s.cancel();
                        a.onError(ex);
                        this.worker.dispose();
                        return;
                    }
                }
                if (!this.cancelled) {
                    if (q.isEmpty()) {
                        a.onComplete();
                        this.worker.dispose();
                        return;
                    }
                    int w = get();
                    if (missed == w) {
                        this.produced = e;
                        missed = addAndGet(-missed);
                        if (missed == 0) {
                            return;
                        }
                    } else {
                        missed = w;
                    }
                } else {
                    return;
                }
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableObserveOn.BaseObserveOnSubscriber
        void runAsync() {
            int missed = 1;
            ConditionalSubscriber<? super T> a = this.actual;
            SimpleQueue<T> q = this.queue;
            long emitted = this.produced;
            long polled = this.consumed;
            while (true) {
                long r = this.requested.get();
                while (emitted != r) {
                    boolean d = this.done;
                    try {
                        Object obj = (T) q.mo1188poll();
                        boolean empty = obj == null;
                        if (!checkTerminated(d, empty, a)) {
                            if (empty) {
                                break;
                            }
                            if (a.tryOnNext(obj)) {
                                emitted++;
                            }
                            polled++;
                            if (polled == this.limit) {
                                this.s.request(polled);
                                polled = 0;
                            }
                        } else {
                            return;
                        }
                    } catch (Throwable ex) {
                        Exceptions.throwIfFatal(ex);
                        this.s.cancel();
                        q.clear();
                        a.onError(ex);
                        this.worker.dispose();
                        return;
                    }
                }
                if (emitted != r || !checkTerminated(this.done, q.isEmpty(), a)) {
                    int w = get();
                    if (missed == w) {
                        this.produced = emitted;
                        this.consumed = polled;
                        missed = addAndGet(-missed);
                        if (missed == 0) {
                            return;
                        }
                    } else {
                        missed = w;
                    }
                } else {
                    return;
                }
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableObserveOn.BaseObserveOnSubscriber
        void runBackfused() {
            int missed = 1;
            while (!this.cancelled) {
                boolean d = this.done;
                this.actual.onNext(null);
                if (d) {
                    Throwable e = this.error;
                    if (e != null) {
                        this.actual.onError(e);
                    } else {
                        this.actual.onComplete();
                    }
                    this.worker.dispose();
                    return;
                }
                missed = addAndGet(-missed);
                if (missed == 0) {
                    return;
                }
            }
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public T mo1188poll() throws Exception {
            T v = this.queue.mo1188poll();
            if (v != null && this.sourceMode != 1) {
                long p = this.consumed + 1;
                if (p == this.limit) {
                    this.consumed = 0L;
                    this.s.request(p);
                } else {
                    this.consumed = p;
                }
            }
            return v;
        }
    }
}
