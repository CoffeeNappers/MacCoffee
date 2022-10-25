package io.fabric.sdk.android.services.concurrency;

import android.annotation.TargetApi;
import java.util.concurrent.Callable;
import java.util.concurrent.RunnableFuture;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
public class PriorityThreadPoolExecutor extends ThreadPoolExecutor {
    private static final long KEEP_ALIVE = 1;
    private static final int CPU_COUNT = Runtime.getRuntime().availableProcessors();
    private static final int CORE_POOL_SIZE = CPU_COUNT + 1;
    private static final int MAXIMUM_POOL_SIZE = (CPU_COUNT * 2) + 1;

    <T extends Runnable & Dependency & Task & PriorityProvider> PriorityThreadPoolExecutor(int corePoolSize, int maximumPoolSize, long keepAliveTime, TimeUnit unit, DependencyPriorityBlockingQueue<T> workQueue, ThreadFactory factory) {
        super(corePoolSize, maximumPoolSize, keepAliveTime, unit, workQueue, factory);
        prestartAllCoreThreads();
    }

    public static <T extends Runnable & Dependency & Task & PriorityProvider> PriorityThreadPoolExecutor create(int corePoolSize, int maxPoolSize) {
        return new PriorityThreadPoolExecutor(corePoolSize, maxPoolSize, 1L, TimeUnit.SECONDS, new DependencyPriorityBlockingQueue(), new PriorityThreadFactory(10));
    }

    public static PriorityThreadPoolExecutor create(int threadCount) {
        return create(threadCount, threadCount);
    }

    public static PriorityThreadPoolExecutor create() {
        return create(CORE_POOL_SIZE, MAXIMUM_POOL_SIZE);
    }

    @Override // java.util.concurrent.AbstractExecutorService
    protected <T> RunnableFuture<T> newTaskFor(Runnable runnable, T value) {
        return new PriorityFutureTask(runnable, value);
    }

    @Override // java.util.concurrent.AbstractExecutorService
    protected <T> RunnableFuture<T> newTaskFor(Callable<T> callable) {
        return new PriorityFutureTask(callable);
    }

    @Override // java.util.concurrent.ThreadPoolExecutor, java.util.concurrent.Executor
    @TargetApi(9)
    public void execute(Runnable command) {
        if (PriorityTask.isProperDelegate(command)) {
            super.execute(command);
        } else {
            super.execute(newTaskFor(command, null));
        }
    }

    @Override // java.util.concurrent.ThreadPoolExecutor
    protected void afterExecute(Runnable runnable, Throwable throwable) {
        Task task = (Task) runnable;
        task.setFinished(true);
        task.setError(throwable);
        mo1156getQueue().recycleBlockedQueue();
        super.afterExecute(runnable, throwable);
    }

    @Override // java.util.concurrent.ThreadPoolExecutor
    /* renamed from: getQueue */
    public DependencyPriorityBlockingQueue mo1156getQueue() {
        return (DependencyPriorityBlockingQueue) super.getQueue();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes3.dex */
    public static final class PriorityThreadFactory implements ThreadFactory {
        private final int threadPriority;

        public PriorityThreadFactory(int threadPriority) {
            this.threadPriority = threadPriority;
        }

        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(Runnable r) {
            Thread thread = new Thread(r);
            thread.setPriority(this.threadPriority);
            thread.setName("Queue");
            return thread;
        }
    }
}
