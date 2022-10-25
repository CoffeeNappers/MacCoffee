package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import android.support.annotation.NonNull;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.internal.zznw;
/* loaded from: classes2.dex */
public class zznu extends com.google.android.gms.common.internal.zzj<zznw> {
    public zznu(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, looper, 74, zzfVar, connectionCallbacks, onConnectionFailedListener);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzcb */
    public zznw zzh(IBinder iBinder) {
        return zznw.zza.zzcd(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    @NonNull
    protected String zzjx() {
        return "com.google.android.gms.auth.api.accountactivationstate.START";
    }

    @Override // com.google.android.gms.common.internal.zze
    @NonNull
    protected String zzjy() {
        return "com.google.android.gms.auth.api.accountactivationstate.internal.IAccountActivationStateService";
    }
}
