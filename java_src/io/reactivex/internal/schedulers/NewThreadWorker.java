package io.reactivex.internal.schedulers;

import io.reactivex.Scheduler;
import io.reactivex.annotations.NonNull;
import io.reactivex.annotations.Nullable;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableContainer;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
public class NewThreadWorker extends Scheduler.Worker implements Disposable {
    volatile boolean disposed;
    private final ScheduledExecutorService executor;

    public NewThreadWorker(ThreadFactory threadFactory) {
        this.executor = SchedulerPoolFactory.create(threadFactory);
    }

    @Override // io.reactivex.Scheduler.Worker
    @NonNull
    public Disposable schedule(@NonNull Runnable run) {
        return schedule(run, 0L, null);
    }

    @Override // io.reactivex.Scheduler.Worker
    @NonNull
    public Disposable schedule(@NonNull Runnable action, long delayTime, @NonNull TimeUnit unit) {
        return this.disposed ? EmptyDisposable.INSTANCE : scheduleActual(action, delayTime, unit, null);
    }

    public Disposable scheduleDirect(Runnable run, long delayTime, TimeUnit unit) {
        Future<?> f;
        ScheduledDirectTask task = new ScheduledDirectTask(RxJavaPlugins.onSchedule(run));
        try {
            if (delayTime <= 0) {
                f = this.executor.submit(task);
            } else {
                f = this.executor.schedule(task, delayTime, unit);
            }
            task.setFuture(f);
            return task;
        } catch (RejectedExecutionException ex) {
            RxJavaPlugins.onError(ex);
            return EmptyDisposable.INSTANCE;
        }
    }

    public Disposable schedulePeriodicallyDirect(Runnable run, long initialDelay, long period, TimeUnit unit) {
        ScheduledDirectPeriodicTask task = new ScheduledDirectPeriodicTask(RxJavaPlugins.onSchedule(run));
        try {
            Future<?> f = this.executor.scheduleAtFixedRate(task, initialDelay, period, unit);
            task.setFuture(f);
            return task;
        } catch (RejectedExecutionException ex) {
            RxJavaPlugins.onError(ex);
            return EmptyDisposable.INSTANCE;
        }
    }

    @NonNull
    public ScheduledRunnable scheduleActual(Runnable run, long delayTime, @NonNull TimeUnit unit, @Nullable DisposableContainer parent) {
        Future<?> f;
        Runnable decoratedRun = RxJavaPlugins.onSchedule(run);
        ScheduledRunnable sr = new ScheduledRunnable(decoratedRun, parent);
        if (parent == null || parent.add(sr)) {
            try {
                if (delayTime <= 0) {
                    f = this.executor.submit((Callable) sr);
                } else {
                    f = this.executor.schedule((Callable) sr, delayTime, unit);
                }
                sr.setFuture(f);
            } catch (RejectedExecutionException ex) {
                if (parent != null) {
                    parent.remove(sr);
                }
                RxJavaPlugins.onError(ex);
            }
        }
        return sr;
    }

    @Override // io.reactivex.disposables.Disposable
    public void dispose() {
        if (!this.disposed) {
            this.disposed = true;
            this.executor.shutdownNow();
        }
    }

    public void shutdown() {
        if (!this.disposed) {
            this.disposed = true;
            this.executor.shutdown();
        }
    }

    @Override // io.reactivex.disposables.Disposable
    public boolean isDisposed() {
        return this.disposed;
    }
}
