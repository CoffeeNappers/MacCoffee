package com.google.android.gms.gass.internal;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.internal.zze;
import com.google.android.gms.gass.internal.zze;
/* loaded from: classes2.dex */
public class zzb extends com.google.android.gms.common.internal.zze<zze> {
    public zzb(Context context, Looper looper, zze.zzb zzbVar, zze.zzc zzcVar) {
        super(context, looper, 116, zzbVar, zzcVar, null);
    }

    public zze zzbnm() throws DeadObjectException {
        return (zze) super.zzavg();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzgr */
    public zze zzh(IBinder iBinder) {
        return zze.zza.zzgs(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.gms.gass.START";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.gass.internal.IGassService";
    }
}
