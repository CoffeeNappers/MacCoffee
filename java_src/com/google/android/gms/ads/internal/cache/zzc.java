package com.google.android.gms.ads.internal.cache;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.ads.internal.cache.zzf;
import com.google.android.gms.common.internal.zze;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzc extends com.google.android.gms.common.internal.zze<zzf> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public zzc(Context context, Looper looper, zze.zzb zzbVar, zze.zzc zzcVar) {
        super(context, looper, 123, zzbVar, zzcVar, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzg */
    public zzf zzh(IBinder iBinder) {
        return zzf.zza.zzi(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.gms.ads.service.CACHE";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.ads.internal.cache.ICacheService";
    }

    public zzf zzjz() throws DeadObjectException {
        return (zzf) super.zzavg();
    }
}
