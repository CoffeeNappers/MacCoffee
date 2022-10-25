package com.google.android.gms.internal;

import android.os.Bundle;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.internal.zzqo;
/* loaded from: classes2.dex */
public interface zzre {
    void begin();

    void connect();

    boolean disconnect();

    void onConnected(Bundle bundle);

    void onConnectionSuspended(int i);

    <A extends Api.zzb, R extends Result, T extends zzqo.zza<R, A>> T zza(T t);

    void zza(ConnectionResult connectionResult, Api<?> api, int i);

    <A extends Api.zzb, T extends zzqo.zza<? extends Result, A>> T zzb(T t);
}
