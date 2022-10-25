package com.google.android.gms.location;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.location.internal.zzq;
/* loaded from: classes2.dex */
public class LocationServices {
    private static final Api.zzf<com.google.android.gms.location.internal.zzl> hg = new Api.zzf<>();
    private static final Api.zza<com.google.android.gms.location.internal.zzl, Api.ApiOptions.NoOptions> hh = new Api.zza<com.google.android.gms.location.internal.zzl, Api.ApiOptions.NoOptions>() { // from class: com.google.android.gms.location.LocationServices.1
        @Override // com.google.android.gms.common.api.Api.zza
        /* renamed from: zzq */
        public com.google.android.gms.location.internal.zzl zza(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, Api.ApiOptions.NoOptions noOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new com.google.android.gms.location.internal.zzl(context, looper, connectionCallbacks, onConnectionFailedListener, "locationServices", zzfVar);
        }
    };
    public static final Api<Api.ApiOptions.NoOptions> API = new Api<>("LocationServices.API", hh, hg);
    public static final FusedLocationProviderApi FusedLocationApi = new com.google.android.gms.location.internal.zzd();
    public static final GeofencingApi GeofencingApi = new com.google.android.gms.location.internal.zzf();
    public static final SettingsApi SettingsApi = new zzq();

    /* loaded from: classes2.dex */
    public static abstract class zza<R extends Result> extends zzqo.zza<R, com.google.android.gms.location.internal.zzl> {
        public zza(GoogleApiClient googleApiClient) {
            super(LocationServices.API, googleApiClient);
        }
    }

    private LocationServices() {
    }

    public static com.google.android.gms.location.internal.zzl zzj(GoogleApiClient googleApiClient) {
        boolean z = true;
        zzaa.zzb(googleApiClient != null, "GoogleApiClient parameter is required.");
        com.google.android.gms.location.internal.zzl zzlVar = (com.google.android.gms.location.internal.zzl) googleApiClient.zza(hg);
        if (zzlVar == null) {
            z = false;
        }
        zzaa.zza(z, "GoogleApiClient is not configured to use the LocationServices.API Api. Pass thisinto GoogleApiClient.Builder#addApi() to use this feature.");
        return zzlVar;
    }
}
