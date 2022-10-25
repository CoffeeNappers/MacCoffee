package com.google.android.gms.internal;

import android.os.Process;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
@zzji
/* loaded from: classes.dex */
public final class zzla {
    private static final ThreadPoolExecutor zzcvd = new ThreadPoolExecutor(10, 10, 1, TimeUnit.MINUTES, new LinkedBlockingQueue(), zzcy("Default"));
    private static final ThreadPoolExecutor zzcve = new ThreadPoolExecutor(5, 5, 1, TimeUnit.MINUTES, new LinkedBlockingQueue(), zzcy("Loader"));

    static {
        zzcvd.allowCoreThreadTimeOut(true);
        zzcve.allowCoreThreadTimeOut(true);
    }

    public static zzlt<Void> zza(int i, final Runnable runnable) {
        return i == 1 ? zza(zzcve, new Callable<Void>() { // from class: com.google.android.gms.internal.zzla.1
            @Override // java.util.concurrent.Callable
            /* renamed from: zzdo */
            public Void call() {
                runnable.run();
                return null;
            }
        }) : zza(zzcvd, new Callable<Void>() { // from class: com.google.android.gms.internal.zzla.2
            @Override // java.util.concurrent.Callable
            /* renamed from: zzdo */
            public Void call() {
                runnable.run();
                return null;
            }
        });
    }

    public static zzlt<Void> zza(Runnable runnable) {
        return zza(0, runnable);
    }

    public static <T> zzlt<T> zza(Callable<T> callable) {
        return zza(zzcvd, callable);
    }

    public static <T> zzlt<T> zza(ExecutorService executorService, final Callable<T> callable) {
        final zzlq zzlqVar = new zzlq();
        try {
            final Future<?> submit = executorService.submit(new Runnable() { // from class: com.google.android.gms.internal.zzla.3
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        Process.setThreadPriority(10);
                        zzlq.this.zzh(callable.call());
                    } catch (Exception e) {
                        com.google.android.gms.ads.internal.zzu.zzgq().zza(e, "AdThreadPool.submit");
                        zzlq.this.zze(e);
                    }
                }
            });
            zzlqVar.zzd(new Runnable() { // from class: com.google.android.gms.internal.zzla.4
                @Override // java.lang.Runnable
                public void run() {
                    if (zzlq.this.isCancelled()) {
                        submit.cancel(true);
                    }
                }
            });
        } catch (RejectedExecutionException e) {
            zzkx.zzc("Thread execution is rejected.", e);
            zzlqVar.cancel(true);
        }
        return zzlqVar;
    }

    private static ThreadFactory zzcy(final String str) {
        return new ThreadFactory() { // from class: com.google.android.gms.internal.zzla.5
            private final AtomicInteger zzcvj = new AtomicInteger(1);

            @Override // java.util.concurrent.ThreadFactory
            public Thread newThread(Runnable runnable) {
                String str2 = str;
                return new Thread(runnable, new StringBuilder(String.valueOf(str2).length() + 23).append("AdWorker(").append(str2).append(") #").append(this.zzcvj.getAndIncrement()).toString());
            }
        };
    }
}
