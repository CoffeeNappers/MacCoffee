package com.google.android.gms.auth.api;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.internal.zzny;
/* loaded from: classes2.dex */
public final class zza {
    public static final Api.zzf<zzny> ii = new Api.zzf<>();
    private static final Api.zza<zzny, zzb> ij = new Api.zza<zzny, zzb>() { // from class: com.google.android.gms.auth.api.zza.1
        @Override // com.google.android.gms.common.api.Api.zza
        public zzny zza(Context context, Looper looper, zzf zzfVar, zzb zzbVar, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new zzny(context, looper, zzfVar, zzbVar, connectionCallbacks, onConnectionFailedListener);
        }
    };
    public static final Api<zzb> API = new Api<>("Auth.PROXY_API", ij, ii);
}
