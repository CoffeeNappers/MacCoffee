package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.observers.QueueDrainObserver;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.observers.SerializedObserver;
import io.reactivex.subjects.UnicastSubject;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ObservableWindowTimed<T> extends AbstractObservableWithUpstream<T, Observable<T>> {
    final int bufferSize;
    final long maxSize;
    final boolean restartTimerOnMaxSize;
    final Scheduler scheduler;
    final long timeskip;
    final long timespan;
    final TimeUnit unit;

    public ObservableWindowTimed(ObservableSource<T> source, long timespan, long timeskip, TimeUnit unit, Scheduler scheduler, long maxSize, int bufferSize, boolean restartTimerOnMaxSize) {
        super(source);
        this.timespan = timespan;
        this.timeskip = timeskip;
        this.unit = unit;
        this.scheduler = scheduler;
        this.maxSize = maxSize;
        this.bufferSize = bufferSize;
        this.restartTimerOnMaxSize = restartTimerOnMaxSize;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super Observable<T>> t) {
        SerializedObserver<Observable<T>> actual = new SerializedObserver<>(t);
        if (this.timespan == this.timeskip) {
            if (this.maxSize == Long.MAX_VALUE) {
                this.source.subscribe(new WindowExactUnboundedObserver(actual, this.timespan, this.unit, this.scheduler, this.bufferSize));
                return;
            } else {
                this.source.subscribe(new WindowExactBoundedObserver(actual, this.timespan, this.unit, this.scheduler, this.bufferSize, this.maxSize, this.restartTimerOnMaxSize));
                return;
            }
        }
        this.source.subscribe(new WindowSkipObserver(actual, this.timespan, this.timeskip, this.unit, this.scheduler.createWorker(), this.bufferSize));
    }

    /* loaded from: classes3.dex */
    static final class WindowExactUnboundedObserver<T> extends QueueDrainObserver<T, Object, Observable<T>> implements Observer<T>, Disposable, Runnable {
        static final Object NEXT = new Object();
        final int bufferSize;
        Disposable s;
        final Scheduler scheduler;
        volatile boolean terminated;
        final AtomicReference<Disposable> timer;
        final long timespan;
        final TimeUnit unit;
        UnicastSubject<T> window;

        WindowExactUnboundedObserver(Observer<? super Observable<T>> actual, long timespan, TimeUnit unit, Scheduler scheduler, int bufferSize) {
            super(actual, new MpscLinkedQueue());
            this.timer = new AtomicReference<>();
            this.timespan = timespan;
            this.unit = unit;
            this.scheduler = scheduler;
            this.bufferSize = bufferSize;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.window = UnicastSubject.create(this.bufferSize);
                Observer<? super V> observer = this.actual;
                observer.onSubscribe(this);
                observer.onNext(this.window);
                if (!this.cancelled) {
                    Disposable d = this.scheduler.schedulePeriodicallyDirect(this, this.timespan, this.timespan, this.unit);
                    DisposableHelper.replace(this.timer, d);
                }
            }
        }

        @Override // io.reactivex.Observer
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

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.error = t;
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            disposeTimer();
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            disposeTimer();
            this.actual.onComplete();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.cancelled = true;
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        void disposeTimer() {
            DisposableHelper.dispose(this.timer);
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.cancelled) {
                this.terminated = true;
                disposeTimer();
            }
            this.queue.offer(NEXT);
            if (enter()) {
                drainLoop();
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:10:0x0026, code lost:
            r7 = r7;
            r7.onError(r2);
         */
        /* JADX WARN: Code restructure failed: missing block: B:11:0x0029, code lost:
            return;
         */
        /* JADX WARN: Code restructure failed: missing block: B:12:0x002a, code lost:
            r7 = r7;
            r7.onComplete();
         */
        /* JADX WARN: Code restructure failed: missing block: B:38:?, code lost:
            return;
         */
        /* JADX WARN: Code restructure failed: missing block: B:8:0x0019, code lost:
            r9.window = null;
            r5.clear();
            disposeTimer();
            r2 = r9.error;
         */
        /* JADX WARN: Code restructure failed: missing block: B:9:0x0024, code lost:
            if (r2 == null) goto L13;
         */
        /* JADX WARN: Multi-variable type inference failed */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        void drainLoop() {
            /*
                r9 = this;
                io.reactivex.internal.fuseable.SimplePlainQueue<U> r5 = r9.queue
                io.reactivex.internal.queue.MpscLinkedQueue r5 = (io.reactivex.internal.queue.MpscLinkedQueue) r5
                io.reactivex.Observer<? super V> r0 = r9.actual
                io.reactivex.subjects.UnicastSubject<T> r7 = r9.window
                r3 = 1
            L9:
                boolean r6 = r9.terminated
                boolean r1 = r9.done
                java.lang.Object r4 = r5.mo1188poll()
                if (r1 == 0) goto L2e
                if (r4 == 0) goto L19
                java.lang.Object r8 = io.reactivex.internal.operators.observable.ObservableWindowTimed.WindowExactUnboundedObserver.NEXT
                if (r4 != r8) goto L2e
            L19:
                r8 = 0
                r9.window = r8
                r5.clear()
                r9.disposeTimer()
                java.lang.Throwable r2 = r9.error
                if (r2 == 0) goto L2a
                r7.onError(r2)
            L29:
                return
            L2a:
                r7.onComplete()
                goto L29
            L2e:
                if (r4 != 0) goto L38
                int r8 = -r3
                int r3 = r9.leave(r8)
                if (r3 != 0) goto L9
                goto L29
            L38:
                java.lang.Object r8 = io.reactivex.internal.operators.observable.ObservableWindowTimed.WindowExactUnboundedObserver.NEXT
                if (r4 != r8) goto L53
                r7.onComplete()
                if (r6 != 0) goto L4d
                int r8 = r9.bufferSize
                io.reactivex.subjects.UnicastSubject r7 = io.reactivex.subjects.UnicastSubject.create(r8)
                r9.window = r7
                r0.onNext(r7)
                goto L9
            L4d:
                io.reactivex.disposables.Disposable r8 = r9.s
                r8.dispose()
                goto L9
            L53:
                java.lang.Object r8 = io.reactivex.internal.util.NotificationLite.getValue(r4)
                r7.onNext(r8)
                goto L9
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.observable.ObservableWindowTimed.WindowExactUnboundedObserver.drainLoop():void");
        }
    }

    /* loaded from: classes3.dex */
    static final class WindowExactBoundedObserver<T> extends QueueDrainObserver<T, Object, Observable<T>> implements Disposable {
        final int bufferSize;
        long count;
        final long maxSize;
        long producerIndex;
        final boolean restartTimerOnMaxSize;
        Disposable s;
        final Scheduler scheduler;
        volatile boolean terminated;
        final AtomicReference<Disposable> timer;
        final long timespan;
        final TimeUnit unit;
        UnicastSubject<T> window;
        final Scheduler.Worker worker;

        WindowExactBoundedObserver(Observer<? super Observable<T>> actual, long timespan, TimeUnit unit, Scheduler scheduler, int bufferSize, long maxSize, boolean restartTimerOnMaxSize) {
            super(actual, new MpscLinkedQueue());
            this.timer = new AtomicReference<>();
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

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            Disposable d;
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                Observer<? super V> observer = this.actual;
                observer.onSubscribe(this);
                if (!this.cancelled) {
                    UnicastSubject<T> w = UnicastSubject.create(this.bufferSize);
                    this.window = w;
                    observer.onNext(w);
                    ConsumerIndexHolder consumerIndexHolder = new ConsumerIndexHolder(this.producerIndex, this);
                    if (this.restartTimerOnMaxSize) {
                        d = this.worker.schedulePeriodically(consumerIndexHolder, this.timespan, this.timespan, this.unit);
                    } else {
                        d = this.scheduler.schedulePeriodicallyDirect(consumerIndexHolder, this.timespan, this.timespan, this.unit);
                    }
                    DisposableHelper.replace(this.timer, d);
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (!this.terminated) {
                if (fastEnter()) {
                    UnicastSubject<T> w = this.window;
                    w.onNext(t);
                    long c = this.count + 1;
                    if (c >= this.maxSize) {
                        this.producerIndex++;
                        this.count = 0L;
                        w.onComplete();
                        UnicastSubject<T> w2 = UnicastSubject.create(this.bufferSize);
                        this.window = w2;
                        this.actual.onNext(w2);
                        if (this.restartTimerOnMaxSize) {
                            Disposable tm = this.timer.get();
                            tm.dispose();
                            Disposable task = this.worker.schedulePeriodically(new ConsumerIndexHolder(this.producerIndex, this), this.timespan, this.timespan, this.unit);
                            DisposableHelper.replace(this.timer, task);
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

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.error = t;
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onError(t);
            disposeTimer();
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onComplete();
            disposeTimer();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.cancelled = true;
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        void disposeTimer() {
            DisposableHelper.dispose(this.timer);
            Scheduler.Worker w = this.worker;
            if (w != null) {
                w.dispose();
            }
        }

        void drainLoop() {
            MpscLinkedQueue<Object> q = (MpscLinkedQueue) this.queue;
            Observer<? super V> observer = this.actual;
            UnicastSubject<T> w = this.window;
            int missed = 1;
            while (!this.terminated) {
                boolean d = this.done;
                Object o = q.mo1188poll();
                boolean empty = o == null;
                boolean isHolder = o instanceof ConsumerIndexHolder;
                if (d && (empty || isHolder)) {
                    this.window = null;
                    q.clear();
                    disposeTimer();
                    Throwable err = this.error;
                    if (err != null) {
                        w.onError(err);
                        return;
                    } else {
                        w.onComplete();
                        return;
                    }
                } else if (!empty) {
                    if (isHolder) {
                        ConsumerIndexHolder consumerIndexHolder = (ConsumerIndexHolder) o;
                        if (this.restartTimerOnMaxSize || this.producerIndex == consumerIndexHolder.index) {
                            w.onComplete();
                            this.count = 0L;
                            w = UnicastSubject.create(this.bufferSize);
                            this.window = w;
                            observer.onNext(w);
                        }
                    } else {
                        w.onNext((T) NotificationLite.getValue(o));
                        long c = this.count + 1;
                        if (c >= this.maxSize) {
                            this.producerIndex++;
                            this.count = 0L;
                            w.onComplete();
                            w = UnicastSubject.create(this.bufferSize);
                            this.window = w;
                            this.actual.onNext(w);
                            if (this.restartTimerOnMaxSize) {
                                Disposable tm = this.timer.get();
                                tm.dispose();
                                Disposable task = this.worker.schedulePeriodically(new ConsumerIndexHolder(this.producerIndex, this), this.timespan, this.timespan, this.unit);
                                if (!this.timer.compareAndSet(tm, task)) {
                                    task.dispose();
                                }
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
            this.s.dispose();
            q.clear();
            disposeTimer();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public static final class ConsumerIndexHolder implements Runnable {
            final long index;
            final WindowExactBoundedObserver<?> parent;

            ConsumerIndexHolder(long index, WindowExactBoundedObserver<?> parent) {
                this.index = index;
                this.parent = parent;
            }

            @Override // java.lang.Runnable
            public void run() {
                WindowExactBoundedObserver<?> p = this.parent;
                if (!((WindowExactBoundedObserver) p).cancelled) {
                    ((WindowExactBoundedObserver) p).queue.offer(this);
                } else {
                    p.terminated = true;
                    p.disposeTimer();
                }
                if (p.enter()) {
                    p.drainLoop();
                }
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class WindowSkipObserver<T> extends QueueDrainObserver<T, Object, Observable<T>> implements Disposable, Runnable {
        final int bufferSize;
        Disposable s;
        volatile boolean terminated;
        final long timeskip;
        final long timespan;
        final TimeUnit unit;
        final List<UnicastSubject<T>> windows;
        final Scheduler.Worker worker;

        WindowSkipObserver(Observer<? super Observable<T>> actual, long timespan, long timeskip, TimeUnit unit, Scheduler.Worker worker, int bufferSize) {
            super(actual, new MpscLinkedQueue());
            this.timespan = timespan;
            this.timeskip = timeskip;
            this.unit = unit;
            this.worker = worker;
            this.bufferSize = bufferSize;
            this.windows = new LinkedList();
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
                if (!this.cancelled) {
                    UnicastSubject<T> w = UnicastSubject.create(this.bufferSize);
                    this.windows.add(w);
                    this.actual.onNext(w);
                    this.worker.schedule(new CompletionTask(w), this.timespan, this.unit);
                    this.worker.schedulePeriodically(this, this.timeskip, this.timeskip, this.unit);
                }
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (fastEnter()) {
                for (UnicastSubject<T> w : this.windows) {
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

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.error = t;
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onError(t);
            disposeWorker();
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onComplete();
            disposeWorker();
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.cancelled = true;
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        void disposeWorker() {
            this.worker.dispose();
        }

        void complete(UnicastSubject<T> w) {
            this.queue.offer(new SubjectWork(w, false));
            if (enter()) {
                drainLoop();
            }
        }

        void drainLoop() {
            MpscLinkedQueue<Object> q = (MpscLinkedQueue) this.queue;
            Observer<? super V> observer = this.actual;
            List<UnicastSubject<T>> ws = this.windows;
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
                        for (UnicastSubject<T> w : ws) {
                            w.onError(e);
                        }
                    } else {
                        for (UnicastSubject<T> w2 : ws) {
                            w2.onComplete();
                        }
                    }
                    disposeWorker();
                    ws.clear();
                    return;
                } else if (!empty) {
                    if (sw) {
                        SubjectWork<T> work = (SubjectWork) t;
                        if (work.open) {
                            if (!this.cancelled) {
                                UnicastSubject<T> w3 = UnicastSubject.create(this.bufferSize);
                                ws.add(w3);
                                observer.onNext(w3);
                                this.worker.schedule(new CompletionTask(w3), this.timespan, this.unit);
                            }
                        } else {
                            ws.remove(work.w);
                            work.w.onComplete();
                            if (ws.isEmpty() && this.cancelled) {
                                this.terminated = true;
                            }
                        }
                    } else {
                        for (UnicastSubject<T> w4 : ws) {
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
            this.s.dispose();
            disposeWorker();
            q.clear();
            ws.clear();
        }

        @Override // java.lang.Runnable
        public void run() {
            UnicastSubject<T> w = UnicastSubject.create(this.bufferSize);
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
            final UnicastSubject<T> w;

            SubjectWork(UnicastSubject<T> w, boolean open) {
                this.w = w;
                this.open = open;
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public final class CompletionTask implements Runnable {
            private final UnicastSubject<T> w;

            CompletionTask(UnicastSubject<T> w) {
                this.w = w;
            }

            @Override // java.lang.Runnable
            public void run() {
                WindowSkipObserver.this.complete(this.w);
            }
        }
    }
}
