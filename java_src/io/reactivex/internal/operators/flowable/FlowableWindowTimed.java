package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.SequentialDisposable;
import io.reactivex.internal.fuseable.SimplePlainQueue;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.internal.subscribers.QueueDrainSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.processors.UnicastProcessor;
import io.reactivex.subscribers.SerializedSubscriber;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;
/* loaded from: classes3.dex */
public final class FlowableWindowTimed<T> extends AbstractFlowableWithUpstream<T, Flowable<T>> {
    final int bufferSize;
    final long maxSize;
    final boolean restartTimerOnMaxSize;
    final Scheduler scheduler;
    final long timeskip;
    final long timespan;
    final TimeUnit unit;

    public FlowableWindowTimed(Flowable<T> source, long timespan, long timeskip, TimeUnit unit, Scheduler scheduler, long maxSize, int bufferSize, boolean restartTimerOnMaxSize) {
        super(source);
        this.timespan = timespan;
        this.timeskip = timeskip;
        this.unit = unit;
        this.scheduler = scheduler;
        this.maxSize = maxSize;
        this.bufferSize = bufferSize;
        this.restartTimerOnMaxSize = restartTimerOnMaxSize;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super Flowable<T>> s) {
        SerializedSubscriber<Flowable<T>> actual = new SerializedSubscriber<>(s);
        if (this.timespan == this.timeskip) {
            if (this.maxSize == Long.MAX_VALUE) {
                this.source.subscribe((FlowableSubscriber) new WindowExactUnboundedSubscriber(actual, this.timespan, this.unit, this.scheduler, this.bufferSize));
                return;
            } else {
                this.source.subscribe((FlowableSubscriber) new WindowExactBoundedSubscriber(actual, this.timespan, this.unit, this.scheduler, this.bufferSize, this.maxSize, this.restartTimerOnMaxSize));
                return;
            }
        }
        this.source.subscribe((FlowableSubscriber) new WindowSkipSubscriber(actual, this.timespan, this.timeskip, this.unit, this.scheduler.createWorker(), this.bufferSize));
    }

    /* loaded from: classes3.dex */
    static final class WindowExactUnboundedSubscriber<T> extends QueueDrainSubscriber<T, Object, Flowable<T>> implements FlowableSubscriber<T>, Subscription, Runnable {
        static final Object NEXT = new Object();
        final int bufferSize;
        Subscription s;
        final Scheduler scheduler;
        volatile boolean terminated;
        final SequentialDisposable timer;
        final long timespan;
        final TimeUnit unit;
        UnicastProcessor<T> window;

