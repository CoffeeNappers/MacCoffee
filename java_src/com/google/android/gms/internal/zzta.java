package com.google.android.gms.internal;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
/* loaded from: classes2.dex */
public final class zzta {
    public static final Api.zzf<com.google.android.gms.config.internal.zze> hg = new Api.zzf<>();
    static final Api.zza<com.google.android.gms.config.internal.zze, Api.ApiOptions.NoOptions> hh = new Api.zza<com.google.android.gms.config.internal.zze, Api.ApiOptions.NoOptions>() { // from class: com.google.android.gms.internal.zzta.1
        @Override // com.google.android.gms.common.api.Api.zza
        /* renamed from: zzg */
        public com.google.android.gms.config.internal.zze zza(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, Api.ApiOptions.NoOptions noOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new com.google.android.gms.config.internal.zze(context, looper, zzfVar, connectionCallbacks, onConnectionFailedListener);
        }
    };
    public static final Api<Api.ApiOptions.NoOptions> API = new Api<>("Config.API", hh, hg);
    public static final zztb GR = new com.google.android.gms.config.internal.zzc();
}
