package com.google.android.gms.measurement.internal;

import android.os.Binder;
import android.support.annotation.BinderThread;
import android.support.annotation.Nullable;
import android.support.annotation.WorkerThread;
import android.text.TextUtils;
import com.google.android.exoplayer2.C;
import com.google.android.gms.measurement.AppMeasurement;
import com.google.android.gms.measurement.internal.zzm;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
/* loaded from: classes2.dex */
public class zzy extends zzm.zza {
    private final zzx aqw;
    private Boolean auE;
    @Nullable
    private String auF;

    public zzy(zzx zzxVar) {
        this(zzxVar, null);
    }

    public zzy(zzx zzxVar, @Nullable String str) {
        com.google.android.gms.common.internal.zzaa.zzy(zzxVar);
        this.aqw = zzxVar;
        this.auF = str;
    }

    @BinderThread
    private void zzb(AppMetadata appMetadata, boolean z) {
        com.google.android.gms.common.internal.zzaa.zzy(appMetadata);
        zzn(appMetadata.packageName, z);
        this.aqw.zzbvx().zznb(appMetadata.aqZ);
    }

    @BinderThread
    private void zzn(String str, boolean z) throws SecurityException {
        if (TextUtils.isEmpty(str)) {
            this.aqw.zzbwb().zzbwy().log("Measurement Service called without app package");
            throw new SecurityException("Measurement Service called without app package");
        }
        try {
            zzo(str, z);
        } catch (SecurityException e) {
            this.aqw.zzbwb().zzbwy().zzj("Measurement Service called with invalid calling package", str);
            throw e;
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzm
    @BinderThread
    public List<UserAttributeParcel> zza(final AppMetadata appMetadata, boolean z) {
        zzb(appMetadata, false);
        try {
            List<zzak> list = (List) this.aqw.zzbwa().zzd(new Callable<List<zzak>>() { // from class: com.google.android.gms.measurement.internal.zzy.7
                @Override // java.util.concurrent.Callable
                /* renamed from: zzbym */
                public List<zzak> call() throws Exception {
                    zzy.this.aqw.zzbyj();
                    return zzy.this.aqw.zzbvw().zzly(appMetadata.packageName);
                }
            }).get();
            ArrayList arrayList = new ArrayList(list.size());
            for (zzak zzakVar : list) {
                if (z || !zzal.zzne(zzakVar.mName)) {
                    arrayList.add(new UserAttributeParcel(zzakVar));
                }
            }
            return arrayList;
        } catch (InterruptedException | ExecutionException e) {
            this.aqw.zzbwb().zzbwy().zzj("Failed to get user attributes", e);
            return null;
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzm
    @BinderThread
    public void zza(final long j, final String str, final String str2, final String str3) {
        this.aqw.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzy.9
            @Override // java.lang.Runnable
            public void run() {
                if (str2 == null) {
                    zzy.this.aqw.zzbvu().zza(str3, (AppMeasurement.zzf) null);
                    return;
                }
                AppMeasurement.zzf zzfVar = new AppMeasurement.zzf();
                zzfVar.aqz = str;
                zzfVar.aqA = str2;
                zzfVar.aqB = j;
                zzy.this.aqw.zzbvu().zza(str3, zzfVar);
            }
        });
    }

    @Override // com.google.android.gms.measurement.internal.zzm
    @BinderThread
    public void zza(final AppMetadata appMetadata) {
        zzb(appMetadata, false);
        this.aqw.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzy.8
            @Override // java.lang.Runnable
            public void run() {
                zzy.this.aqw.zzbyj();
                zzy.this.zzmr(appMetadata.ard);
                zzy.this.aqw.zzd(appMetadata);
            }
        });
    }

