package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import com.google.android.gms.clearcut.LogEventParcelable;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.internal.zzqg;
/* loaded from: classes2.dex */
public class zzqd extends com.google.android.gms.common.internal.zzj<zzqg> {
    public zzqd(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, looper, 40, zzfVar, connectionCallbacks, onConnectionFailedListener);
    }

    public void zza(zzqf zzqfVar, LogEventParcelable logEventParcelable) throws RemoteException {
        ((zzqg) zzavg()).zza(zzqfVar, logEventParcelable);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzdm */
    public zzqg zzh(IBinder iBinder) {
        return zzqg.zza.zzdo(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.gms.clearcut.service.START";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.clearcut.internal.IClearcutLoggerService";
    }
}
