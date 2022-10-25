package com.google.android.gms.internal;

import java.io.IOException;
/* loaded from: classes2.dex */
public abstract class zzasa {
    protected volatile int btP = -1;

    public static final <T extends zzasa> T zza(T t, byte[] bArr) throws zzarz {
        return (T) zzb(t, bArr, 0, bArr.length);
    }

    public static final void zza(zzasa zzasaVar, byte[] bArr, int i, int i2) {
        try {
            zzart zzc = zzart.zzc(bArr, i, i2);
            zzasaVar.zza(zzc);
            zzc.cm();
        } catch (IOException e) {
            throw new RuntimeException("Serializing to a byte array threw an IOException (should never happen).", e);
        }
    }

    public static final <T extends zzasa> T zzb(T t, byte[] bArr, int i, int i2) throws zzarz {
        try {
            zzars zzb = zzars.zzb(bArr, i, i2);
            t.zzb(zzb);
            zzb.zzagq(0);
            return t;
        } catch (zzarz e) {
            throw e;
        } catch (IOException e2) {
            throw new RuntimeException("Reading from a byte array threw an IOException (should never happen).");
        }
    }

    public static final byte[] zzf(zzasa zzasaVar) {
        byte[] bArr = new byte[zzasaVar.cz()];
        zza(zzasaVar, bArr, 0, bArr.length);
        return bArr;
    }

    @Override // 
    /* renamed from: co */
    public zzasa clone() throws CloneNotSupportedException {
        return (zzasa) super.clone();
    }

    public int cy() {
        if (this.btP < 0) {
            cz();
        }
        return this.btP;
    }

    public int cz() {
        int zzx = zzx();
        this.btP = zzx;
        return zzx;
    }

    public String toString() {
        return zzasb.zzg(this);
    }

    public void zza(zzart zzartVar) throws IOException {
    }

    public abstract zzasa zzb(zzars zzarsVar) throws IOException;

    /* JADX INFO: Access modifiers changed from: protected */
    public int zzx() {
        return 0;
    }
}
