package com.google.android.gms.location.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.internal.zzi;
/* loaded from: classes2.dex */
public class zzb extends com.google.android.gms.common.internal.zzj<zzi> {
    private final String akG;
    protected final zzp<zzi> akH;

    public zzb(Context context, Looper looper, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, String str, com.google.android.gms.common.internal.zzf zzfVar) {
        super(context, looper, 23, zzfVar, connectionCallbacks, onConnectionFailedListener);
        this.akH = new zzp<zzi>() { // from class: com.google.android.gms.location.internal.zzb.1
            @Override // com.google.android.gms.location.internal.zzp
            public void zzavf() {
                zzb.this.zzavf();
            }

            @Override // com.google.android.gms.location.internal.zzp
            /* renamed from: zzbqe */
            public zzi zzavg() throws DeadObjectException {
                return (zzi) zzb.this.zzavg();
            }
        };
        this.akG = str;
    }

    @Override // com.google.android.gms.common.internal.zze
    protected Bundle zzahv() {
        Bundle bundle = new Bundle();
        bundle.putString("client_name", this.akG);
        return bundle;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.internal.zze
    /* renamed from: zzhd */
    public zzi zzh(IBinder iBinder) {
        return zzi.zza.zzhg(iBinder);
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjx() {
        return "com.google.android.location.internal.GoogleLocationManagerService.START";
    }

    @Override // com.google.android.gms.common.internal.zze
    protected String zzjy() {
        return "com.google.android.gms.location.internal.IGoogleLocationManagerService";
    }
}
