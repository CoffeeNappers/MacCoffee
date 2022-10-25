package com.google.firebase.appindexing.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.firebase.appindexing.internal.zzf;
/* loaded from: classes2.dex */
public class zzb extends com.google.android.gms.common.internal.zzj<zzf> {
    private static final Api.zzf<zzb> hg = new Api.zzf<>();
    private static final Api.zza<zzb, Api.ApiOptions.NoOptions> hh = new Api.zza<zzb, Api.ApiOptions.NoOptions>() { // from class: com.google.firebase.appindexing.internal.zzb.1
        @Override // com.google.android.gms.common.api.Api.zza
        /* renamed from: zzw */
        public zzb zza(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, Api.ApiOptions.NoOptions noOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new zzb(context, looper, zzfVar, connectionCallbacks, onConnectionFailedListener);
        }
    };
    static final Api<Api.ApiOptions.NoOptions> API = new Api<>("AppIndexing.API", hh, hg);

    public zzb(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, looper, 113, zzfVar, connectionCallbacks, onConnectionFailedListener);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.gms.icing.APP_INDEXING_SERVICE";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.firebase.appindexing.internal.IAppIndexingService";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzly */
    public zzf zzh(IBinder iBinder) {
        return zzf.zza.zzlz(iBinder);
    }
}
