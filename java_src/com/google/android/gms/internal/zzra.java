package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.DeadObjectException;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzrf;
/* loaded from: classes2.dex */
public class zzra implements zzre {
    private final zzrf zA;
    private boolean zB = false;

    public zzra(zzrf zzrfVar) {
        this.zA = zzrfVar;
    }

    private <A extends Api.zzb> void zzd(zzqo.zza<? extends Result, A> zzaVar) throws DeadObjectException {
        this.zA.yW.Ap.zzb(zzaVar);
        Api.zze zzb = this.zA.yW.zzb((Api.zzc<?>) zzaVar.zzaqv());
        if (!zzb.isConnected() && this.zA.Ay.containsKey(zzaVar.zzaqv())) {
            zzaVar.zzaa(new Status(17));
            return;
        }
        boolean z = zzb instanceof com.google.android.gms.common.internal.zzag;
        Api.zzg zzgVar = zzb;
        if (z) {
            zzgVar = ((com.google.android.gms.common.internal.zzag) zzb).zzawt();
        }
        zzaVar.zzb((zzqo.zza<? extends Result, A>) zzgVar);
    }

    @Override // com.google.android.gms.internal.zzre
    public void begin() {
    }

    @Override // com.google.android.gms.internal.zzre
    public void connect() {
        if (this.zB) {
            this.zB = false;
            this.zA.zza(new zzrf.zza(this) { // from class: com.google.android.gms.internal.zzra.2
                @Override // com.google.android.gms.internal.zzrf.zza
                public void zzaso() {
                    zzra.this.zA.AC.zzn(null);
                }
            });
        }
    }

    @Override // com.google.android.gms.internal.zzre
    public boolean disconnect() {
        if (this.zB) {
            return false;
        }
        if (!this.zA.yW.zzata()) {
            this.zA.zzh(null);
            return true;
        }
        this.zB = true;
        for (zzsf zzsfVar : this.zA.yW.Ao) {
            zzsfVar.zzaud();
        }
        return false;
    }

    @Override // com.google.android.gms.internal.zzre
    public void onConnected(Bundle bundle) {
    }

    @Override // com.google.android.gms.internal.zzre
    public void onConnectionSuspended(int i) {
        this.zA.zzh(null);
        this.zA.AC.zzc(i, this.zB);
    }

    @Override // com.google.android.gms.internal.zzre
    public <A extends Api.zzb, R extends Result, T extends zzqo.zza<R, A>> T zza(T t) {
        return (T) zzb(t);
    }

    @Override // com.google.android.gms.internal.zzre
    public void zza(ConnectionResult connectionResult, Api<?> api, int i) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzasn() {
        if (this.zB) {
            this.zB = false;
            this.zA.yW.Ap.release();
            disconnect();
        }
    }

    @Override // com.google.android.gms.internal.zzre
    public <A extends Api.zzb, T extends zzqo.zza<? extends Result, A>> T zzb(T t) {
        try {
            zzd(t);
        } catch (DeadObjectException e) {
            this.zA.zza(new zzrf.zza(this) { // from class: com.google.android.gms.internal.zzra.1
                @Override // com.google.android.gms.internal.zzrf.zza
                public void zzaso() {
                    zzra.this.onConnectionSuspended(1);
                }
            });
        }
        return t;
    }
}
