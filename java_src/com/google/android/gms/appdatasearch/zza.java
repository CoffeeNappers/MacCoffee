package com.google.android.gms.appdatasearch;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.internal.zzni;
import com.google.android.gms.internal.zznk;
/* loaded from: classes2.dex */
public final class zza {
    public static final Api.zzf<zzni> fZ = new Api.zzf<>();
    private static final Api.zza<zzni, Api.ApiOptions.NoOptions> ga = new Api.zza<zzni, Api.ApiOptions.NoOptions>() { // from class: com.google.android.gms.appdatasearch.zza.1
        @Override // com.google.android.gms.common.api.Api.zza
        public zzni zza(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, Api.ApiOptions.NoOptions noOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new zzni(context, looper, zzfVar, connectionCallbacks, onConnectionFailedListener);
        }
    };
    public static final Api<Api.ApiOptions.NoOptions> gb = new Api<>("AppDataSearch.LIGHTWEIGHT_API", ga, fZ);
    public static final zzk gc = new zznk();
}
