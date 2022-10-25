package com.google.android.gms.analytics;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Process;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import com.google.android.gms.analytics.internal.zzao;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzms;
import com.google.android.gms.internal.zzmx;
import java.lang.Thread;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Callable;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RunnableFuture;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes2.dex */
public final class zzi {
    private static volatile zzi bj;
    private final List<zzj> bk;
    private final zzd bl;
    private final zza bm;
    private volatile zzms bn;
    private Thread.UncaughtExceptionHandler bo;
    private final Context mContext;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zza extends ThreadPoolExecutor {
        public zza() {
            super(1, 1, 1L, TimeUnit.MINUTES, new LinkedBlockingQueue());
            setThreadFactory(new zzb());
            allowCoreThreadTimeOut(true);
        }

        @Override // java.util.concurrent.AbstractExecutorService
        protected <T> RunnableFuture<T> newTaskFor(Runnable runnable, T t) {
            return new FutureTask<T>(runnable, t) { // from class: com.google.android.gms.analytics.zzi.zza.1
                @Override // java.util.concurrent.FutureTask
                protected void setException(Throwable th) {
                    Thread.UncaughtExceptionHandler uncaughtExceptionHandler = zzi.this.bo;
                    if (uncaughtExceptionHandler != null) {
                        uncaughtExceptionHandler.uncaughtException(Thread.currentThread(), th);
                    } else if (Log.isLoggable("GAv4", 6)) {
                        String valueOf = String.valueOf(th);
                        Log.e("GAv4", new StringBuilder(String.valueOf(valueOf).length() + 37).append("MeasurementExecutor: job failed with ").append(valueOf).toString());
                    }
                    super.setException(th);
                }
            };
        }
    }

    /* loaded from: classes2.dex */
    private static class zzb implements ThreadFactory {
        private static final AtomicInteger bs = new AtomicInteger();

        private zzb() {
        }

        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(Runnable runnable) {
            return new zzc(runnable, new StringBuilder(23).append("measurement-").append(bs.incrementAndGet()).toString());
        }
    }

    /* loaded from: classes2.dex */
    private static class zzc extends Thread {
        zzc(Runnable runnable, String str) {
            super(runnable, str);
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            Process.setThreadPriority(10);
            super.run();
        }
    }

    zzi(Context context) {
        Context applicationContext = context.getApplicationContext();
        zzaa.zzy(applicationContext);
        this.mContext = applicationContext;
        this.bm = new zza();
        this.bk = new CopyOnWriteArrayList();
        this.bl = new zzd();
    }

    public static zzi zzav(Context context) {
        zzaa.zzy(context);
        if (bj == null) {
            synchronized (zzi.class) {
                if (bj == null) {
                    bj = new zzi(context);
                }
            }
        }
        return bj;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzb(zze zzeVar) {
        zzaa.zzht("deliver should be called from worker thread");
        zzaa.zzb(zzeVar.zzzn(), "Measurement must be submitted");
        List<zzk> zzzk = zzeVar.zzzk();
        if (zzzk.isEmpty()) {
            return;
        }
        HashSet hashSet = new HashSet();
        for (zzk zzkVar : zzzk) {
            Uri zzyx = zzkVar.zzyx();
            if (!hashSet.contains(zzyx)) {
                hashSet.add(zzyx);
                zzkVar.zzb(zzeVar);
            }
        }
    }

    public static void zzzx() {
        if (!(Thread.currentThread() instanceof zzc)) {
            throw new IllegalStateException("Call expected from worker thread");
        }
    }

    public Context getContext() {
        return this.mContext;
    }

    public void zza(Thread.UncaughtExceptionHandler uncaughtExceptionHandler) {
        this.bo = uncaughtExceptionHandler;
    }

    public <V> Future<V> zzc(Callable<V> callable) {
        zzaa.zzy(callable);
        if (Thread.currentThread() instanceof zzc) {
            FutureTask futureTask = new FutureTask(callable);
            futureTask.run();
            return futureTask;
        }
        return this.bm.submit(callable);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zze(zze zzeVar) {
        if (zzeVar.zzzr()) {
            throw new IllegalStateException("Measurement prototype can't be submitted");
        }
        if (zzeVar.zzzn()) {
            throw new IllegalStateException("Measurement can only be submitted once");
        }
        final zze zzzi = zzeVar.zzzi();
        zzzi.zzzo();
        this.bm.execute(new Runnable() { // from class: com.google.android.gms.analytics.zzi.1
            @Override // java.lang.Runnable
            public void run() {
                zzzi.zzzp().zza(zzzi);
                for (zzj zzjVar : zzi.this.bk) {
                    zzjVar.zza(zzzi);
                }
                zzi.this.zzb(zzzi);
            }
        });
    }

    public void zzg(Runnable runnable) {
        zzaa.zzy(runnable);
        this.bm.submit(runnable);
    }

    public zzms zzzv() {
        if (this.bn == null) {
            synchronized (this) {
                if (this.bn == null) {
                    zzms zzmsVar = new zzms();
                    PackageManager packageManager = this.mContext.getPackageManager();
                    String packageName = this.mContext.getPackageName();
                    zzmsVar.setAppId(packageName);
                    zzmsVar.setAppInstallerId(packageManager.getInstallerPackageName(packageName));
                    String str = null;
                    try {
                        PackageInfo packageInfo = packageManager.getPackageInfo(this.mContext.getPackageName(), 0);
                        if (packageInfo != null) {
                            CharSequence applicationLabel = packageManager.getApplicationLabel(packageInfo.applicationInfo);
                            if (!TextUtils.isEmpty(applicationLabel)) {
                                packageName = applicationLabel.toString();
                            }
                            str = packageInfo.versionName;
                        }
                    } catch (PackageManager.NameNotFoundException e) {
                        String valueOf = String.valueOf(packageName);
                        Log.e("GAv4", valueOf.length() != 0 ? "Error retrieving package info: appName set to ".concat(valueOf) : new String("Error retrieving package info: appName set to "));
                    }
                    zzmsVar.setAppName(packageName);
                    zzmsVar.setAppVersion(str);
                    this.bn = zzmsVar;
                }
            }
        }
        return this.bn;
    }

    public zzmx zzzw() {
        DisplayMetrics displayMetrics = this.mContext.getResources().getDisplayMetrics();
        zzmx zzmxVar = new zzmx();
        zzmxVar.setLanguage(zzao.zza(Locale.getDefault()));
        zzmxVar.zzbz(displayMetrics.widthPixels);
        zzmxVar.zzca(displayMetrics.heightPixels);
        return zzmxVar;
    }
}