    @Override // com.google.android.gms.measurement.internal.zzm
    @BinderThread
    public void zza(final EventParcel eventParcel, final AppMetadata appMetadata) {
        com.google.android.gms.common.internal.zzaa.zzy(eventParcel);
        zzb(appMetadata, false);
        this.aqw.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzy.2
            @Override // java.lang.Runnable
            public void run() {
                zzy.this.aqw.zzbyj();
                zzy.this.zzmr(appMetadata.ard);
                zzy.this.aqw.zzb(eventParcel, appMetadata);
            }
        });
    }

    @Override // com.google.android.gms.measurement.internal.zzm
    @BinderThread
    public void zza(final EventParcel eventParcel, final String str, final String str2) {
        com.google.android.gms.common.internal.zzaa.zzy(eventParcel);
        com.google.android.gms.common.internal.zzaa.zzib(str);
        zzn(str, true);
        this.aqw.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzy.3
            @Override // java.lang.Runnable
            public void run() {
                zzy.this.aqw.zzbyj();
                zzy.this.zzmr(str2);
                zzy.this.aqw.zzb(eventParcel, str);
            }
        });
    }

    @Override // com.google.android.gms.measurement.internal.zzm
    @BinderThread
    public void zza(final UserAttributeParcel userAttributeParcel, final AppMetadata appMetadata) {
        com.google.android.gms.common.internal.zzaa.zzy(userAttributeParcel);
        zzb(appMetadata, false);
        if (userAttributeParcel.getValue() == null) {
            this.aqw.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzy.5
                @Override // java.lang.Runnable
                public void run() {
                    zzy.this.aqw.zzbyj();
                    zzy.this.zzmr(appMetadata.ard);
                    zzy.this.aqw.zzc(userAttributeParcel, appMetadata);
                }
            });
        } else {
            this.aqw.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzy.6
                @Override // java.lang.Runnable
                public void run() {
                    zzy.this.aqw.zzbyj();
                    zzy.this.zzmr(appMetadata.ard);
                    zzy.this.aqw.zzb(userAttributeParcel, appMetadata);
                }
            });
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzm
    @BinderThread
    public byte[] zza(final EventParcel eventParcel, final String str) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzy(eventParcel);
        zzn(str, true);
        this.aqw.zzbwb().zzbxd().zzj("Log and bundle. event", eventParcel.name);
        long nanoTime = this.aqw.zzabz().nanoTime() / C.MICROS_PER_SECOND;
        try {
            byte[] bArr = (byte[]) this.aqw.zzbwa().zze(new Callable<byte[]>() { // from class: com.google.android.gms.measurement.internal.zzy.4
                @Override // java.util.concurrent.Callable
                /* renamed from: zzbyl */
                public byte[] call() throws Exception {
                    zzy.this.aqw.zzbyj();
                    return zzy.this.aqw.zza(eventParcel, str);
                }
            }).get();
            if (bArr == null) {
                this.aqw.zzbwb().zzbwy().log("Log and bundle returned null");
                bArr = new byte[0];
            }
            this.aqw.zzbwb().zzbxd().zzd("Log and bundle processed. event, size, time_ms", eventParcel.name, Integer.valueOf(bArr.length), Long.valueOf((this.aqw.zzabz().nanoTime() / C.MICROS_PER_SECOND) - nanoTime));
            return bArr;
        } catch (InterruptedException | ExecutionException e) {
            this.aqw.zzbwb().zzbwy().zze("Failed to log and bundle. event, error", eventParcel.name, e);
            return null;
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzm
    @BinderThread
    public void zzb(final AppMetadata appMetadata) {
        zzb(appMetadata, false);
        this.aqw.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzy.1
            @Override // java.lang.Runnable
            public void run() {
                zzy.this.aqw.zzbyj();
                zzy.this.zzmr(appMetadata.ard);
                zzy.this.aqw.zzc(appMetadata);
            }
        });
    }

    @WorkerThread
    void zzmr(String str) {
        if (!TextUtils.isEmpty(str)) {
            String[] split = str.split(":", 2);
            if (split.length != 2) {
                return;
            }
            try {
                long longValue = Long.valueOf(split[0]).longValue();
                if (longValue > 0) {
                    this.aqw.zzbwc().asY.zzg(split[1], longValue);
                } else {
                    this.aqw.zzbwb().zzbxa().zzj("Combining sample with a non-positive weight", Long.valueOf(longValue));
                }
            } catch (NumberFormatException e) {
                this.aqw.zzbwb().zzbxa().zzj("Combining sample with a non-number weight", split[0]);
            }
        }
    }

    protected void zzo(String str, boolean z) throws SecurityException {
        boolean z2;
        if (z) {
            if (this.auE == null) {
                if ("com.google.android.gms".equals(this.auF) || com.google.android.gms.common.util.zzx.zzf(this.aqw.getContext(), Binder.getCallingUid()) || com.google.android.gms.common.zzf.zzbv(this.aqw.getContext()).zza(this.aqw.getContext().getPackageManager(), Binder.getCallingUid())) {
                    zzx zzxVar = this.aqw;
                    z2 = true;
                } else {
                    z2 = false;
                }
                this.auE = Boolean.valueOf(z2);
            }
            if (this.auE.booleanValue()) {
                return;
            }
        }
        if (this.auF == null && com.google.android.gms.common.zze.zzc(this.aqw.getContext(), Binder.getCallingUid(), str)) {
            this.auF = str;
        }
        if (!str.equals(this.auF)) {
            throw new SecurityException(String.format("Unknown calling package name '%s'.", str));
        }
    }
}
