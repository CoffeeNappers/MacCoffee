package com.google.android.gms.internal;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
/* loaded from: classes2.dex */
public class zzqr implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener {
    public final Api<?> vS;
    private final int yU;
    private zzqs yV;

    public zzqr(Api<?> api, int i) {
        this.vS = api;
        this.yU = i;
    }

    private void zzary() {
        com.google.android.gms.common.internal.zzaa.zzb(this.yV, "Callbacks must be attached to a ClientConnectionHelper instance before connecting the client.");
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
    public void onConnected(@Nullable Bundle bundle) {
        zzary();
        this.yV.onConnected(bundle);
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener
    public void onConnectionFailed(@NonNull ConnectionResult connectionResult) {
        zzary();
        this.yV.zza(connectionResult, this.vS, this.yU);
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
    public void onConnectionSuspended(int i) {
        zzary();
        this.yV.onConnectionSuspended(i);
    }

    public void zza(zzqs zzqsVar) {
        this.yV = zzqsVar;
    }
}
