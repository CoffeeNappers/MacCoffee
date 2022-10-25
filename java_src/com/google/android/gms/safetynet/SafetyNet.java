package com.google.android.gms.safetynet;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.internal.zzxc;
import com.google.android.gms.internal.zzxd;
import com.google.android.gms.internal.zzxe;
/* loaded from: classes2.dex */
public final class SafetyNet {
    public static final Api.zzf<zzxd> hg = new Api.zzf<>();
    public static final Api.zza<zzxd, Api.ApiOptions.NoOptions> hh = new Api.zza<zzxd, Api.ApiOptions.NoOptions>() { // from class: com.google.android.gms.safetynet.SafetyNet.1
        @Override // com.google.android.gms.common.api.Api.zza
        /* renamed from: zzu */
        public zzxd zza(Context context, Looper looper, zzf zzfVar, Api.ApiOptions.NoOptions noOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new zzxd(context, looper, zzfVar, connectionCallbacks, onConnectionFailedListener);
        }
    };
    public static final Api<Api.ApiOptions.NoOptions> API = new Api<>("SafetyNet.API", hh, hg);
    public static final SafetyNetApi SafetyNetApi = new zzxc();
    public static final zze aCj = new zzxe();

    private SafetyNet() {
    }
}
