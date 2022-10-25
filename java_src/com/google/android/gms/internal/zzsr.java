package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.internal.zzst;
/* loaded from: classes2.dex */
public class zzsr extends com.google.android.gms.common.internal.zzj<zzst> {
    public zzsr(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, looper, 39, zzfVar, connectionCallbacks, onConnectionFailedListener);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzdz */
    public zzst zzh(IBinder iBinder) {
        return zzst.zza.zzeb(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    public String zzjx() {
        return "com.google.android.gms.common.service.START";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.common.internal.service.ICommonService";
    }
}
