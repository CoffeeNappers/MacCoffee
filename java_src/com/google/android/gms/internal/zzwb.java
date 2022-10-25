package com.google.android.gms.internal;

import com.google.android.gms.internal.zzwa;
import java.io.IOException;
/* loaded from: classes2.dex */
public interface zzwb {

    /* loaded from: classes2.dex */
    public static final class zza extends zzasa {
        private static volatile zza[] awz;
        public Boolean awA;
        public Boolean awB;
        public String name;

        public zza() {
            zzbzs();
        }

        public static zza[] zzbzr() {
            if (awz == null) {
                synchronized (zzary.btO) {
                    if (awz == null) {
                        awz = new zza[0];
                    }
                }
            }
            return awz;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zza)) {
                return false;
            }
            zza zzaVar = (zza) obj;
            if (this.name == null) {
                if (zzaVar.name != null) {
                    return false;
                }
            } else if (!this.name.equals(zzaVar.name)) {
                return false;
            }
            if (this.awA == null) {
                if (zzaVar.awA != null) {
                    return false;
                }
            } else if (!this.awA.equals(zzaVar.awA)) {
                return false;
            }
            return this.awB == null ? zzaVar.awB == null : this.awB.equals(zzaVar.awB);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.awA == null ? 0 : this.awA.hashCode()) + (((this.name == null ? 0 : this.name.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31;
            if (this.awB != null) {
                i = this.awB.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.name != null) {
                zzartVar.zzq(1, this.name);
            }
            if (this.awA != null) {
                zzartVar.zzg(2, this.awA.booleanValue());
            }
            if (this.awB != null) {
                zzartVar.zzg(3, this.awB.booleanValue());
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzam */
        public zza zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.name = zzarsVar.readString();
                        break;
                    case 16:
                        this.awA = Boolean.valueOf(zzarsVar.ca());
                        break;
                    case 24:
                        this.awB = Boolean.valueOf(zzarsVar.ca());
                        break;
                    default:
                        if (zzasd.zzb(zzarsVar, bU)) {
                            break;
                        } else {
                            break;
                        }
                }
            }
            return this;
        }

        public zza zzbzs() {
            this.name = null;
            this.awA = null;
            this.awB = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.name != null) {
                zzx += zzart.zzr(1, this.name);
            }
            if (this.awA != null) {
                zzx += zzart.zzh(2, this.awA.booleanValue());
            }
            return this.awB != null ? zzx + zzart.zzh(3, this.awB.booleanValue()) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzb extends zzasa {
        public String aqZ;
        public Long awC;
        public Integer awD;
        public zzc[] awE;
        public zza[] awF;
        public zzwa.zza[] awG;

        public zzb() {
            zzbzt();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzb)) {
                return false;
            }
            zzb zzbVar = (zzb) obj;
            if (this.awC == null) {
                if (zzbVar.awC != null) {
                    return false;
                }
            } else if (!this.awC.equals(zzbVar.awC)) {
                return false;
            }
            if (this.aqZ == null) {
                if (zzbVar.aqZ != null) {
                    return false;
                }
            } else if (!this.aqZ.equals(zzbVar.aqZ)) {
                return false;
            }
            if (this.awD == null) {
                if (zzbVar.awD != null) {
                    return false;
                }
            } else if (!this.awD.equals(zzbVar.awD)) {
                return false;
            }
            return zzary.equals(this.awE, zzbVar.awE) && zzary.equals(this.awF, zzbVar.awF) && zzary.equals(this.awG, zzbVar.awG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.aqZ == null ? 0 : this.aqZ.hashCode()) + (((this.awC == null ? 0 : this.awC.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31;
            if (this.awD != null) {
                i = this.awD.hashCode();
            }
            return ((((((hashCode + i) * 31) + zzary.hashCode(this.awE)) * 31) + zzary.hashCode(this.awF)) * 31) + zzary.hashCode(this.awG);
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.awC != null) {
                zzartVar.zzb(1, this.awC.longValue());
            }
            if (this.aqZ != null) {
                zzartVar.zzq(2, this.aqZ);
            }
            if (this.awD != null) {
                zzartVar.zzaf(3, this.awD.intValue());
            }
            if (this.awE != null && this.awE.length > 0) {
                for (int i = 0; i < this.awE.length; i++) {
                    zzc zzcVar = this.awE[i];
                    if (zzcVar != null) {
                        zzartVar.zza(4, zzcVar);
                    }
                }
            }
            if (this.awF != null && this.awF.length > 0) {
                for (int i2 = 0; i2 < this.awF.length; i2++) {
                    zza zzaVar = this.awF[i2];
                    if (zzaVar != null) {
                        zzartVar.zza(5, zzaVar);
                    }
                }
            }
            if (this.awG != null && this.awG.length > 0) {
                for (int i3 = 0; i3 < this.awG.length; i3++) {
                    zzwa.zza zzaVar2 = this.awG[i3];
                    if (zzaVar2 != null) {
                        zzartVar.zza(6, zzaVar2);
                    }
                }
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzan */
        public zzb zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.awC = Long.valueOf(zzarsVar.bX());
                        break;
                    case 18:
                        this.aqZ = zzarsVar.readString();
                        break;
                    case 24:
                        this.awD = Integer.valueOf(zzarsVar.bY());
                        break;
                    case 34:
                        int zzc = zzasd.zzc(zzarsVar, 34);
                        int length = this.awE == null ? 0 : this.awE.length;
                        zzc[] zzcVarArr = new zzc[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.awE, 0, zzcVarArr, 0, length);
                        }
                        while (length < zzcVarArr.length - 1) {
                            zzcVarArr[length] = new zzc();
                            zzarsVar.zza(zzcVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzcVarArr[length] = new zzc();
                        zzarsVar.zza(zzcVarArr[length]);
                        this.awE = zzcVarArr;
                        break;
                    case 42:
                        int zzc2 = zzasd.zzc(zzarsVar, 42);
                        int length2 = this.awF == null ? 0 : this.awF.length;
                        zza[] zzaVarArr = new zza[zzc2 + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.awF, 0, zzaVarArr, 0, length2);
                        }
                        while (length2 < zzaVarArr.length - 1) {
                            zzaVarArr[length2] = new zza();
                            zzarsVar.zza(zzaVarArr[length2]);
                            zzarsVar.bU();
                            length2++;
                        }
                        zzaVarArr[length2] = new zza();
                        zzarsVar.zza(zzaVarArr[length2]);
                        this.awF = zzaVarArr;
                        break;
                    case 50:
                        int zzc3 = zzasd.zzc(zzarsVar, 50);
                        int length3 = this.awG == null ? 0 : this.awG.length;
                        zzwa.zza[] zzaVarArr2 = new zzwa.zza[zzc3 + length3];
                        if (length3 != 0) {
                            System.arraycopy(this.awG, 0, zzaVarArr2, 0, length3);
                        }
                        while (length3 < zzaVarArr2.length - 1) {
                            zzaVarArr2[length3] = new zzwa.zza();
                            zzarsVar.zza(zzaVarArr2[length3]);
                            zzarsVar.bU();
                            length3++;
                        }
                        zzaVarArr2[length3] = new zzwa.zza();
                        zzarsVar.zza(zzaVarArr2[length3]);
                        this.awG = zzaVarArr2;
                        break;
                    default:
                        if (zzasd.zzb(zzarsVar, bU)) {
                            break;
                        } else {
                            break;
                        }
                }
            }
            return this;
        }

        public zzb zzbzt() {
            this.awC = null;
            this.aqZ = null;
            this.awD = null;
            this.awE = zzc.zzbzu();
            this.awF = zza.zzbzr();
            this.awG = zzwa.zza.zzbzh();
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.awC != null) {
                zzx += zzart.zzf(1, this.awC.longValue());
            }
            if (this.aqZ != null) {
                zzx += zzart.zzr(2, this.aqZ);
            }
            if (this.awD != null) {
                zzx += zzart.zzah(3, this.awD.intValue());
            }
            if (this.awE != null && this.awE.length > 0) {
                int i = zzx;
                for (int i2 = 0; i2 < this.awE.length; i2++) {
                    zzc zzcVar = this.awE[i2];
                    if (zzcVar != null) {
                        i += zzart.zzc(4, zzcVar);
                    }
                }
                zzx = i;
            }
            if (this.awF != null && this.awF.length > 0) {
                int i3 = zzx;
                for (int i4 = 0; i4 < this.awF.length; i4++) {
                    zza zzaVar = this.awF[i4];
                    if (zzaVar != null) {
                        i3 += zzart.zzc(5, zzaVar);
                    }
                }
                zzx = i3;
            }
            if (this.awG != null && this.awG.length > 0) {
                for (int i5 = 0; i5 < this.awG.length; i5++) {
                    zzwa.zza zzaVar2 = this.awG[i5];
                    if (zzaVar2 != null) {
                        zzx += zzart.zzc(6, zzaVar2);
                    }
                }
            }
            return zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzc extends zzasa {
        private static volatile zzc[] awH;
        public String value;
        public String zzcb;

        public zzc() {
            zzbzv();
        }

        public static zzc[] zzbzu() {
            if (awH == null) {
                synchronized (zzary.btO) {
                    if (awH == null) {
                        awH = new zzc[0];
                    }
                }
            }
            return awH;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzc)) {
                return false;
            }
            zzc zzcVar = (zzc) obj;
            if (this.zzcb == null) {
                if (zzcVar.zzcb != null) {
                    return false;
                }
            } else if (!this.zzcb.equals(zzcVar.zzcb)) {
                return false;
            }
            return this.value == null ? zzcVar.value == null : this.value.equals(zzcVar.value);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.zzcb == null ? 0 : this.zzcb.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31;
            if (this.value != null) {
                i = this.value.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzcb != null) {
                zzartVar.zzq(1, this.zzcb);
            }
            if (this.value != null) {
                zzartVar.zzq(2, this.value);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzao */
        public zzc zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.zzcb = zzarsVar.readString();
                        break;
                    case 18:
                        this.value = zzarsVar.readString();
                        break;
                    default:
                        if (zzasd.zzb(zzarsVar, bU)) {
                            break;
                        } else {
                            break;
                        }
                }
            }
            return this;
        }

        public zzc zzbzv() {
            this.zzcb = null;
            this.value = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.zzcb != null) {
                zzx += zzart.zzr(1, this.zzcb);
            }
            return this.value != null ? zzx + zzart.zzr(2, this.value) : zzx;
        }
    }
}
