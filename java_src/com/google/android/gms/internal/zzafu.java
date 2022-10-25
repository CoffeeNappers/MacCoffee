package com.google.android.gms.internal;

import com.google.android.gms.internal.zzai;
import java.io.IOException;
/* loaded from: classes2.dex */
public interface zzafu {

    /* loaded from: classes2.dex */
    public static final class zza extends zzaru<zza> {
        public long aMu;
        public zzai.zzj aMv;
        public zzai.zzf zzxv;

        public zza() {
            zzckt();
        }

        public static zza zzap(byte[] bArr) throws zzarz {
            return (zza) zzasa.zza(new zza(), bArr);
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zza)) {
                return false;
            }
            zza zzaVar = (zza) obj;
            if (this.aMu != zzaVar.aMu) {
                return false;
            }
            if (this.zzxv == null) {
                if (zzaVar.zzxv != null) {
                    return false;
                }
            } else if (!this.zzxv.equals(zzaVar.zzxv)) {
                return false;
            }
            if (this.aMv == null) {
                if (zzaVar.aMv != null) {
                    return false;
                }
            } else if (!this.aMv.equals(zzaVar.aMv)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzaVar.btG == null || zzaVar.btG.isEmpty() : this.btG.equals(zzaVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.aMv == null ? 0 : this.aMv.hashCode()) + (((this.zzxv == null ? 0 : this.zzxv.hashCode()) + ((((getClass().getName().hashCode() + 527) * 31) + ((int) (this.aMu ^ (this.aMu >>> 32)))) * 31)) * 31)) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            zzartVar.zzb(1, this.aMu);
            if (this.zzxv != null) {
                zzartVar.zza(2, this.zzxv);
            }
            if (this.aMv != null) {
                zzartVar.zza(3, this.aMv);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzaw */
        public zza zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.aMu = zzarsVar.bX();
                        break;
                    case 18:
                        if (this.zzxv == null) {
                            this.zzxv = new zzai.zzf();
                        }
                        zzarsVar.zza(this.zzxv);
                        break;
                    case 26:
                        if (this.aMv == null) {
                            this.aMv = new zzai.zzj();
                        }
                        zzarsVar.zza(this.aMv);
                        break;
                    default:
                        if (super.zza(zzarsVar, bU)) {
                            break;
                        } else {
                            break;
                        }
                }
            }
            return this;
        }

        public zza zzckt() {
            this.aMu = 0L;
            this.zzxv = null;
            this.aMv = null;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx() + zzart.zzf(1, this.aMu);
            if (this.zzxv != null) {
                zzx += zzart.zzc(2, this.zzxv);
            }
            return this.aMv != null ? zzx + zzart.zzc(3, this.aMv) : zzx;
        }
    }
}
