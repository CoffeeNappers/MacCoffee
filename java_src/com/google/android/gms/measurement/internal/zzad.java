package com.google.android.gms.measurement.internal;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.MainThread;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.Size;
import android.support.annotation.WorkerThread;
import android.support.v4.util.ArrayMap;
import com.google.android.gms.measurement.AppMeasurement;
import java.security.SecureRandom;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicLong;
/* loaded from: classes2.dex */
public class zzad extends zzaa {
    protected zza avd;
    private AppMeasurement.zzf ave;
    private AppMeasurement.zzf avf;
    private long avg;
    private final Map<Activity, zza> avh;
    private final CopyOnWriteArrayList<AppMeasurement.zzd> avi;
    private boolean avj;
    private final AtomicLong avk;
    private AppMeasurement.zzf avl;
    private String avm;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zza extends AppMeasurement.zzf {
        public boolean avr;

        public zza(zza zzaVar) {
            this.aqz = zzaVar.aqz;
            this.aqA = zzaVar.aqA;
            this.aqB = zzaVar.aqB;
            this.avr = zzaVar.avr;
        }

        public zza(String str, String str2, long j) {
            this.aqz = str;
            this.aqA = str2;
            this.aqB = j;
            this.avr = false;
        }
    }

    public zzad(zzx zzxVar) {
        super(zzxVar);
        this.avh = new ArrayMap();
        this.avi = new CopyOnWriteArrayList<>();
        this.avk = new AtomicLong(0L);
    }

