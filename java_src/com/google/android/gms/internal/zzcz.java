package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzcz {
    private final Object zzavz = new Object();
    private zza zzawa = null;
    private boolean zzawb = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    @TargetApi(14)
    /* loaded from: classes2.dex */
    public static class zza implements Application.ActivityLifecycleCallbacks {
        @Nullable
        private Activity mActivity;
        private Context mContext;
        private Runnable zzawe;
        private long zzawf;
        private final Object zzako = new Object();
        private boolean zzawc = true;
        private boolean zzawd = false;
        private List<zzb> mListeners = new ArrayList();
        private boolean zzaoz = false;

        zza() {
        }

        private void setActivity(Activity activity) {
            synchronized (this.zzako) {
                if (!activity.getClass().getName().startsWith("com.google.android.gms.ads")) {
                    this.mActivity = activity;
                }
            }
        }

        @Nullable
        public Activity getActivity() {
            return this.mActivity;
        }

        @Nullable
        public Context getContext() {
            return this.mContext;
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityCreated(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityDestroyed(Activity activity) {
            synchronized (this.zzako) {
                if (this.mActivity == null) {
                    return;
                }
                if (this.mActivity.equals(activity)) {
                    this.mActivity = null;
                }
            }
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityPaused(Activity activity) {
            setActivity(activity);
            this.zzawd = true;
            if (this.zzawe != null) {
                zzlb.zzcvl.removeCallbacks(this.zzawe);
            }
            Handler handler = zzlb.zzcvl;
            Runnable runnable = new Runnable() { // from class: com.google.android.gms.internal.zzcz.zza.1
                @Override // java.lang.Runnable
                public void run() {
                    synchronized (zza.this.zzako) {
                        if (!zza.this.zzawc || !zza.this.zzawd) {
                            zzkx.zzdg("App is still foreground");
                        } else {
                            zza.this.zzawc = false;
                            zzkx.zzdg("App went background");
                            for (zzb zzbVar : zza.this.mListeners) {
                                try {
                                    zzbVar.zzk(false);
                                } catch (Exception e) {
                                    zzkx.zzb("OnForegroundStateChangedListener threw exception.", e);
                                }
                            }
                        }
                    }
                }
            };
            this.zzawe = runnable;
            handler.postDelayed(runnable, this.zzawf);
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityResumed(Activity activity) {
            boolean z = false;
            setActivity(activity);
            this.zzawd = false;
            if (!this.zzawc) {
                z = true;
            }
            this.zzawc = true;
            if (this.zzawe != null) {
                zzlb.zzcvl.removeCallbacks(this.zzawe);
            }
            synchronized (this.zzako) {
                if (z) {
                    for (zzb zzbVar : this.mListeners) {
                        try {
                            zzbVar.zzk(true);
                        } catch (Exception e) {
                            zzkx.zzb("OnForegroundStateChangedListener threw exception.", e);
                        }
                    }
                } else {
                    zzkx.zzdg("App is still foreground.");
                }
            }
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStarted(Activity activity) {
            setActivity(activity);
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStopped(Activity activity) {
        }

        public void zza(Application application, Context context) {
            if (!this.zzaoz) {
                application.registerActivityLifecycleCallbacks(this);
                if (context instanceof Activity) {
                    setActivity((Activity) context);
                }
                this.mContext = context;
                this.zzawf = zzdr.zzbga.get().longValue();
                this.zzaoz = true;
            }
        }

        public void zza(zzb zzbVar) {
            this.mListeners.add(zzbVar);
        }
    }

    /* loaded from: classes2.dex */
    public interface zzb {
        void zzk(boolean z);
    }

    @Nullable
    public Activity getActivity() {
        Activity activity = null;
        synchronized (this.zzavz) {
            if (com.google.android.gms.common.util.zzs.zzayq()) {
                if (this.zzawa != null) {
                    activity = this.zzawa.getActivity();
                }
            }
        }
        return activity;
    }

    @Nullable
    public Context getContext() {
        Context context = null;
        synchronized (this.zzavz) {
            if (com.google.android.gms.common.util.zzs.zzayq()) {
                if (this.zzawa != null) {
                    context = this.zzawa.getContext();
                }
            }
        }
        return context;
    }

    public void initialize(Context context) {
        synchronized (this.zzavz) {
            if (!this.zzawb) {
                if (!com.google.android.gms.common.util.zzs.zzayq()) {
                    return;
                }
                if (!zzdr.zzbfz.get().booleanValue()) {
                    return;
                }
                Context applicationContext = context.getApplicationContext();
                if (applicationContext == null) {
                    applicationContext = context;
                }
                Application application = applicationContext instanceof Application ? (Application) applicationContext : null;
                if (application == null) {
                    zzkx.zzdi("Can not cast Context to Application");
                    return;
                }
                if (this.zzawa == null) {
                    this.zzawa = new zza();
                }
                this.zzawa.zza(application, context);
                this.zzawb = true;
            }
        }
    }

    public void zza(zzb zzbVar) {
        synchronized (this.zzavz) {
            if (!com.google.android.gms.common.util.zzs.zzayq()) {
                return;
            }
            if (!zzdr.zzbfz.get().booleanValue()) {
                return;
            }
            if (this.zzawa == null) {
                this.zzawa = new zza();
            }
            this.zzawa.zza(zzbVar);
        }
    }
}