        WindowExactUnboundedSubscriber(Subscriber<? super Flowable<T>> actual, long timespan, TimeUnit unit, Scheduler scheduler, int bufferSize) {
            super(actual, new MpscLinkedQueue());
            this.timer = new SequentialDisposable();
            this.timespan = timespan;
            this.unit = unit;
            this.scheduler = scheduler;
            this.bufferSize = bufferSize;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.window = UnicastProcessor.create(this.bufferSize);
                Subscriber<? super V> subscriber = this.actual;
                subscriber.onSubscribe(this);
                long r = requested();
                if (r != 0) {
                    subscriber.onNext(this.window);
                    if (r != Long.MAX_VALUE) {
                        produced(1L);
                    }
                    if (!this.cancelled && this.timer.replace(this.scheduler.schedulePeriodicallyDirect(this, this.timespan, this.timespan, this.unit))) {
                        s.request(Long.MAX_VALUE);
                        return;
                    }
                    return;
                }
                this.cancelled = true;
                s.cancel();
                subscriber.onError(new MissingBackpressureException("Could not deliver first window due to lack of requests."));
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.terminated) {
                if (fastEnter()) {
                    this.window.onNext(t);
                    if (leave(-1) == 0) {
                        return;
                    }
                } else {
                    this.queue.offer(NotificationLite.next(t));
                    if (!enter()) {
                        return;
                    }
                }
                drainLoop();
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.error = t;
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onError(t);
            dispose();
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onComplete();
            dispose();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            requested(n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.cancelled = true;
        }

        public void dispose() {
            DisposableHelper.dispose(this.timer);
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.cancelled) {
                this.terminated = true;
                dispose();
            }
            this.queue.offer(NEXT);
            if (enter()) {
                drainLoop();
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:10:0x0024, code lost:
            r9 = r9;
            r9.onError(r2);
         */
        /* JADX WARN: Code restructure failed: missing block: B:11:0x0027, code lost:
            return;
         */
        /* JADX WARN: Code restructure failed: missing block: B:12:0x0028, code lost:
            r9 = r9;
            r9.onComplete();
         */
        /* JADX WARN: Code restructure failed: missing block: B:46:?, code lost:
            return;
         */
        /* JADX WARN: Code restructure failed: missing block: B:8:0x0018, code lost:
            r13.window = null;
            r5.clear();
            dispose();
            r2 = r13.error;
         */
        /* JADX WARN: Code restructure failed: missing block: B:9:0x0022, code lost:
            if (r2 == null) goto L13;
         */
        /* JADX WARN: Multi-variable type inference failed */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        void drainLoop() {
            /*
                r13 = this;
                r12 = 0
                io.reactivex.internal.fuseable.SimplePlainQueue<U> r5 = r13.queue
                org.reactivestreams.Subscriber<? super V> r0 = r13.actual
                io.reactivex.processors.UnicastProcessor<T> r9 = r13.window
                r3 = 1
            L8:
                boolean r8 = r13.terminated
                boolean r1 = r13.done
                java.lang.Object r4 = r5.mo1188poll()
                if (r1 == 0) goto L2c
                if (r4 == 0) goto L18
                java.lang.Object r10 = io.reactivex.internal.operators.flowable.FlowableWindowTimed.WindowExactUnboundedSubscriber.NEXT
                if (r4 != r10) goto L2c
            L18:
                r13.window = r12
                r5.clear()
                r13.dispose()
                java.lang.Throwable r2 = r13.error
                if (r2 == 0) goto L28
                r9.onError(r2)
            L27:
                return
            L28:
                r9.onComplete()
                goto L27
            L2c:
                if (r4 != 0) goto L36
                int r10 = -r3
                int r3 = r13.leave(r10)
                if (r3 != 0) goto L8
                goto L27
            L36:
                java.lang.Object r10 = io.reactivex.internal.operators.flowable.FlowableWindowTimed.WindowExactUnboundedSubscriber.NEXT
                if (r4 != r10) goto L84
                r9.onComplete()
                if (r8 != 0) goto L7e
                int r10 = r13.bufferSize
                io.reactivex.processors.UnicastProcessor r9 = io.reactivex.processors.UnicastProcessor.create(r10)
                r13.window = r9
                long r6 = r13.requested()
                r10 = 0
                int r10 = (r6 > r10 ? 1 : (r6 == r10 ? 0 : -1))
                if (r10 == 0) goto L63
                r0.onNext(r9)
                r10 = 9223372036854775807(0x7fffffffffffffff, double:NaN)
                int r10 = (r6 > r10 ? 1 : (r6 == r10 ? 0 : -1))
                if (r10 == 0) goto L8
                r10 = 1
                r13.produced(r10)
                goto L8
            L63:
                r13.window = r12
                io.reactivex.internal.fuseable.SimplePlainQueue<U> r10 = r13.queue
                r10.clear()
                org.reactivestreams.Subscription r10 = r13.s
                r10.cancel()
                r13.dispose()
                io.reactivex.exceptions.MissingBackpressureException r10 = new io.reactivex.exceptions.MissingBackpressureException
                java.lang.String r11 = "Could not deliver first window due to lack of requests."
                r10.<init>(r11)
                r0.onError(r10)
                goto L27
            L7e:
                org.reactivestreams.Subscription r10 = r13.s
                r10.cancel()
                goto L8
            L84:
                java.lang.Object r10 = io.reactivex.internal.util.NotificationLite.getValue(r4)
                r9.onNext(r10)
                goto L8
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableWindowTimed.WindowExactUnboundedSubscriber.drainLoop():void");
        }
    }

    /* loaded from: classes3.dex */
    static final class WindowExactBoundedSubscriber<T> extends QueueDrainSubscriber<T, Object, Flowable<T>> implements Subscription {
        final int bufferSize;
        long count;
        final long maxSize;
        long producerIndex;
        final boolean restartTimerOnMaxSize;
        Subscription s;
        final Scheduler scheduler;
        volatile boolean terminated;
        final SequentialDisposable timer;
        final long timespan;
        final TimeUnit unit;
        UnicastProcessor<T> window;
        final Scheduler.Worker worker;

        WindowExactBoundedSubscriber(Subscriber<? super Flowable<T>> actual, long timespan, TimeUnit unit, Scheduler scheduler, int bufferSize, long maxSize, boolean restartTimerOnMaxSize) {
            super(actual, new MpscLinkedQueue());
            this.timer = new SequentialDisposable();
            this.timespan = timespan;
            this.unit = unit;
            this.scheduler = scheduler;
            this.bufferSize = bufferSize;
            this.maxSize = maxSize;
            this.restartTimerOnMaxSize = restartTimerOnMaxSize;
            if (restartTimerOnMaxSize) {
                this.worker = scheduler.createWorker();
            } else {
                this.worker = null;
            }
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            Disposable d;
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                Subscriber<? super V> subscriber = this.actual;
                subscriber.onSubscribe(this);
                if (!this.cancelled) {
                    UnicastProcessor<T> w = UnicastProcessor.create(this.bufferSize);
                    this.window = w;
                    long r = requested();
                    if (r != 0) {
                        subscriber.onNext(w);
                        if (r != Long.MAX_VALUE) {
                            produced(1L);
                        }
                        ConsumerIndexHolder consumerIndexHolder = new ConsumerIndexHolder(this.producerIndex, this);
                        if (this.restartTimerOnMaxSize) {
                            d = this.worker.schedulePeriodically(consumerIndexHolder, this.timespan, this.timespan, this.unit);
                        } else {
                            d = this.scheduler.schedulePeriodicallyDirect(consumerIndexHolder, this.timespan, this.timespan, this.unit);
                        }
                        if (this.timer.replace(d)) {
                            s.request(Long.MAX_VALUE);
                            return;
                        }
                        return;
                    }
                    this.cancelled = true;
                    s.cancel();
                    subscriber.onError(new MissingBackpressureException("Could not deliver initial window due to lack of requests."));
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.terminated) {
                if (fastEnter()) {
                    UnicastProcessor<T> w = this.window;
                    w.onNext(t);
                    long c = this.count + 1;
                    if (c >= this.maxSize) {
                        this.producerIndex++;
                        this.count = 0L;
                        w.onComplete();
                        long r = requested();
                        if (r != 0) {
                            UnicastProcessor<T> w2 = UnicastProcessor.create(this.bufferSize);
                            this.window = w2;
                            this.actual.onNext(w2);
                            if (r != Long.MAX_VALUE) {
                                produced(1L);
                            }
                            if (this.restartTimerOnMaxSize) {
                                Disposable tm = this.timer.get();
                                tm.dispose();
                                Disposable task = this.worker.schedulePeriodically(new ConsumerIndexHolder(this.producerIndex, this), this.timespan, this.timespan, this.unit);
                                if (!this.timer.compareAndSet(tm, task)) {
                                    task.dispose();
                                }
                            }
                        } else {
                            this.window = null;
                            this.s.cancel();
                            this.actual.onError(new MissingBackpressureException("Could not deliver window due to lack of requests"));
                            dispose();
                            return;
                        }
                    } else {
                        this.count = c;
                    }
                    if (leave(-1) == 0) {
                        return;
                    }
                } else {
                    this.queue.offer(NotificationLite.next(t));
                    if (!enter()) {
                        return;
                    }
                }
                drainLoop();
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.error = t;
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onError(t);
            dispose();
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onComplete();
            dispose();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            requested(n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.cancelled = true;
        }

        public void dispose() {
            DisposableHelper.dispose(this.timer);
            Scheduler.Worker w = this.worker;
            if (w != null) {
                w.dispose();
            }
        }

        void drainLoop() {
            SimplePlainQueue<Object> q = this.queue;
            Subscriber<? super V> subscriber = this.actual;
            UnicastProcessor<T> w = this.window;
            int missed = 1;
            while (!this.terminated) {
                boolean d = this.done;
                Object o = q.mo1188poll();
                boolean empty = o == null;
                boolean isHolder = o instanceof ConsumerIndexHolder;
                if (d && (empty || isHolder)) {
                    this.window = null;
                    q.clear();
                    Throwable err = this.error;
                    if (err != null) {
                        w.onError(err);
                    } else {
                        w.onComplete();
                    }
                    dispose();
                    return;
                } else if (!empty) {
                    if (isHolder) {
                        ConsumerIndexHolder consumerIndexHolder = (ConsumerIndexHolder) o;
                        if (this.restartTimerOnMaxSize || this.producerIndex == consumerIndexHolder.index) {
                            w.onComplete();
                            this.count = 0L;
                            w = UnicastProcessor.create(this.bufferSize);
                            this.window = w;
                            long r = requested();
                            if (r != 0) {
                                subscriber.onNext(w);
                                if (r != Long.MAX_VALUE) {
                                    produced(1L);
                                }
                            } else {
                                this.window = null;
                                this.queue.clear();
                                this.s.cancel();
                                subscriber.onError(new MissingBackpressureException("Could not deliver first window due to lack of requests."));
                                dispose();
                                return;
                            }
                        }
                    } else {
                        w.onNext((T) NotificationLite.getValue(o));
                        long c = this.count + 1;
                        if (c >= this.maxSize) {
                            this.producerIndex++;
                            this.count = 0L;
                            w.onComplete();
                            long r2 = requested();
                            if (r2 != 0) {
                                w = UnicastProcessor.create(this.bufferSize);
                                this.window = w;
                                this.actual.onNext(w);
                                if (r2 != Long.MAX_VALUE) {
                                    produced(1L);
                                }
                                if (this.restartTimerOnMaxSize) {
                                    Disposable tm = this.timer.get();
                                    tm.dispose();
                                    Disposable task = this.worker.schedulePeriodically(new ConsumerIndexHolder(this.producerIndex, this), this.timespan, this.timespan, this.unit);
                                    if (!this.timer.compareAndSet(tm, task)) {
                                        task.dispose();
                                    }
                                }
                            } else {
                                this.window = null;
                                this.s.cancel();
                                this.actual.onError(new MissingBackpressureException("Could not deliver window due to lack of requests"));
                                dispose();
                                return;
                            }
                        } else {
                            this.count = c;
                        }
                    }
                } else {
                    missed = leave(-missed);
                    if (missed == 0) {
                        return;
                    }
                }
            }
            this.s.cancel();
            q.clear();
            dispose();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public static final class ConsumerIndexHolder implements Runnable {
            final long index;
            final WindowExactBoundedSubscriber<?> parent;

            ConsumerIndexHolder(long index, WindowExactBoundedSubscriber<?> parent) {
                this.index = index;
                this.parent = parent;
            }

            @Override // java.lang.Runnable
            public void run() {
                WindowExactBoundedSubscriber<?> p = this.parent;
                if (!((WindowExactBoundedSubscriber) p).cancelled) {
                    ((WindowExactBoundedSubscriber) p).queue.offer(this);
                } else {
                    p.terminated = true;
                    p.dispose();
                }
                if (p.enter()) {
                    p.drainLoop();
                }
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class WindowSkipSubscriber<T> extends QueueDrainSubscriber<T, Object, Flowable<T>> implements Subscription, Runnable {
        final int bufferSize;
        Subscription s;
        volatile boolean terminated;
        final long timeskip;
        final long timespan;
        final TimeUnit unit;
        final List<UnicastProcessor<T>> windows;
        final Scheduler.Worker worker;

        WindowSkipSubscriber(Subscriber<? super Flowable<T>> actual, long timespan, long timeskip, TimeUnit unit, Scheduler.Worker worker, int bufferSize) {
            super(actual, new MpscLinkedQueue());
            this.timespan = timespan;
            this.timeskip = timeskip;
            this.unit = unit;
            this.worker = worker;
            this.bufferSize = bufferSize;
            this.windows = new LinkedList();
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription s) {
            if (SubscriptionHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
                if (!this.cancelled) {
                    long r = requested();
                    if (r != 0) {
                        UnicastProcessor<T> w = UnicastProcessor.create(this.bufferSize);
                        this.windows.add(w);
                        this.actual.onNext(w);
                        if (r != Long.MAX_VALUE) {
                            produced(1L);
                        }
                        this.worker.schedule(new Completion(w), this.timespan, this.unit);
                        this.worker.schedulePeriodically(this, this.timeskip, this.timeskip, this.unit);
                        s.request(Long.MAX_VALUE);
                        return;
                    }
                    s.cancel();
                    this.actual.onError(new MissingBackpressureException("Could not emit the first window due to lack of requests"));
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (fastEnter()) {
                for (UnicastProcessor<T> w : this.windows) {
                    w.onNext(t);
                }
                if (leave(-1) == 0) {
                    return;
                }
            } else {
                this.queue.offer(t);
                if (!enter()) {
                    return;
                }
            }
            drainLoop();
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable t) {
            this.error = t;
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onError(t);
            dispose();
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onComplete();
            dispose();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long n) {
            requested(n);
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.cancelled = true;
        }

        public void dispose() {
            this.worker.dispose();
        }

        void complete(UnicastProcessor<T> w) {
            this.queue.offer(new SubjectWork(w, false));
            if (enter()) {
                drainLoop();
            }
        }

        void drainLoop() {
            SimplePlainQueue<Object> q = this.queue;
            Subscriber<? super V> subscriber = this.actual;
            List<UnicastProcessor<T>> ws = this.windows;
            int missed = 1;
            while (!this.terminated) {
                boolean d = this.done;
                T t = (T) q.mo1188poll();
                boolean empty = t == null;
                boolean sw = t instanceof SubjectWork;
                if (d && (empty || sw)) {
                    q.clear();
                    Throwable e = this.error;
                    if (e != null) {
                        for (UnicastProcessor<T> w : ws) {
                            w.onError(e);
                        }
                    } else {
                        for (UnicastProcessor<T> w2 : ws) {
                            w2.onComplete();
                        }
                    }
                    ws.clear();
                    dispose();
                    return;
                } else if (!empty) {
                    if (sw) {
                        SubjectWork<T> work = (SubjectWork) t;
                        if (work.open) {
                            if (!this.cancelled) {
                                long r = requested();
                                if (r != 0) {
                                    UnicastProcessor<T> w3 = UnicastProcessor.create(this.bufferSize);
                                    ws.add(w3);
                                    subscriber.onNext(w3);
                                    if (r != Long.MAX_VALUE) {
                                        produced(1L);
                                    }
                                    this.worker.schedule(new Completion(w3), this.timespan, this.unit);
                                } else {
                                    subscriber.onError(new MissingBackpressureException("Can't emit window due to lack of requests"));
                                }
                            }
                        } else {
                            ws.remove(work.w);
                            work.w.onComplete();
                            if (ws.isEmpty() && this.cancelled) {
                                this.terminated = true;
                            }
                        }
                    } else {
                        for (UnicastProcessor<T> w4 : ws) {
                            w4.onNext(t);
                        }
                    }
                } else {
                    missed = leave(-missed);
                    if (missed == 0) {
                        return;
                    }
                }
            }
            this.s.cancel();
            dispose();
            q.clear();
            ws.clear();
        }

        @Override // java.lang.Runnable
        public void run() {
            UnicastProcessor<T> w = UnicastProcessor.create(this.bufferSize);
            SubjectWork<T> sw = new SubjectWork<>(w, true);
            if (!this.cancelled) {
                this.queue.offer(sw);
            }
            if (enter()) {
                drainLoop();
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public static final class SubjectWork<T> {
            final boolean open;
            final UnicastProcessor<T> w;

            SubjectWork(UnicastProcessor<T> w, boolean open) {
                this.w = w;
                this.open = open;
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public final class Completion implements Runnable {
            private final UnicastProcessor<T> processor;

            Completion(UnicastProcessor<T> processor) {
                this.processor = processor;
            }

            @Override // java.lang.Runnable
            public void run() {
                WindowSkipSubscriber.this.complete(this.processor);
            }
        }
    }
}
