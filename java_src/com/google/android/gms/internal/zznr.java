package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.auth.account.zzb;
import com.google.android.gms.common.api.GoogleApiClient;
/* loaded from: classes2.dex */
public class zznr extends com.google.android.gms.common.internal.zzj<com.google.android.gms.auth.account.zzb> {
    public zznr(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, looper, 120, zzfVar, connectionCallbacks, onConnectionFailedListener);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzca */
    public com.google.android.gms.auth.account.zzb zzh(IBinder iBinder) {
        return zzb.zza.zzbz(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.gms.auth.account.workaccount.START";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.auth.account.IWorkAccountService";
    }
}
