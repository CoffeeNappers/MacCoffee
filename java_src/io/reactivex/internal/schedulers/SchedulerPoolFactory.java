package io.reactivex.internal.schedulers;

import io.reactivex.plugins.RxJavaPlugins;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class SchedulerPoolFactory {
    public static final boolean PURGE_ENABLED;
    static final String PURGE_ENABLED_KEY = "rx2.purge-enabled";
    public static final int PURGE_PERIOD_SECONDS;
    static final String PURGE_PERIOD_SECONDS_KEY = "rx2.purge-period-seconds";
    static final AtomicReference<ScheduledExecutorService> PURGE_THREAD = new AtomicReference<>();
    static final Map<ScheduledThreadPoolExecutor, Object> POOLS = new ConcurrentHashMap();

    private SchedulerPoolFactory() {
        throw new IllegalStateException("No instances!");
    }

    static {
        boolean purgeEnable = true;
        int purgePeriod = 1;
        Properties properties = System.getProperties();
        if (properties.containsKey(PURGE_ENABLED_KEY) && (purgeEnable = Boolean.getBoolean(PURGE_ENABLED_KEY)) && properties.containsKey(PURGE_PERIOD_SECONDS_KEY)) {
            purgePeriod = Integer.getInteger(PURGE_PERIOD_SECONDS_KEY, 1).intValue();
        }
        PURGE_ENABLED = purgeEnable;
        PURGE_PERIOD_SECONDS = purgePeriod;
        start();
    }

    public static void start() {
        while (true) {
            ScheduledExecutorService curr = PURGE_THREAD.get();
            if (curr == null || curr.isShutdown()) {
                ScheduledExecutorService next = Executors.newScheduledThreadPool(1, new RxThreadFactory("RxSchedulerPurge"));
                if (PURGE_THREAD.compareAndSet(curr, next)) {
                    next.scheduleAtFixedRate(new ScheduledTask(), PURGE_PERIOD_SECONDS, PURGE_PERIOD_SECONDS, TimeUnit.SECONDS);
                    return;
                }
                next.shutdownNow();
            } else {
                return;
            }
        }
    }

    public static void shutdown() {
        PURGE_THREAD.get().shutdownNow();
        POOLS.clear();
    }

    public static ScheduledExecutorService create(ThreadFactory factory) {
        ScheduledExecutorService exec = Executors.newScheduledThreadPool(1, factory);
        if (exec instanceof ScheduledThreadPoolExecutor) {
            ScheduledThreadPoolExecutor e = (ScheduledThreadPoolExecutor) exec;
            POOLS.put(e, exec);
        }
        return exec;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ScheduledTask implements Runnable {
        ScheduledTask() {
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                Iterator i$ = new ArrayList(SchedulerPoolFactory.POOLS.keySet()).iterator();
                while (i$.hasNext()) {
                    ScheduledThreadPoolExecutor e = (ScheduledThreadPoolExecutor) i$.next();
                    if (e.isShutdown()) {
                        SchedulerPoolFactory.POOLS.remove(e);
                    } else {
                        e.purge();
                    }
                }
            } catch (Throwable e2) {
                RxJavaPlugins.onError(e2);
            }
        }
    }
}
