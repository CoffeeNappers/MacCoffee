package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.internal.zzxl;
/* loaded from: classes2.dex */
public class zzxm extends com.google.android.gms.common.internal.zzj<zzxl> {
    public zzxm(Context context, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, com.google.android.gms.common.internal.zzf zzfVar) {
        super(context, context.getMainLooper(), 73, zzfVar, connectionCallbacks, onConnectionFailedListener);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.gms.search.service.SEARCH_AUTH_START";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.search.internal.ISearchAuthService";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzku */
    public zzxl zzh(IBinder iBinder) {
        return zzxl.zza.zzkt(iBinder);
    }
}
