package com.google.android.gms.ads.internal.request;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.ads.internal.request.zzk;
import com.google.android.gms.common.internal.zze;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zze extends com.google.android.gms.common.internal.zze<zzk> {
    final int zzcjs;

    public zze(Context context, Looper looper, zze.zzb zzbVar, zze.zzc zzcVar, int i) {
        super(context, looper, 8, zzbVar, zzcVar, null);
        this.zzcjs = i;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzbd */
    public zzk zzh(IBinder iBinder) {
        return zzk.zza.zzbe(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.gms.ads.service.START";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.ads.internal.request.IAdRequestService";
    }

    public zzk zzte() throws DeadObjectException {
        return (zzk) super.zzavg();
    }
}
