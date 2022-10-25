package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzsq;
/* loaded from: classes2.dex */
public final class zzsp implements zzso {

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zza extends zzsm {
        private final zzqo.zzb<Status> EW;

        public zza(zzqo.zzb<Status> zzbVar) {
            this.EW = zzbVar;
        }

        @Override // com.google.android.gms.internal.zzsm, com.google.android.gms.internal.zzss
        public void zzgv(int i) throws RemoteException {
            this.EW.setResult(new Status(i));
        }
    }

    @Override // com.google.android.gms.internal.zzso
    public PendingResult<Status> zzg(GoogleApiClient googleApiClient) {
        return googleApiClient.zzb((GoogleApiClient) new zzsq.zza(googleApiClient) { // from class: com.google.android.gms.internal.zzsp.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zzsr zzsrVar) throws RemoteException {
                ((zzst) zzsrVar.zzavg()).zza(new zza(this));
            }
        });
    }
}
