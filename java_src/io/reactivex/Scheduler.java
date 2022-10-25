package io.reactivex;

import io.reactivex.annotations.Experimental;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.disposables.SequentialDisposable;
import io.reactivex.internal.schedulers.NewThreadWorker;
import io.reactivex.internal.schedulers.SchedulerWhen;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
public abstract class Scheduler {
    static final long CLOCK_DRIFT_TOLERANCE_NANOSECONDS = TimeUnit.MINUTES.toNanos(Long.getLong("rx2.scheduler.drift-tolerance", 15).longValue());

    @NonNull
    public abstract Worker createWorker();

    public static long clockDriftTolerance() {
        return CLOCK_DRIFT_TOLERANCE_NANOSECONDS;
    }

    public long now(@NonNull TimeUnit unit) {
        return unit.convert(System.currentTimeMillis(), TimeUnit.MILLISECONDS);
    }

    public void start() {
    }

    public void shutdown() {
    }

    @NonNull
    public Disposable scheduleDirect(@NonNull Runnable run) {
        return scheduleDirect(run, 0L, TimeUnit.NANOSECONDS);
    }

    @NonNull
    public Disposable scheduleDirect(@NonNull Runnable run, long delay, @NonNull TimeUnit unit) {
        Worker w = createWorker();
        Runnable decoratedRun = RxJavaPlugins.onSchedule(run);
        DisposeTask task = new DisposeTask(decoratedRun, w);
        w.schedule(task, delay, unit);
        return task;
    }

    @NonNull
    public Disposable schedulePeriodicallyDirect(@NonNull Runnable run, long initialDelay, long period, @NonNull TimeUnit unit) {
        Worker w = createWorker();
        Runnable decoratedRun = RxJavaPlugins.onSchedule(run);
        PeriodicDirectTask periodicTask = new PeriodicDirectTask(decoratedRun, w);
        Disposable d = w.schedulePeriodically(periodicTask, initialDelay, period, unit);
        return d == EmptyDisposable.INSTANCE ? d : periodicTask;
    }

    @Experimental
    @NonNull
    public <S extends Scheduler & Disposable> S when(@NonNull Function<Flowable<Flowable<Completable>>, Completable> combine) {
        return new SchedulerWhen(combine, this);
    }

    /* loaded from: classes3.dex */
    public static abstract class Worker implements Disposable {
        @NonNull
        public abstract Disposable schedule(@NonNull Runnable runnable, long j, @NonNull TimeUnit timeUnit);

        @NonNull
        public Disposable schedule(@NonNull Runnable run) {
            return schedule(run, 0L, TimeUnit.NANOSECONDS);
        }

        @NonNull
        public Disposable schedulePeriodically(@NonNull Runnable run, long initialDelay, long period, @NonNull TimeUnit unit) {
            SequentialDisposable first = new SequentialDisposable();
            SequentialDisposable sd = new SequentialDisposable(first);
            Runnable decoratedRun = RxJavaPlugins.onSchedule(run);
            long periodInNanoseconds = unit.toNanos(period);
            long firstNowNanoseconds = now(TimeUnit.NANOSECONDS);
            long firstStartInNanoseconds = firstNowNanoseconds + unit.toNanos(initialDelay);
            Disposable d = schedule(new PeriodicTask(firstStartInNanoseconds, decoratedRun, firstNowNanoseconds, sd, periodInNanoseconds), initialDelay, unit);
            if (d != EmptyDisposable.INSTANCE) {
                first.replace(d);
                return sd;
            }
            return d;
        }

        public long now(@NonNull TimeUnit unit) {
            return unit.convert(System.currentTimeMillis(), TimeUnit.MILLISECONDS);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public final class PeriodicTask implements Runnable {
            long count;
            @NonNull
            final Runnable decoratedRun;
            long lastNowNanoseconds;
            final long periodInNanoseconds;
            @NonNull
            final SequentialDisposable sd;
            long startInNanoseconds;

            PeriodicTask(long firstStartInNanoseconds, @NonNull Runnable decoratedRun, long firstNowNanoseconds, @NonNull SequentialDisposable sd, long periodInNanoseconds) {
                this.decoratedRun = decoratedRun;
                this.sd = sd;
                this.periodInNanoseconds = periodInNanoseconds;
                this.lastNowNanoseconds = firstNowNanoseconds;
                this.startInNanoseconds = firstStartInNanoseconds;
            }

            @Override // java.lang.Runnable
            public void run() {
                long nextTick;
                this.decoratedRun.run();
                if (!this.sd.isDisposed()) {
                    long nowNanoseconds = Worker.this.now(TimeUnit.NANOSECONDS);
                    if (Scheduler.CLOCK_DRIFT_TOLERANCE_NANOSECONDS + nowNanoseconds < this.lastNowNanoseconds || nowNanoseconds >= this.lastNowNanoseconds + this.periodInNanoseconds + Scheduler.CLOCK_DRIFT_TOLERANCE_NANOSECONDS) {
                        nextTick = nowNanoseconds + this.periodInNanoseconds;
                        long j = this.periodInNanoseconds;
                        long j2 = this.count + 1;
                        this.count = j2;
                        this.startInNanoseconds = nextTick - (j * j2);
                    } else {
                        long j3 = this.startInNanoseconds;
                        long j4 = this.count + 1;
                        this.count = j4;
                        nextTick = j3 + (j4 * this.periodInNanoseconds);
                    }
                    this.lastNowNanoseconds = nowNanoseconds;
                    long delay = nextTick - nowNanoseconds;
                    this.sd.replace(Worker.this.schedule(this, delay, TimeUnit.NANOSECONDS));
                }
            }
        }
    }

    /* loaded from: classes3.dex */
    static class PeriodicDirectTask implements Runnable, Disposable {
        @NonNull
        volatile boolean disposed;
        final Runnable run;
        @NonNull
        final Worker worker;

        PeriodicDirectTask(@NonNull Runnable run, @NonNull Worker worker) {
            this.run = run;
            this.worker = worker;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (!this.disposed) {
                try {
                    this.run.run();
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    this.worker.dispose();
                    throw ExceptionHelper.wrapOrThrow(ex);
                }
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.disposed = true;
            this.worker.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.disposed;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class DisposeTask implements Runnable, Disposable {
        final Runnable decoratedRun;
        Thread runner;
        final Worker w;

        DisposeTask(Runnable decoratedRun, Worker w) {
            this.decoratedRun = decoratedRun;
            this.w = w;
        }

        @Override // java.lang.Runnable
        public void run() {
            this.runner = Thread.currentThread();
            try {
                this.decoratedRun.run();
            } finally {
                dispose();
                this.runner = null;
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (this.runner == Thread.currentThread() && (this.w instanceof NewThreadWorker)) {
                ((NewThreadWorker) this.w).shutdown();
            } else {
                this.w.dispose();
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.w.isDisposed();
        }
    }
}
