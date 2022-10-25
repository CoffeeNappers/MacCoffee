package com.google.android.gms.measurement.internal;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.MainThread;
import android.support.annotation.WorkerThread;
import android.text.TextUtils;
import com.google.android.gms.measurement.AppMeasurement;
import com.google.android.gms.measurement.internal.zzad;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes2.dex */
public class zzac extends zzaa {
    protected zza auO;
    private AppMeasurement.zzb auP;
    private final Set<AppMeasurement.zzc> auQ;
    private boolean auR;

    /* JADX INFO: Access modifiers changed from: private */
    @TargetApi(14)
    @MainThread
    /* loaded from: classes2.dex */
    public class zza implements Application.ActivityLifecycleCallbacks {
        private zza() {
        }

        private boolean zzms(String str) {
            if (!TextUtils.isEmpty(str)) {
                zzac.this.zzd("auto", "_ldl", str);
                return true;
            }
            return false;
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityCreated(Activity activity, Bundle bundle) {
            Uri data;
            Bundle zzu;
            try {
                zzac.this.zzbwb().zzbxe().log("onActivityCreated");
                Intent intent = activity.getIntent();
                if (intent != null && (data = intent.getData()) != null && data.isHierarchical()) {
                    if (bundle == null && (zzu = zzac.this.zzbvx().zzu(data)) != null) {
                        zzac.this.zzf("auto", "_cmp", zzu);
                    }
                    String queryParameter = data.getQueryParameter(ArgKeys.REFERRER);
                    if (TextUtils.isEmpty(queryParameter)) {
                        return;
                    }
                    if (!(queryParameter.contains("gclid") && (queryParameter.contains("utm_campaign") || queryParameter.contains("utm_source") || queryParameter.contains("utm_medium") || queryParameter.contains("utm_term") || queryParameter.contains("utm_content")))) {
                        zzac.this.zzbwb().zzbxd().log("Activity created with data 'referrer' param without gclid and at least one utm field");
                        return;
                    } else {
                        zzac.this.zzbwb().zzbxd().zzj("Activity created with referrer", queryParameter);
                        zzms(queryParameter);
                    }
                }
            } catch (Throwable th) {
                zzac.this.zzbwb().zzbwy().zzj("Throwable caught in onActivityCreated", th);
            }
            zzac.this.zzbvu().onActivityCreated(activity, bundle);
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityDestroyed(Activity activity) {
            zzac.this.zzbvu().onActivityDestroyed(activity);
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        @MainThread
        public void onActivityPaused(Activity activity) {
            zzac.this.zzbvu().onActivityPaused(activity);
            zzac.this.zzbvz().zzbzd();
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        @MainThread
        public void onActivityResumed(Activity activity) {
            zzac.this.zzbvu().onActivityResumed(activity);
            zzac.this.zzbvz().zzbzb();
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
            zzac.this.zzbvu().onActivitySaveInstanceState(activity, bundle);
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStarted(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStopped(Activity activity) {
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzac(zzx zzxVar) {
        super(zzxVar);
        this.auQ = new CopyOnWriteArraySet();
    }

    private void zza(String str, String str2, Bundle bundle, boolean z, boolean z2, boolean z3, String str3) {
        zza(str, str2, zzabz().currentTimeMillis(), bundle, z, z2, z3, str3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public void zza(String str, String str2, Object obj, long j) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzib(str2);
        zzzx();
        zzaby();
        zzacj();
        if (!this.aqw.isEnabled()) {
            zzbwb().zzbxd().log("User property not set since app measurement is disabled");
        } else if (!this.aqw.zzbxq()) {
        } else {
            zzbwb().zzbxd().zze("Setting user property (FE)", str2, obj);
            zzbvt().zzb(new UserAttributeParcel(str2, j, obj, str));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public void zzb(String str, String str2, long j, Bundle bundle, boolean z, boolean z2, boolean z3, String str3) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzib(str2);
        com.google.android.gms.common.internal.zzaa.zzy(bundle);
        zzzx();
        zzacj();
        if (!this.aqw.isEnabled()) {
            zzbwb().zzbxd().log("Event not sent since app measurement is disabled");
            return;
        }
        if (!this.auR) {
            this.auR = true;
            zzbyr();
        }
        boolean zzne = zzal.zzne(str2);
        if (z && this.auP != null && !zzne) {
            zzbwb().zzbxd().zze("Passing event to registered event handler (FE)", str2, bundle);
            this.auP.zzb(str, str2, bundle, j);
        } else if (this.aqw.zzbxq()) {
            int zzmw = zzbvx().zzmw(str2);
            if (zzmw != 0) {
                this.aqw.zzbvx().zza(zzmw, "_ev", zzbvx().zza(str2, zzbwd().zzbud(), true), str2 != null ? str2.length() : 0);
                return;
            }
            bundle.putString("_o", str);
            Bundle zza2 = zzbvx().zza(str2, bundle, com.google.android.gms.common.util.zzf.zzz("_o"), z3);
            if (!bundle.containsKey("_sc")) {
                zzbwd().zzayi();
                zzad.zza zzbyt = zzbvu().zzbyt();
                if (zzbyt != null) {
                    zzbyt.avr = true;
                }
                zzad.zza(zzbyt, zza2);
            }
            Bundle zzam = z2 ? zzam(zza2) : zza2;
            zzbwb().zzbxd().zze("Logging event (FE)", str2, zzam);
            zzbvt().zzc(new EventParcel(str2, new EventParams(zzam), str, j), str3);
            for (AppMeasurement.zzc zzcVar : this.auQ) {
                zzcVar.zzc(str, str2, new Bundle(zzam), j);
            }
        }
    }

    @WorkerThread
    private void zzbyr() {
        try {
            zzg(Class.forName(zzbys()));
        } catch (ClassNotFoundException e) {
            zzbwb().zzbxc().log("Tag Manager is not found and thus will not be used");
        }
    }

    private String zzbys() {
        return "com.google.android.gms.tagmanager.TagManagerService";
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public void zzci(boolean z) {
        zzzx();
        zzaby();
        zzacj();
        zzbwb().zzbxd().zzj("Setting app measurement enabled (FE)", Boolean.valueOf(z));
        zzbwc().setMeasurementEnabled(z);
        zzbvt().zzbyv();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ Context getContext() {
        return super.getContext();
    }

    public void setMeasurementEnabled(final boolean z) {
        zzacj();
        zzaby();
        zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzac.1
            @Override // java.lang.Runnable
            public void run() {
                zzac.this.zzci(z);
            }
        });
    }

    public void setMinimumSessionDuration(final long j) {
        zzaby();
        zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzac.2
            @Override // java.lang.Runnable
            public void run() {
                zzac.this.zzbwc().ati.set(j);
                zzac.this.zzbwb().zzbxd().zzj("Minimum session duration set", Long.valueOf(j));
            }
        });
    }

    public void setSessionTimeoutDuration(final long j) {
        zzaby();
        zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzac.3
            @Override // java.lang.Runnable
            public void run() {
                zzac.this.zzbwc().atj.set(j);
                zzac.this.zzbwb().zzbxd().zzj("Session timeout duration set", Long.valueOf(j));
            }
        });
    }

    @WorkerThread
    public void zza(AppMeasurement.zzb zzbVar) {
        zzzx();
        zzaby();
        zzacj();
        if (zzbVar != null && zzbVar != this.auP) {
            com.google.android.gms.common.internal.zzaa.zza(this.auP == null, "EventInterceptor already set.");
        }
        this.auP = zzbVar;
    }

    public void zza(AppMeasurement.zzc zzcVar) {
        zzaby();
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(zzcVar);
        if (!this.auQ.add(zzcVar)) {
            zzbwb().zzbxa().log("OnEventListener already registered");
        }
    }

    protected void zza(final String str, final String str2, final long j, Bundle bundle, final boolean z, final boolean z2, final boolean z3, final String str3) {
        final Bundle bundle2 = bundle != null ? new Bundle(bundle) : new Bundle();
        zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzac.4
            @Override // java.lang.Runnable
            public void run() {
                zzac.this.zzb(str, str2, j, bundle2, z, z2, z3, str3);
            }
        });
    }

    void zza(final String str, final String str2, final long j, final Object obj) {
        zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzac.5
            @Override // java.lang.Runnable
            public void run() {
                zzac.this.zza(str, str2, obj, j);
            }
        });
    }

    public void zza(String str, String str2, Bundle bundle, boolean z) {
        zzaby();
        zza(str, str2, bundle, true, this.auP == null || zzal.zzne(str2), z, null);
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzaby() {
        super.zzaby();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.common.util.zze zzabz() {
        return super.zzabz();
    }

    Bundle zzam(Bundle bundle) {
        Bundle bundle2 = new Bundle();
        if (bundle != null) {
            for (String str : bundle.keySet()) {
                Object zzl = zzbvx().zzl(str, bundle.get(str));
                if (zzl == null) {
                    zzbwb().zzbxa().zzj("Param value can't be null", str);
                } else {
                    zzbvx().zza(bundle2, str, zzl);
                }
            }
        }
        return bundle2;
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzbvo() {
        super.zzbvo();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzc zzbvp() {
        return super.zzbvp();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzac zzbvq() {
        return super.zzbvq();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzn zzbvr() {
        return super.zzbvr();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzg zzbvs() {
        return super.zzbvs();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzae zzbvt() {
        return super.zzbvt();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzad zzbvu() {
        return super.zzbvu();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzo zzbvv() {
        return super.zzbvv();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zze zzbvw() {
        return super.zzbvw();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzal zzbvx() {
        return super.zzbvx();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzv zzbvy() {
        return super.zzbvy();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzag zzbvz() {
        return super.zzbvz();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzw zzbwa() {
        return super.zzbwa();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzq zzbwb() {
        return super.zzbwb();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzt zzbwc() {
        return super.zzbwc();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzd zzbwd() {
        return super.zzbwd();
    }

    @TargetApi(14)
    public void zzbyp() {
        if (getContext().getApplicationContext() instanceof Application) {
            Application application = (Application) getContext().getApplicationContext();
            if (this.auO == null) {
                this.auO = new zza();
            }
            application.unregisterActivityLifecycleCallbacks(this.auO);
            application.registerActivityLifecycleCallbacks(this.auO);
            zzbwb().zzbxe().log("Registered activity lifecycle callback");
        }
    }

    @WorkerThread
    public void zzbyq() {
        zzzx();
        zzaby();
        zzacj();
        if (!this.aqw.zzbxq()) {
            return;
        }
        zzbvt().zzbyq();
        String zzbxn = zzbwc().zzbxn();
        if (TextUtils.isEmpty(zzbxn) || zzbxn.equals(zzbvs().zzbws())) {
            return;
        }
        Bundle bundle = new Bundle();
        bundle.putString("_po", zzbxn);
        zzf("auto", "_ou", bundle);
    }

    public List<UserAttributeParcel> zzcj(final boolean z) {
        zzaby();
        zzacj();
        zzbwb().zzbxd().log("Fetching user attributes (FE)");
        final AtomicReference atomicReference = new AtomicReference();
        synchronized (atomicReference) {
            this.aqw.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzac.6
                @Override // java.lang.Runnable
                public void run() {
                    zzac.this.zzbvt().zza(atomicReference, z);
                }
            });
            try {
                atomicReference.wait(5000L);
            } catch (InterruptedException e) {
                zzbwb().zzbxa().zzj("Interrupted waiting for get user properties", e);
            }
        }
        List<UserAttributeParcel> list = (List) atomicReference.get();
        if (list == null) {
            zzbwb().zzbxa().log("Timed out waiting for get user properties");
            return Collections.emptyList();
        }
        return list;
    }

    public void zzd(String str, String str2, Bundle bundle, long j) {
        zzaby();
        zza(str, str2, j, bundle, false, true, true, null);
    }

    public void zzd(String str, String str2, Object obj) {
        int i = 0;
        com.google.android.gms.common.internal.zzaa.zzib(str);
        long currentTimeMillis = zzabz().currentTimeMillis();
        int zzmy = zzbvx().zzmy(str2);
        if (zzmy != 0) {
            String zza2 = zzbvx().zza(str2, zzbwd().zzbue(), true);
            if (str2 != null) {
                i = str2.length();
            }
            this.aqw.zzbvx().zza(zzmy, "_ev", zza2, i);
        } else if (obj == null) {
            zza(str, str2, currentTimeMillis, (Object) null);
        } else {
            int zzm = zzbvx().zzm(str2, obj);
            if (zzm == 0) {
                Object zzn = zzbvx().zzn(str2, obj);
                if (zzn == null) {
                    return;
                }
                zza(str, str2, currentTimeMillis, zzn);
                return;
            }
            String zza3 = zzbvx().zza(str2, zzbwd().zzbue(), true);
            if ((obj instanceof String) || (obj instanceof CharSequence)) {
                i = String.valueOf(obj).length();
            }
            this.aqw.zzbvx().zza(zzm, "_ev", zza3, i);
        }
    }

    public void zzf(String str, String str2, Bundle bundle) {
        zzaby();
        zza(str, str2, bundle, true, this.auP == null || zzal.zzne(str2), false, null);
    }

    @WorkerThread
    public void zzg(Class<?> cls) {
        try {
            cls.getDeclaredMethod("initialize", Context.class).invoke(null, getContext());
        } catch (Exception e) {
            zzbwb().zzbxa().zzj("Failed to invoke Tag Manager's initialize() method", e);
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzzx() {
        super.zzzx();
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
    }
}
