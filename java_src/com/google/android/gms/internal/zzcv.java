package com.google.android.gms.internal;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import java.lang.ref.WeakReference;
/* loaded from: classes2.dex */
class zzcv implements Application.ActivityLifecycleCallbacks {
    private final Application zzaul;
    private final WeakReference<Application.ActivityLifecycleCallbacks> zzavf;

    /* loaded from: classes2.dex */
    public interface zza {
        void zza(Application.ActivityLifecycleCallbacks activityLifecycleCallbacks);
    }

    public zzcv(Application application, Application.ActivityLifecycleCallbacks activityLifecycleCallbacks) {
        this.zzavf = new WeakReference<>(activityLifecycleCallbacks);
        this.zzaul = application;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(final Activity activity, final Bundle bundle) {
        zza(new zza() { // from class: com.google.android.gms.internal.zzcv.1
            @Override // com.google.android.gms.internal.zzcv.zza
            public void zza(Application.ActivityLifecycleCallbacks activityLifecycleCallbacks) {
                activityLifecycleCallbacks.onActivityCreated(activity, bundle);
            }
        });
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityDestroyed(final Activity activity) {
        zza(new zza() { // from class: com.google.android.gms.internal.zzcv.7
            @Override // com.google.android.gms.internal.zzcv.zza
            public void zza(Application.ActivityLifecycleCallbacks activityLifecycleCallbacks) {
                activityLifecycleCallbacks.onActivityDestroyed(activity);
            }
        });
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(final Activity activity) {
        zza(new zza() { // from class: com.google.android.gms.internal.zzcv.4
            @Override // com.google.android.gms.internal.zzcv.zza
            public void zza(Application.ActivityLifecycleCallbacks activityLifecycleCallbacks) {
                activityLifecycleCallbacks.onActivityPaused(activity);
            }
        });
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityResumed(final Activity activity) {
        zza(new zza() { // from class: com.google.android.gms.internal.zzcv.3
            @Override // com.google.android.gms.internal.zzcv.zza
            public void zza(Application.ActivityLifecycleCallbacks activityLifecycleCallbacks) {
                activityLifecycleCallbacks.onActivityResumed(activity);
            }
        });
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(final Activity activity, final Bundle bundle) {
        zza(new zza() { // from class: com.google.android.gms.internal.zzcv.6
            @Override // com.google.android.gms.internal.zzcv.zza
            public void zza(Application.ActivityLifecycleCallbacks activityLifecycleCallbacks) {
                activityLifecycleCallbacks.onActivitySaveInstanceState(activity, bundle);
            }
        });
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(final Activity activity) {
        zza(new zza() { // from class: com.google.android.gms.internal.zzcv.2
            @Override // com.google.android.gms.internal.zzcv.zza
            public void zza(Application.ActivityLifecycleCallbacks activityLifecycleCallbacks) {
                activityLifecycleCallbacks.onActivityStarted(activity);
            }
        });
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(final Activity activity) {
        zza(new zza() { // from class: com.google.android.gms.internal.zzcv.5
            @Override // com.google.android.gms.internal.zzcv.zza
            public void zza(Application.ActivityLifecycleCallbacks activityLifecycleCallbacks) {
                activityLifecycleCallbacks.onActivityStopped(activity);
            }
        });
    }

    protected void zza(zza zzaVar) {
        try {
            Application.ActivityLifecycleCallbacks activityLifecycleCallbacks = this.zzavf.get();
            if (activityLifecycleCallbacks != null) {
                zzaVar.zza(activityLifecycleCallbacks);
            } else {
                this.zzaul.unregisterActivityLifecycleCallbacks(this);
            }
        } catch (Exception e) {
            zzkx.zzb("Error while dispatching lifecycle callback.", e);
        }
    }
}
