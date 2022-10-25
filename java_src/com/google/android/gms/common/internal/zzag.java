package com.google.android.gms.common.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
/* loaded from: classes2.dex */
public class zzag<T extends IInterface> extends zzj<T> {
    private final Api.zzg<T> EO;

    public zzag(Context context, Looper looper, int i, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, zzf zzfVar, Api.zzg<T> zzgVar) {
        super(context, looper, i, zzfVar, connectionCallbacks, onConnectionFailedListener);
        this.EO = zzgVar;
    }

    public Api.zzg<T> zzawt() {
        return this.EO;
    }

    @Override // com.google.android.gms.common.internal.zze
    protected void zzc(int i, T t) {
        this.EO.zza(i, t);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected T zzh(IBinder iBinder) {
        return this.EO.zzh(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return this.EO.zzjx();
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return this.EO.zzjy();
    }
}
