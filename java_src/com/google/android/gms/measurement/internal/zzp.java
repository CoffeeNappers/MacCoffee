package com.google.android.gms.measurement.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import android.support.annotation.NonNull;
import com.google.android.gms.common.internal.zze;
import com.google.android.gms.measurement.internal.zzm;
/* loaded from: classes2.dex */
public class zzp extends com.google.android.gms.common.internal.zze<zzm> {
    public zzp(Context context, Looper looper, zze.zzb zzbVar, zze.zzc zzcVar) {
        super(context, looper, 93, zzbVar, zzcVar, null);
    }

    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzjq */
    public zzm zzh(IBinder iBinder) {
        return zzm.zza.zzjp(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    @NonNull
    protected String zzjx() {
        return "com.google.android.gms.measurement.START";
    }

    @Override // com.google.android.gms.common.internal.zze
    @NonNull
    protected String zzjy() {
        return "com.google.android.gms.measurement.internal.IMeasurementService";
    }
}
