package com.google.android.gms.auth.account;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.internal.zznq;
import com.google.android.gms.internal.zznr;
/* loaded from: classes2.dex */
public class WorkAccount {
    private static final Api.zzf<zznr> hg = new Api.zzf<>();
    private static final Api.zza<zznr, Api.ApiOptions.NoOptions> hh = new Api.zza<zznr, Api.ApiOptions.NoOptions>() { // from class: com.google.android.gms.auth.account.WorkAccount.1
        @Override // com.google.android.gms.common.api.Api.zza
        /* renamed from: zzc */
        public zznr zza(Context context, Looper looper, zzf zzfVar, Api.ApiOptions.NoOptions noOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new zznr(context, looper, zzfVar, connectionCallbacks, onConnectionFailedListener);
        }
    };
    public static final Api<Api.ApiOptions.NoOptions> API = new Api<>("WorkAccount.API", hh, hg);
    public static final WorkAccountApi WorkAccountApi = new zznq();

    private WorkAccount() {
    }
}
