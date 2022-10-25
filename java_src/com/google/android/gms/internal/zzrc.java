package com.google.android.gms.internal;

import android.os.Bundle;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.internal.zzqo;
import java.util.Collections;
/* loaded from: classes2.dex */
public class zzrc implements zzre {
    private final zzrf zA;

    public zzrc(zzrf zzrfVar) {
        this.zA = zzrfVar;
    }

    @Override // com.google.android.gms.internal.zzre
    public void begin() {
        this.zA.zzate();
        this.zA.yW.Ak = Collections.emptySet();
    }

    @Override // com.google.android.gms.internal.zzre
    public void connect() {
        this.zA.zzatc();
    }

    @Override // com.google.android.gms.internal.zzre
    public boolean disconnect() {
        return true;
    }

    @Override // com.google.android.gms.internal.zzre
    public void onConnected(Bundle bundle) {
    }

    @Override // com.google.android.gms.internal.zzre
    public void onConnectionSuspended(int i) {
    }

    @Override // com.google.android.gms.internal.zzre
    public <A extends Api.zzb, R extends Result, T extends zzqo.zza<R, A>> T zza(T t) {
        this.zA.yW.Ad.add(t);
        return t;
    }

    @Override // com.google.android.gms.internal.zzre
    public void zza(ConnectionResult connectionResult, Api<?> api, int i) {
    }

    @Override // com.google.android.gms.internal.zzre
    public <A extends Api.zzb, T extends zzqo.zza<? extends Result, A>> T zzb(T t) {
        throw new IllegalStateException("GoogleApiClient is not connected yet.");
    }
}
