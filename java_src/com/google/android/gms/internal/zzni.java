package com.google.android.gms.internal;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.internal.zznf;
/* loaded from: classes2.dex */
public class zzni extends com.google.android.gms.common.internal.zzj<zznf> {
    public zzni(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, looper, 19, zzfVar, connectionCallbacks, onConnectionFailedListener);
    }

    public zznf zzaht() throws DeadObjectException {
        return (zznf) zzavg();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzbp */
    public zznf zzh(IBinder iBinder) {
        return zznf.zza.zzbn(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.gms.icing.LIGHTWEIGHT_INDEX_SERVICE";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch";
    }
}
