package bolts;

import android.annotation.SuppressLint;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
final class AndroidExecutors {
    static final long KEEP_ALIVE_TIME = 1;
    private final Executor uiThread = new UIThreadExecutor();
    private static final AndroidExecutors INSTANCE = new AndroidExecutors();
    private static final int CPU_COUNT = Runtime.getRuntime().availableProcessors();
    static final int CORE_POOL_SIZE = CPU_COUNT + 1;
    static final int MAX_POOL_SIZE = (CPU_COUNT * 2) + 1;

    private AndroidExecutors() {
    }

    public static ExecutorService newCachedThreadPool() {
        ThreadPoolExecutor executor = new ThreadPoolExecutor(CORE_POOL_SIZE, MAX_POOL_SIZE, 1L, TimeUnit.SECONDS, new LinkedBlockingQueue());
        allowCoreThreadTimeout(executor, true);
        return executor;
    }

    public static ExecutorService newCachedThreadPool(ThreadFactory threadFactory) {
        ThreadPoolExecutor executor = new ThreadPoolExecutor(CORE_POOL_SIZE, MAX_POOL_SIZE, 1L, TimeUnit.SECONDS, new LinkedBlockingQueue(), threadFactory);
        allowCoreThreadTimeout(executor, true);
        return executor;
    }

    @SuppressLint({"NewApi"})
    public static void allowCoreThreadTimeout(ThreadPoolExecutor executor, boolean value) {
        if (Build.VERSION.SDK_INT >= 9) {
            executor.allowCoreThreadTimeOut(value);
        }
    }

    public static Executor uiThread() {
        return INSTANCE.uiThread;
    }

    /* loaded from: classes.dex */
    private static class UIThreadExecutor implements Executor {
        private UIThreadExecutor() {
        }

        @Override // java.util.concurrent.Executor
        public void execute(Runnable command) {
            new Handler(Looper.getMainLooper()).post(command);
        }
    }
}
