package com.google.android.gms.location;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.internal.zzqo;
/* loaded from: classes2.dex */
public class ActivityRecognition {
    public static final String CLIENT_NAME = "activity_recognition";
    private static final Api.zzf<com.google.android.gms.location.internal.zzl> hg = new Api.zzf<>();
    private static final Api.zza<com.google.android.gms.location.internal.zzl, Api.ApiOptions.NoOptions> hh = new Api.zza<com.google.android.gms.location.internal.zzl, Api.ApiOptions.NoOptions>() { // from class: com.google.android.gms.location.ActivityRecognition.1
        @Override // com.google.android.gms.common.api.Api.zza
        /* renamed from: zzq */
        public com.google.android.gms.location.internal.zzl zza(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, Api.ApiOptions.NoOptions noOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new com.google.android.gms.location.internal.zzl(context, looper, connectionCallbacks, onConnectionFailedListener, ActivityRecognition.CLIENT_NAME);
        }
    };
    public static final Api<Api.ApiOptions.NoOptions> API = new Api<>("ActivityRecognition.API", hh, hg);
    public static final ActivityRecognitionApi ActivityRecognitionApi = new com.google.android.gms.location.internal.zza();

    /* loaded from: classes2.dex */
    public static abstract class zza<R extends Result> extends zzqo.zza<R, com.google.android.gms.location.internal.zzl> {
        public zza(GoogleApiClient googleApiClient) {
            super(ActivityRecognition.API, googleApiClient);
        }
    }

    private ActivityRecognition() {
    }
}
