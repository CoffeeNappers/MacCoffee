package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.content.ComponentCallbacks2;
import android.content.res.Configuration;
import android.os.Bundle;
import com.google.firebase.FirebaseApp;
import java.util.concurrent.atomic.AtomicBoolean;
@TargetApi(14)
/* loaded from: classes2.dex */
public class zzanq implements Application.ActivityLifecycleCallbacks, ComponentCallbacks2 {
    private static final zzanq bkR = new zzanq();
    private final AtomicBoolean bkS = new AtomicBoolean();
    private boolean cR;

    private zzanq() {
    }

    public static zzanq N() {
        return bkR;
    }

    public static void zza(Application application) {
        application.registerActivityLifecycleCallbacks(bkR);
        application.registerComponentCallbacks(bkR);
        bkR.cR = true;
    }

    public boolean O() {
        return this.bkS.get();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle bundle) {
        if (this.bkS.compareAndSet(true, false)) {
            FirebaseApp.zzcr(false);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityDestroyed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityResumed(Activity activity) {
        if (this.bkS.compareAndSet(true, false)) {
            FirebaseApp.zzcr(false);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
    }

    @Override // android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
    }

    @Override // android.content.ComponentCallbacks
    public void onLowMemory() {
    }

    @Override // android.content.ComponentCallbacks2
    public void onTrimMemory(int i) {
        if (i != 20 || !this.bkS.compareAndSet(false, true)) {
            return;
        }
        FirebaseApp.zzcr(true);
    }
}