    @MainThread
    private void zza(Activity activity, zza zzaVar, final boolean z) {
        boolean z2;
        boolean z3 = true;
        AppMeasurement.zzf zzfVar = this.ave != null ? this.ave : (this.avf == null || Math.abs(zzabz().elapsedRealtime() - this.avg) >= 1000) ? null : this.avf;
        AppMeasurement.zzf zzfVar2 = zzfVar != null ? new AppMeasurement.zzf(zzfVar) : null;
        this.avj = true;
        try {
            Iterator<AppMeasurement.zzd> it = this.avi.iterator();
            while (it.hasNext()) {
                try {
                    z2 = it.next().zza(zzfVar2, zzaVar) & z3;
                } catch (Exception e) {
                    zzbwb().zzbwy().zzj("onScreenChangeCallback threw exception", e);
                    z2 = z3;
                }
                z3 = z2;
            }
        } catch (Exception e2) {
            zzbwb().zzbwy().zzj("onScreenChangeCallback loop threw exception", e2);
        } finally {
            this.avj = false;
        }
        if (z3) {
            if (zzaVar.aqA == null) {
                zzaVar.aqA = zzmt(activity.getClass().getCanonicalName());
            }
            final zza zzaVar2 = new zza(zzaVar);
            this.avf = this.ave;
            this.avg = zzabz().elapsedRealtime();
            this.ave = zzaVar2;
            zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzad.1
                @Override // java.lang.Runnable
                public void run() {
                    if (z && zzad.this.avd != null) {
                        zzad.this.zza(zzad.this.avd);
                    }
                    zzad.this.avd = zzaVar2;
                    zzad.this.zzbvt().zza(zzaVar2);
                }
            });
        }
    }

    public static void zza(AppMeasurement.zzf zzfVar, Bundle bundle) {
        if (bundle == null || zzfVar == null || bundle.containsKey("_sc")) {
            return;
        }
        if (zzfVar.aqz != null) {
            bundle.putString("_sn", zzfVar.aqz);
        }
        bundle.putString("_sc", zzfVar.aqA);
        bundle.putLong("_si", zzfVar.aqB);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public void zza(@NonNull zza zzaVar) {
        if (zzbvz().zzck(zzaVar.avr)) {
            zzaVar.avr = false;
        }
    }

    @MainThread
    private long zzbyu() {
        long andIncrement = this.avk.getAndIncrement();
        if (andIncrement == 0) {
            this.avk.compareAndSet(1L, 0L);
            return new Random(System.nanoTime() ^ zzabz().currentTimeMillis()).nextLong();
        }
        this.avk.compareAndSet(0L, 1L);
        return andIncrement;
    }

    static String zzmt(String str) {
        String[] split = str.split("\\.");
        if (split.length == 0) {
            return str.substring(0, 36);
        }
        String str2 = split[split.length - 1];
        return str2.length() > 36 ? str2.substring(0, 36) : str2;
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ Context getContext() {
        return super.getContext();
    }

    @MainThread
    public void onActivityCreated(Activity activity, Bundle bundle) {
        Bundle bundle2;
        if (bundle == null || (bundle2 = bundle.getBundle("com.google.firebase.analytics.screen_service")) == null) {
            return;
        }
        zza zzv = zzv(activity);
        zzv.aqB = bundle2.getLong("id");
        zzv.aqz = bundle2.getString("name");
        zzv.aqA = bundle2.getString("referrer_name");
    }

    @MainThread
    public void onActivityDestroyed(Activity activity) {
        this.avh.remove(activity);
    }

    @MainThread
    public void onActivityPaused(Activity activity) {
        final zza zzv = zzv(activity);
        this.avf = this.ave;
        this.avg = zzabz().elapsedRealtime();
        this.ave = null;
        zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzad.2
            @Override // java.lang.Runnable
            public void run() {
                zzad.this.zza(zzv);
                zzad.this.avd = null;
                zzad.this.zzbvt().zza((AppMeasurement.zzf) null);
            }
        });
    }

    @MainThread
    public void onActivityResumed(Activity activity) {
        zza(activity, zzv(activity), false);
    }

    @MainThread
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        zza zzaVar;
        if (bundle == null || (zzaVar = this.avh.get(activity)) == null) {
            return;
        }
        Bundle bundle2 = new Bundle();
        bundle2.putLong("id", zzaVar.aqB);
        bundle2.putString("name", zzaVar.aqz);
        bundle2.putString("referrer_name", zzaVar.aqA);
        bundle.putBundle("com.google.firebase.analytics.screen_service", bundle2);
    }

    @MainThread
    public void registerOnScreenChangeCallback(@NonNull AppMeasurement.zzd zzdVar) {
        zzaby();
        if (zzdVar == null) {
            zzbwb().zzbxa().log("Attempting to register null OnScreenChangeCallback");
            return;
        }
        this.avi.remove(zzdVar);
        this.avi.add(zzdVar);
    }

    @MainThread
    public void setCurrentScreen(@NonNull Activity activity, @Size(max = 36, min = 1) @Nullable String str, @Size(max = 36, min = 1) @Nullable String str2) {
        if (Build.VERSION.SDK_INT < 14) {
            zzbwb().zzbxb().log("Screen engagement recording is only available at API level 14+");
        } else if (activity == null) {
            zzbwb().zzbxa().log("setCurrentScreen must be called with a non-null activity");
        } else if (!zzbwa().zzdg()) {
            zzbwb().zzbxa().log("setCurrentScreen must be called from the main thread");
        } else if (this.avj) {
            zzbwb().zzbxa().log("Cannot call setCurrentScreen from onScreenChangeCallback");
        } else if (this.ave == null) {
            zzbwb().zzbxa().log("setCurrentScreen cannot be called while no activity active");
        } else if (this.avh.get(activity) == null) {
            zzbwb().zzbxa().log("setCurrentScreen must be called with an activity in the activity lifecycle");
        } else {
            if (str2 == null) {
                str2 = zzmt(activity.getClass().getCanonicalName());
            }
            boolean equals = this.ave.aqA.equals(str2);
            boolean z = (this.ave.aqz == null && str == null) || (this.ave.aqz != null && this.ave.aqz.equals(str));
            if (equals && z) {
                zzbwb().zzbxb().log("setCurrentScreen cannot be called with the same class and name");
            } else if (str != null && (str.length() < 1 || str.length() > zzbwd().zzbug())) {
                zzbwb().zzbxa().zzj("Invalid screen name length in setCurrentScreen. Length", Integer.valueOf(str.length()));
            } else if (str2 != null && (str2.length() < 1 || str2.length() > zzbwd().zzbug())) {
                zzbwb().zzbxa().zzj("Invalid class name length in setCurrentScreen. Length", Integer.valueOf(str2.length()));
            } else {
                zzbwb().zzbxe().zze("Setting current screen to name, class", str == null ? "null" : str, str2);
                zza zzaVar = new zza(str, str2, zzbyu());
                this.avh.put(activity, zzaVar);
                zza(activity, zzaVar, true);
            }
        }
    }

    @MainThread
    public void unregisterOnScreenChangeCallback(@NonNull AppMeasurement.zzd zzdVar) {
        zzaby();
        this.avi.remove(zzdVar);
    }

    @WorkerThread
    public void zza(String str, AppMeasurement.zzf zzfVar) {
        zzzx();
        if (this.avm == null || this.avm.equals(str) || zzfVar != null) {
            this.avm = str;
            this.avl = zzfVar;
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzaby() {
        super.zzaby();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.common.util.zze zzabz() {
        return super.zzabz();
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

    @WorkerThread
    public zza zzbyt() {
        zzacj();
        zzzx();
        return this.avd;
    }

    @MainThread
    zza zzv(@NonNull Activity activity) {
        com.google.android.gms.common.internal.zzaa.zzy(activity);
        zza zzaVar = this.avh.get(activity);
        if (zzaVar == null) {
            zza zzaVar2 = new zza(null, zzmt(activity.getClass().getCanonicalName()), zzbyu());
            this.avh.put(activity, zzaVar2);
            return zzaVar2;
        }
        return zzaVar;
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzzx() {
        super.zzzx();
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
        SecureRandom secureRandom = new SecureRandom();
        long nextLong = secureRandom.nextLong();
        if (nextLong == 0 || nextLong == 1) {
            nextLong = secureRandom.nextLong();
            if (nextLong == 0 || nextLong == 1) {
                zzbwb().zzbxa().log("ScreenService falling back to Random for screen instance id");
                nextLong = 0;
            }
        }
        this.avk.set(nextLong);
    }
}
