package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaru;
import java.io.IOException;
/* loaded from: classes2.dex */
public abstract class zzaru<M extends zzaru<M>> extends zzasa {
    protected zzarw btG;

    @Override // com.google.android.gms.internal.zzasa
    /* renamed from: cn */
    public M clone() throws CloneNotSupportedException {
        M m = (M) super.clone();
        zzary.zza(this, m);
        return m;
    }

    @Override // com.google.android.gms.internal.zzasa
    public /* synthetic */ zzasa co() throws CloneNotSupportedException {
        return (zzaru) clone();
    }

    public final <T> T zza(zzarv<M, T> zzarvVar) {
        zzarx zzahh;
        if (this.btG == null || (zzahh = this.btG.zzahh(zzasd.zzahl(zzarvVar.tag))) == null) {
            return null;
        }
        return (T) zzahh.zzb(zzarvVar);
    }

    @Override // com.google.android.gms.internal.zzasa
    public void zza(zzart zzartVar) throws IOException {
        if (this.btG == null) {
            return;
        }
        for (int i = 0; i < this.btG.size(); i++) {
            this.btG.zzahi(i).zza(zzartVar);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final boolean zza(zzars zzarsVar, int i) throws IOException {
        int position = zzarsVar.getPosition();
        if (!zzarsVar.zzagr(i)) {
            return false;
        }
        int zzahl = zzasd.zzahl(i);
        zzasc zzascVar = new zzasc(i, zzarsVar.zzae(position, zzarsVar.getPosition() - position));
        zzarx zzarxVar = null;
        if (this.btG == null) {
            this.btG = new zzarw();
        } else {
            zzarxVar = this.btG.zzahh(zzahl);
        }
        if (zzarxVar == null) {
            zzarxVar = new zzarx();
            this.btG.zza(zzahl, zzarxVar);
        }
        zzarxVar.zza(zzascVar);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.zzasa
    public int zzx() {
        if (this.btG != null) {
            int i = 0;
            for (int i2 = 0; i2 < this.btG.size(); i2++) {
                i += this.btG.zzahi(i2).zzx();
            }
            return i;
        }
        return 0;
    }
}
