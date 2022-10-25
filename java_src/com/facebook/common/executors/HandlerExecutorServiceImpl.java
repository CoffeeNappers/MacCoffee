package com.facebook.common.executors;

import android.os.Handler;
import java.util.List;
import java.util.concurrent.AbstractExecutorService;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.RunnableFuture;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class HandlerExecutorServiceImpl extends AbstractExecutorService implements HandlerExecutorService {
    private final Handler mHandler;

    @Override // java.util.concurrent.AbstractExecutorService
    /* renamed from: newTaskFor  reason: collision with other method in class */
    protected /* bridge */ /* synthetic */ RunnableFuture mo193newTaskFor(Runnable runnable, Object obj) {
        return newTaskFor(runnable, (Runnable) obj);
    }

    @Override // java.util.concurrent.AbstractExecutorService, java.util.concurrent.ExecutorService
    public /* bridge */ /* synthetic */ Future submit(Runnable runnable, @Nullable Object obj) {
        return mo196submit(runnable, (Runnable) obj);
    }

    public HandlerExecutorServiceImpl(Handler handler) {
        this.mHandler = handler;
    }

    @Override // java.util.concurrent.ExecutorService
    public void shutdown() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.concurrent.ExecutorService
    public List<Runnable> shutdownNow() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.concurrent.ExecutorService
    public boolean isShutdown() {
        return false;
    }

    @Override // java.util.concurrent.ExecutorService
    public boolean isTerminated() {
        return false;
    }

    @Override // java.util.concurrent.ExecutorService
    public boolean awaitTermination(long timeout, TimeUnit unit) throws InterruptedException {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.concurrent.Executor
    public void execute(Runnable command) {
        this.mHandler.post(command);
    }

    @Override // java.util.concurrent.AbstractExecutorService
    protected <T> ScheduledFutureImpl<T> newTaskFor(Runnable runnable, T value) {
        return new ScheduledFutureImpl<>(this.mHandler, runnable, value);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // java.util.concurrent.AbstractExecutorService
    /* renamed from: newTaskFor */
    public <T> ScheduledFutureImpl<T> mo194newTaskFor(Callable<T> callable) {
        return new ScheduledFutureImpl<>(this.mHandler, callable);
    }

    @Override // java.util.concurrent.AbstractExecutorService, java.util.concurrent.ExecutorService
    public ScheduledFuture<?> submit(Runnable task) {
        return mo196submit(task, (Runnable) null);
    }

    @Override // java.util.concurrent.AbstractExecutorService, java.util.concurrent.ExecutorService
    /* renamed from: submit  reason: collision with other method in class */
    public <T> ScheduledFuture<T> mo196submit(Runnable task, @Nullable T result) {
        if (task == null) {
            throw new NullPointerException();
        }
        ScheduledFutureImpl<T> future = newTaskFor(task, (Runnable) result);
        execute(future);
        return future;
    }

    @Override // java.util.concurrent.AbstractExecutorService, java.util.concurrent.ExecutorService
    public <T> ScheduledFuture<T> submit(Callable<T> task) {
        if (task == null) {
            throw new NullPointerException();
        }
        ScheduledFutureImpl<T> future = mo194newTaskFor((Callable) task);
        execute(future);
        return future;
    }

    @Override // java.util.concurrent.ScheduledExecutorService
    public ScheduledFuture<?> schedule(Runnable command, long delay, TimeUnit unit) {
        ScheduledFutureImpl<?> future = newTaskFor(command, (Runnable) null);
        this.mHandler.postDelayed(future, unit.toMillis(delay));
        return future;
    }

    @Override // java.util.concurrent.ScheduledExecutorService
    public <V> ScheduledFuture<V> schedule(Callable<V> callable, long delay, TimeUnit unit) {
        ScheduledFutureImpl<V> future = mo194newTaskFor((Callable) callable);
        this.mHandler.postDelayed(future, unit.toMillis(delay));
        return future;
    }

    @Override // java.util.concurrent.ScheduledExecutorService
    public ScheduledFuture<?> scheduleAtFixedRate(Runnable command, long initialDelay, long period, TimeUnit unit) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.concurrent.ScheduledExecutorService
    public ScheduledFuture<?> scheduleWithFixedDelay(Runnable command, long initialDelay, long delay, TimeUnit unit) {
        throw new UnsupportedOperationException();
    }

    @Override // com.facebook.common.executors.HandlerExecutorService
    public void quit() {
        this.mHandler.getLooper().quit();
    }

    @Override // com.facebook.common.executors.HandlerExecutorService
    public boolean isHandlerThread() {
        return Thread.currentThread() == this.mHandler.getLooper().getThread();
    }
}
