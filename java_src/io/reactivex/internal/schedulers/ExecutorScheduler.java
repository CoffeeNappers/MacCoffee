package io.reactivex.internal.schedulers;

import io.reactivex.Scheduler;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.disposables.SequentialDisposable;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.plugins.RxJavaPlugins;
import io.reactivex.schedulers.Schedulers;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class ExecutorScheduler extends Scheduler {
    static final Scheduler HELPER = Schedulers.single();
    @NonNull
    final Executor executor;

    public ExecutorScheduler(@NonNull Executor executor) {
        this.executor = executor;
    }

    @Override // io.reactivex.Scheduler
    @NonNull
    public Scheduler.Worker createWorker() {
        return new ExecutorWorker(this.executor);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v3, types: [java.util.concurrent.Callable, io.reactivex.internal.schedulers.ScheduledDirectTask] */
    @Override // io.reactivex.Scheduler
    @NonNull
    public Disposable scheduleDirect(@NonNull Runnable run) {
        ExecutorWorker.BooleanRunnable booleanRunnable;
        Runnable decoratedRun = RxJavaPlugins.onSchedule(run);
        try {
            if (this.executor instanceof ExecutorService) {
                ?? scheduledDirectTask = new ScheduledDirectTask(decoratedRun);
                Future<?> f = ((ExecutorService) this.executor).submit((Callable) scheduledDirectTask);
                scheduledDirectTask.setFuture(f);
                booleanRunnable = scheduledDirectTask;
            } else {
                ExecutorWorker.BooleanRunnable br = new ExecutorWorker.BooleanRunnable(decoratedRun);
                this.executor.execute(br);
                booleanRunnable = br;
            }
            return booleanRunnable;
        } catch (RejectedExecutionException ex) {
            RxJavaPlugins.onError(ex);
            return EmptyDisposable.INSTANCE;
        }
    }

    @Override // io.reactivex.Scheduler
    @NonNull
    public Disposable scheduleDirect(@NonNull Runnable run, long delay, TimeUnit unit) {
        Runnable decoratedRun = RxJavaPlugins.onSchedule(run);
        if (this.executor instanceof ScheduledExecutorService) {
            try {
                ScheduledDirectTask task = new ScheduledDirectTask(decoratedRun);
                Future<?> f = ((ScheduledExecutorService) this.executor).schedule(task, delay, unit);
                task.setFuture(f);
                return task;
            } catch (RejectedExecutionException ex) {
                RxJavaPlugins.onError(ex);
                return EmptyDisposable.INSTANCE;
            }
        }
        DelayedRunnable dr = new DelayedRunnable(decoratedRun);
        Disposable delayed = HELPER.scheduleDirect(new DelayedDispose(dr), delay, unit);
        dr.timed.replace(delayed);
        return dr;
    }

    @Override // io.reactivex.Scheduler
    @NonNull
    public Disposable schedulePeriodicallyDirect(@NonNull Runnable run, long initialDelay, long period, TimeUnit unit) {
        if (this.executor instanceof ScheduledExecutorService) {
            Runnable decoratedRun = RxJavaPlugins.onSchedule(run);
            try {
                ScheduledDirectPeriodicTask task = new ScheduledDirectPeriodicTask(decoratedRun);
                Future<?> f = ((ScheduledExecutorService) this.executor).scheduleAtFixedRate(task, initialDelay, period, unit);
                task.setFuture(f);
                return task;
            } catch (RejectedExecutionException ex) {
                RxJavaPlugins.onError(ex);
                return EmptyDisposable.INSTANCE;
            }
        }
        return super.schedulePeriodicallyDirect(run, initialDelay, period, unit);
    }

    /* loaded from: classes3.dex */
    public static final class ExecutorWorker extends Scheduler.Worker implements Runnable {
        volatile boolean disposed;
        final Executor executor;
        final AtomicInteger wip = new AtomicInteger();
        final CompositeDisposable tasks = new CompositeDisposable();
        final MpscLinkedQueue<Runnable> queue = new MpscLinkedQueue<>();

        public ExecutorWorker(Executor executor) {
            this.executor = executor;
        }

        @Override // io.reactivex.Scheduler.Worker
        @NonNull
        public Disposable schedule(@NonNull Runnable run) {
            if (this.disposed) {
                return EmptyDisposable.INSTANCE;
            }
            Runnable decoratedRun = RxJavaPlugins.onSchedule(run);
            BooleanRunnable br = new BooleanRunnable(decoratedRun);
            this.queue.offer(br);
            if (this.wip.getAndIncrement() == 0) {
                try {
                    this.executor.execute(this);
                    return br;
                } catch (RejectedExecutionException ex) {
                    this.disposed = true;
                    this.queue.clear();
                    RxJavaPlugins.onError(ex);
                    return EmptyDisposable.INSTANCE;
                }
            }
            return br;
        }

        @Override // io.reactivex.Scheduler.Worker
        @NonNull
        public Disposable schedule(@NonNull Runnable run, long delay, @NonNull TimeUnit unit) {
            if (delay <= 0) {
                return schedule(run);
            }
            if (this.disposed) {
                return EmptyDisposable.INSTANCE;
            }
            SequentialDisposable first = new SequentialDisposable();
            SequentialDisposable mar = new SequentialDisposable(first);
            Runnable decoratedRun = RxJavaPlugins.onSchedule(run);
            ScheduledRunnable sr = new ScheduledRunnable(new SequentialDispose(mar, decoratedRun), this.tasks);
            this.tasks.add(sr);
            if (this.executor instanceof ScheduledExecutorService) {
                try {
                    Future<?> f = ((ScheduledExecutorService) this.executor).schedule((Callable) sr, delay, unit);
                    sr.setFuture(f);
                } catch (RejectedExecutionException ex) {
                    this.disposed = true;
                    RxJavaPlugins.onError(ex);
                    return EmptyDisposable.INSTANCE;
                }
            } else {
                Disposable d = ExecutorScheduler.HELPER.scheduleDirect(sr, delay, unit);
                sr.setFuture(new DisposeOnCancel(d));
            }
            first.replace(sr);
            return mar;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (!this.disposed) {
                this.disposed = true;
                this.tasks.dispose();
                if (this.wip.getAndIncrement() == 0) {
                    this.queue.clear();
                }
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.disposed;
        }

        /* JADX WARN: Code restructure failed: missing block: B:10:0x0015, code lost:
            if (r5.disposed == false) goto L15;
         */
        /* JADX WARN: Code restructure failed: missing block: B:11:0x0017, code lost:
            r1.clear();
         */
        /* JADX WARN: Code restructure failed: missing block: B:15:0x0026, code lost:
            r0 = r5.wip.addAndGet(-r0);
         */
        /* JADX WARN: Code restructure failed: missing block: B:16:0x002d, code lost:
            if (r0 != 0) goto L2;
         */
        /* JADX WARN: Code restructure failed: missing block: B:23:?, code lost:
            return;
         */
        /* JADX WARN: Code restructure failed: missing block: B:25:?, code lost:
            return;
         */
        @Override // java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void run() {
            /*
                r5 = this;
                r0 = 1
                io.reactivex.internal.queue.MpscLinkedQueue<java.lang.Runnable> r1 = r5.queue
            L3:
                boolean r3 = r5.disposed
                if (r3 == 0) goto Lb
                r1.clear()
            La:
                return
            Lb:
                java.lang.Object r2 = r1.mo1188poll()
                java.lang.Runnable r2 = (java.lang.Runnable) r2
                if (r2 != 0) goto L1b
                boolean r3 = r5.disposed
                if (r3 == 0) goto L26
                r1.clear()
                goto La
            L1b:
                r2.run()
                boolean r3 = r5.disposed
                if (r3 == 0) goto Lb
                r1.clear()
                goto La
            L26:
                java.util.concurrent.atomic.AtomicInteger r3 = r5.wip
                int r4 = -r0
                int r0 = r3.addAndGet(r4)
                if (r0 != 0) goto L3
                goto La
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.schedulers.ExecutorScheduler.ExecutorWorker.run():void");
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public static final class BooleanRunnable extends AtomicBoolean implements Runnable, Disposable {
            private static final long serialVersionUID = -2421395018820541164L;
            final Runnable actual;

            BooleanRunnable(Runnable actual) {
                this.actual = actual;
            }

            @Override // java.lang.Runnable
            public void run() {
                if (!get()) {
                    try {
                        this.actual.run();
                    } finally {
                        lazySet(true);
                    }
                }
            }

            @Override // io.reactivex.disposables.Disposable
            public void dispose() {
                lazySet(true);
            }

            @Override // io.reactivex.disposables.Disposable
            public boolean isDisposed() {
                return get();
            }
        }

        /* loaded from: classes3.dex */
        final class SequentialDispose implements Runnable {
            private final Runnable decoratedRun;
            private final SequentialDisposable mar;

            SequentialDispose(SequentialDisposable mar, Runnable decoratedRun) {
                this.mar = mar;
                this.decoratedRun = decoratedRun;
            }

            @Override // java.lang.Runnable
            public void run() {
                this.mar.replace(ExecutorWorker.this.schedule(this.decoratedRun));
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class DelayedRunnable extends AtomicReference<Runnable> implements Runnable, Disposable {
        private static final long serialVersionUID = -4101336210206799084L;
        final SequentialDisposable direct;
        final SequentialDisposable timed;

        DelayedRunnable(Runnable run) {
            super(run);
            this.timed = new SequentialDisposable();
            this.direct = new SequentialDisposable();
        }

        @Override // java.lang.Runnable
        public void run() {
            Runnable r = get();
            if (r != null) {
                try {
                    r.run();
                } finally {
                    lazySet(null);
                    this.timed.lazySet(DisposableHelper.DISPOSED);
                    this.direct.lazySet(DisposableHelper.DISPOSED);
                }
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return get() == null;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (getAndSet(null) != null) {
                this.timed.dispose();
                this.direct.dispose();
            }
        }
    }

    /* loaded from: classes3.dex */
    final class DelayedDispose implements Runnable {
        private final DelayedRunnable dr;

        DelayedDispose(DelayedRunnable dr) {
            this.dr = dr;
        }

        @Override // java.lang.Runnable
        public void run() {
            this.dr.direct.replace(ExecutorScheduler.this.scheduleDirect(this.dr));
        }
    }
}
