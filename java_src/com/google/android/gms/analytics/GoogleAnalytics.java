package com.google.android.gms.analytics;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.RequiresPermission;
import android.util.Log;
import com.google.android.gms.analytics.internal.zzae;
import com.google.android.gms.analytics.internal.zzam;
import com.google.android.gms.analytics.internal.zzan;
import com.google.android.gms.analytics.internal.zzap;
import com.google.android.gms.analytics.internal.zzy;
import com.google.android.gms.common.internal.zzaa;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes.dex */
public final class GoogleAnalytics extends com.google.android.gms.analytics.zza {
    private static List<Runnable> aH = new ArrayList();
    private Set<zza> aI;
    private boolean aJ;
    private boolean aK;
    private volatile boolean aL;
    private boolean aM;
    private boolean zzaoz;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public interface zza {
        void zzo(Activity activity);

        void zzp(Activity activity);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @TargetApi(14)
    /* loaded from: classes.dex */
    public class zzb implements Application.ActivityLifecycleCallbacks {
        zzb() {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityCreated(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityDestroyed(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityPaused(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityResumed(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStarted(Activity activity) {
            GoogleAnalytics.this.zzm(activity);
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStopped(Activity activity) {
            GoogleAnalytics.this.zzn(activity);
        }
    }

    public GoogleAnalytics(com.google.android.gms.analytics.internal.zzf zzfVar) {
        super(zzfVar);
        this.aI = new HashSet();
    }

    @RequiresPermission(allOf = {"android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE"})
    public static GoogleAnalytics getInstance(Context context) {
        return com.google.android.gms.analytics.internal.zzf.zzaw(context).zzacn();
    }

    public static void zzzd() {
        synchronized (GoogleAnalytics.class) {
            if (aH != null) {
                for (Runnable runnable : aH) {
                    runnable.run();
                }
                aH = null;
            }
        }
    }

    private com.google.android.gms.analytics.internal.zzb zzzg() {
        return zzyt().zzzg();
    }

    private zzap zzzh() {
        return zzyt().zzzh();
    }

    public void dispatchLocalHits() {
        zzzg().zzabs();
    }

    @TargetApi(14)
    public void enableAutoActivityReports(Application application) {
        if (Build.VERSION.SDK_INT < 14 || this.aJ) {
            return;
        }
        application.registerActivityLifecycleCallbacks(new zzb());
        this.aJ = true;
    }

    public boolean getAppOptOut() {
        return this.aL;
    }

    @Deprecated
    public Logger getLogger() {
        return zzae.getLogger();
    }

    public void initialize() {
        zzzc();
        this.zzaoz = true;
    }

    public boolean isDryRunEnabled() {
        return this.aK;
    }

    public boolean isInitialized() {
        return this.zzaoz;
    }

    public Tracker newTracker(int i) {
        Tracker tracker;
        zzan zzcg;
        synchronized (this) {
            tracker = new Tracker(zzyt(), null, null);
            if (i > 0 && (zzcg = new zzam(zzyt()).zzcg(i)) != null) {
                tracker.zza(zzcg);
            }
            tracker.initialize();
        }
        return tracker;
    }

    public Tracker newTracker(String str) {
        Tracker tracker;
        synchronized (this) {
            tracker = new Tracker(zzyt(), str, null);
            tracker.initialize();
        }
        return tracker;
    }

    public void reportActivityStart(Activity activity) {
        if (!this.aJ) {
            zzm(activity);
        }
    }

    public void reportActivityStop(Activity activity) {
        if (!this.aJ) {
            zzn(activity);
        }
    }

    public void setAppOptOut(boolean z) {
        this.aL = z;
        if (this.aL) {
            zzzg().zzabr();
        }
    }

    public void setDryRun(boolean z) {
        this.aK = z;
    }

    public void setLocalDispatchPeriod(int i) {
        zzzg().setLocalDispatchPeriod(i);
    }

    @Deprecated
    public void setLogger(Logger logger) {
        zzae.setLogger(logger);
        if (!this.aM) {
            String str = zzy.en.get();
            Log.i(zzy.en.get(), new StringBuilder(String.valueOf(str).length() + 112).append("GoogleAnalytics.setLogger() is deprecated. To enable debug logging, please run:\nadb shell setprop log.tag.").append(str).append(" DEBUG").toString());
            this.aM = true;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(zza zzaVar) {
        this.aI.add(zzaVar);
        Context context = zzyt().getContext();
        if (context instanceof Application) {
            enableAutoActivityReports((Application) context);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzb(zza zzaVar) {
        this.aI.remove(zzaVar);
    }

    void zzm(Activity activity) {
        for (zza zzaVar : this.aI) {
            zzaVar.zzo(activity);
        }
    }

    void zzn(Activity activity) {
        for (zza zzaVar : this.aI) {
            zzaVar.zzp(activity);
        }
    }

    void zzzc() {
        Logger logger;
        zzap zzzh = zzzh();
        if (zzzh.zzafs()) {
            getLogger().setLogLevel(zzzh.getLogLevel());
        }
        if (zzzh.zzafw()) {
            setDryRun(zzzh.zzafx());
        }
        if (!zzzh.zzafs() || (logger = zzae.getLogger()) == null) {
            return;
        }
        logger.setLogLevel(zzzh.getLogLevel());
    }

    public String zzze() {
        zzaa.zzht("getClientId can not be called from the main thread");
        return zzyt().zzacq().zzady();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzzf() {
        zzzg().zzabt();
    }
}
