package com.google.android.gms.search;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.internal.zzxm;
import com.google.android.gms.internal.zzxn;
/* loaded from: classes2.dex */
public class SearchAuth {
    private static final Api.zza<zzxm, Api.ApiOptions.NoOptions> aCY = new Api.zza<zzxm, Api.ApiOptions.NoOptions>() { // from class: com.google.android.gms.search.SearchAuth.1
        @Override // com.google.android.gms.common.api.Api.zza
        /* renamed from: zzv */
        public zzxm zza(Context context, Looper looper, zzf zzfVar, Api.ApiOptions.NoOptions noOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new zzxm(context, connectionCallbacks, onConnectionFailedListener, zzfVar);
        }
    };
    public static final Api.zzf<zzxm> hg = new Api.zzf<>();
    public static final Api<Api.ApiOptions.NoOptions> API = new Api<>("SearchAuth.API", aCY, hg);
    public static final SearchAuthApi SearchAuthApi = new zzxn();

    /* loaded from: classes2.dex */
    public static class StatusCodes {
        public static final int AUTH_DISABLED = 10000;
        public static final int AUTH_THROTTLED = 10001;
        public static final int DEVELOPER_ERROR = 10;
        public static final int INTERNAL_ERROR = 8;
        public static final int SUCCESS = 0;
    }

    private SearchAuth() {
    }
}
