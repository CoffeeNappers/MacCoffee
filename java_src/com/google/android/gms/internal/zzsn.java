package com.google.android.gms.internal;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
/* loaded from: classes2.dex */
public final class zzsn {
    public static final Api.zzf<zzsr> hg = new Api.zzf<>();
    private static final Api.zza<zzsr, Api.ApiOptions.NoOptions> hh = new Api.zza<zzsr, Api.ApiOptions.NoOptions>() { // from class: com.google.android.gms.internal.zzsn.1
        @Override // com.google.android.gms.common.api.Api.zza
        /* renamed from: zzf */
        public zzsr zza(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, Api.ApiOptions.NoOptions noOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new zzsr(context, looper, zzfVar, connectionCallbacks, onConnectionFailedListener);
        }
    };
    public static final Api<Api.ApiOptions.NoOptions> API = new Api<>("Common.API", hh, hg);
    public static final zzso EU = new zzsp();
}
