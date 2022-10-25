package com.google.android.gms.auth.api.credentials.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.support.annotation.Nullable;
import com.google.android.gms.auth.api.Auth;
import com.google.android.gms.auth.api.credentials.internal.zzk;
import com.google.android.gms.common.api.GoogleApiClient;
/* loaded from: classes2.dex */
public final class zzg extends com.google.android.gms.common.internal.zzj<zzk> {
    @Nullable
    private final Auth.AuthCredentialsOptions iV;

    public zzg(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, Auth.AuthCredentialsOptions authCredentialsOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, looper, 68, zzfVar, connectionCallbacks, onConnectionFailedListener);
        this.iV = authCredentialsOptions;
    }

    @Override // com.google.android.gms.common.internal.zze
    protected Bundle zzahv() {
        return this.iV == null ? new Bundle() : this.iV.zzahv();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Auth.AuthCredentialsOptions zzaim() {
        return this.iV;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzce */
    public zzk zzh(IBinder iBinder) {
        return zzk.zza.zzcg(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.gms.auth.api.credentials.service.START";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.auth.api.credentials.internal.ICredentialsService";
    }
}
