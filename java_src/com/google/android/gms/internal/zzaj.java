package com.google.android.gms.internal;

import java.io.IOException;
/* loaded from: classes2.dex */
public interface zzaj {

    /* loaded from: classes2.dex */
    public static final class zza extends zzaru<zza> {
        private static volatile zza[] zzxx;
        public String string;
        public int type;
        public zza[] zzxy;
        public zza[] zzxz;
        public zza[] zzya;
        public String zzyb;
        public String zzyc;
        public long zzyd;
        public boolean zzye;
        public zza[] zzyf;
        public int[] zzyg;
        public boolean zzyh;

        public zza() {
            zzas();
        }

        public static zza[] zzar() {
            if (zzxx == null) {
                synchronized (zzary.btO) {
                    if (zzxx == null) {
                        zzxx = new zza[0];
                    }
                }
            }
            return zzxx;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zza)) {
                return false;
            }
            zza zzaVar = (zza) obj;
            if (this.type != zzaVar.type) {
                return false;
            }
            if (this.string == null) {
                if (zzaVar.string != null) {
                    return false;
                }
            } else if (!this.string.equals(zzaVar.string)) {
                return false;
            }
            if (!zzary.equals(this.zzxy, zzaVar.zzxy) || !zzary.equals(this.zzxz, zzaVar.zzxz) || !zzary.equals(this.zzya, zzaVar.zzya)) {
                return false;
            }
            if (this.zzyb == null) {
                if (zzaVar.zzyb != null) {
                    return false;
                }
            } else if (!this.zzyb.equals(zzaVar.zzyb)) {
                return false;
            }
            if (this.zzyc == null) {
                if (zzaVar.zzyc != null) {
                    return false;
                }
            } else if (!this.zzyc.equals(zzaVar.zzyc)) {
                return false;
            }
            if (this.zzyd != zzaVar.zzyd || this.zzye != zzaVar.zzye || !zzary.equals(this.zzyf, zzaVar.zzyf) || !zzary.equals(this.zzyg, zzaVar.zzyg) || this.zzyh != zzaVar.zzyh) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzaVar.btG == null || zzaVar.btG.isEmpty() : this.btG.equals(zzaVar.btG);
        }

        public int hashCode() {
            int i = 1231;
            int i2 = 0;
            int hashCode = ((((((this.zzye ? 1231 : 1237) + (((((this.zzyc == null ? 0 : this.zzyc.hashCode()) + (((this.zzyb == null ? 0 : this.zzyb.hashCode()) + (((((((((this.string == null ? 0 : this.string.hashCode()) + ((((getClass().getName().hashCode() + 527) * 31) + this.type) * 31)) * 31) + zzary.hashCode(this.zzxy)) * 31) + zzary.hashCode(this.zzxz)) * 31) + zzary.hashCode(this.zzya)) * 31)) * 31)) * 31) + ((int) (this.zzyd ^ (this.zzyd >>> 32)))) * 31)) * 31) + zzary.hashCode(this.zzyf)) * 31) + zzary.hashCode(this.zzyg)) * 31;
            if (!this.zzyh) {
                i = 1237;
            }
            int i3 = (hashCode + i) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i2 = this.btG.hashCode();
            }
            return i3 + i2;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            zzartVar.zzaf(1, this.type);
            if (this.string != null && !this.string.equals("")) {
                zzartVar.zzq(2, this.string);
            }
            if (this.zzxy != null && this.zzxy.length > 0) {
                for (int i = 0; i < this.zzxy.length; i++) {
                    zza zzaVar = this.zzxy[i];
                    if (zzaVar != null) {
                        zzartVar.zza(3, zzaVar);
                    }
                }
            }
            if (this.zzxz != null && this.zzxz.length > 0) {
                for (int i2 = 0; i2 < this.zzxz.length; i2++) {
                    zza zzaVar2 = this.zzxz[i2];
                    if (zzaVar2 != null) {
                        zzartVar.zza(4, zzaVar2);
                    }
                }
            }
            if (this.zzya != null && this.zzya.length > 0) {
                for (int i3 = 0; i3 < this.zzya.length; i3++) {
                    zza zzaVar3 = this.zzya[i3];
                    if (zzaVar3 != null) {
                        zzartVar.zza(5, zzaVar3);
                    }
                }
            }
            if (this.zzyb != null && !this.zzyb.equals("")) {
                zzartVar.zzq(6, this.zzyb);
            }
            if (this.zzyc != null && !this.zzyc.equals("")) {
                zzartVar.zzq(7, this.zzyc);
            }
            if (this.zzyd != 0) {
                zzartVar.zzb(8, this.zzyd);
            }
            if (this.zzyh) {
                zzartVar.zzg(9, this.zzyh);
            }
            if (this.zzyg != null && this.zzyg.length > 0) {
                for (int i4 = 0; i4 < this.zzyg.length; i4++) {
                    zzartVar.zzaf(10, this.zzyg[i4]);
                }
            }
            if (this.zzyf != null && this.zzyf.length > 0) {
                for (int i5 = 0; i5 < this.zzyf.length; i5++) {
                    zza zzaVar4 = this.zzyf[i5];
                    if (zzaVar4 != null) {
                        zzartVar.zza(11, zzaVar4);
                    }
                }
            }
            if (this.zzye) {
                zzartVar.zzg(12, this.zzye);
            }
            super.zza(zzartVar);
        }

        public zza zzas() {
            this.type = 1;
            this.string = "";
            this.zzxy = zzar();
            this.zzxz = zzar();
            this.zzya = zzar();
            this.zzyb = "";
            this.zzyc = "";
            this.zzyd = 0L;
            this.zzye = false;
            this.zzyf = zzar();
            this.zzyg = zzasd.btR;
            this.zzyh = false;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        protected int zzx() {
            int zzx = super.zzx() + zzart.zzah(1, this.type);
            if (this.string != null && !this.string.equals("")) {
                zzx += zzart.zzr(2, this.string);
            }
            if (this.zzxy != null && this.zzxy.length > 0) {
                int i = zzx;
                for (int i2 = 0; i2 < this.zzxy.length; i2++) {
                    zza zzaVar = this.zzxy[i2];
                    if (zzaVar != null) {
                        i += zzart.zzc(3, zzaVar);
                    }
                }
                zzx = i;
            }
            if (this.zzxz != null && this.zzxz.length > 0) {
                int i3 = zzx;
                for (int i4 = 0; i4 < this.zzxz.length; i4++) {
                    zza zzaVar2 = this.zzxz[i4];
                    if (zzaVar2 != null) {
                        i3 += zzart.zzc(4, zzaVar2);
                    }
                }
                zzx = i3;
            }
            if (this.zzya != null && this.zzya.length > 0) {
                int i5 = zzx;
                for (int i6 = 0; i6 < this.zzya.length; i6++) {
                    zza zzaVar3 = this.zzya[i6];
                    if (zzaVar3 != null) {
                        i5 += zzart.zzc(5, zzaVar3);
                    }
                }
                zzx = i5;
            }
            if (this.zzyb != null && !this.zzyb.equals("")) {
                zzx += zzart.zzr(6, this.zzyb);
            }
            if (this.zzyc != null && !this.zzyc.equals("")) {
                zzx += zzart.zzr(7, this.zzyc);
            }
            if (this.zzyd != 0) {
                zzx += zzart.zzf(8, this.zzyd);
            }
            if (this.zzyh) {
                zzx += zzart.zzh(9, this.zzyh);
            }
            if (this.zzyg != null && this.zzyg.length > 0) {
                int i7 = 0;
                for (int i8 = 0; i8 < this.zzyg.length; i8++) {
                    i7 += zzart.zzagz(this.zzyg[i8]);
                }
                zzx = zzx + i7 + (this.zzyg.length * 1);
            }
            if (this.zzyf != null && this.zzyf.length > 0) {
                for (int i9 = 0; i9 < this.zzyf.length; i9++) {
                    zza zzaVar4 = this.zzyf[i9];
                    if (zzaVar4 != null) {
                        zzx += zzart.zzc(11, zzaVar4);
                    }
                }
            }
            return this.zzye ? zzx + zzart.zzh(12, this.zzye) : zzx;
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzx */
        public zza zzb(zzars zzarsVar) throws IOException {
            int i;
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        int bY = zzarsVar.bY();
                        switch (bY) {
                            case 1:
                            case 2:
                            case 3:
                            case 4:
                            case 5:
                            case 6:
                            case 7:
                            case 8:
                                this.type = bY;
                                continue;
                        }
                    case 18:
                        this.string = zzarsVar.readString();
                        break;
                    case 26:
                        int zzc = zzasd.zzc(zzarsVar, 26);
                        int length = this.zzxy == null ? 0 : this.zzxy.length;
                        zza[] zzaVarArr = new zza[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.zzxy, 0, zzaVarArr, 0, length);
                        }
                        while (length < zzaVarArr.length - 1) {
                            zzaVarArr[length] = new zza();
                            zzarsVar.zza(zzaVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzaVarArr[length] = new zza();
                        zzarsVar.zza(zzaVarArr[length]);
                        this.zzxy = zzaVarArr;
                        break;
                    case 34:
                        int zzc2 = zzasd.zzc(zzarsVar, 34);
                        int length2 = this.zzxz == null ? 0 : this.zzxz.length;
                        zza[] zzaVarArr2 = new zza[zzc2 + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.zzxz, 0, zzaVarArr2, 0, length2);
                        }
                        while (length2 < zzaVarArr2.length - 1) {
                            zzaVarArr2[length2] = new zza();
                            zzarsVar.zza(zzaVarArr2[length2]);
                            zzarsVar.bU();
                            length2++;
                        }
                        zzaVarArr2[length2] = new zza();
                        zzarsVar.zza(zzaVarArr2[length2]);
                        this.zzxz = zzaVarArr2;
                        break;
                    case 42:
                        int zzc3 = zzasd.zzc(zzarsVar, 42);
                        int length3 = this.zzya == null ? 0 : this.zzya.length;
                        zza[] zzaVarArr3 = new zza[zzc3 + length3];
                        if (length3 != 0) {
                            System.arraycopy(this.zzya, 0, zzaVarArr3, 0, length3);
                        }
                        while (length3 < zzaVarArr3.length - 1) {
                            zzaVarArr3[length3] = new zza();
                            zzarsVar.zza(zzaVarArr3[length3]);
                            zzarsVar.bU();
                            length3++;
                        }
                        zzaVarArr3[length3] = new zza();
                        zzarsVar.zza(zzaVarArr3[length3]);
                        this.zzya = zzaVarArr3;
                        break;
                    case 50:
                        this.zzyb = zzarsVar.readString();
                        break;
                    case 58:
                        this.zzyc = zzarsVar.readString();
                        break;
                    case 64:
                        this.zzyd = zzarsVar.bX();
                        break;
                    case 72:
                        this.zzyh = zzarsVar.ca();
                        break;
                    case 80:
                        int zzc4 = zzasd.zzc(zzarsVar, 80);
                        int[] iArr = new int[zzc4];
                        int i2 = 0;
                        int i3 = 0;
                        while (i2 < zzc4) {
                            if (i2 != 0) {
                                zzarsVar.bU();
                            }
                            int bY2 = zzarsVar.bY();
                            switch (bY2) {
                                case 1:
                                case 2:
                                case 3:
                                case 4:
                                case 5:
                                case 6:
                                case 7:
                                case 8:
                                case 9:
                                case 10:
                                case 11:
                                case 12:
                                case 13:
                                case 14:
                                case 15:
                                case 16:
                                case 17:
                                    i = i3 + 1;
                                    iArr[i3] = bY2;
                                    break;
                                default:
                                    i = i3;
                                    break;
                            }
                            i2++;
                            i3 = i;
                        }
                        if (i3 != 0) {
                            int length4 = this.zzyg == null ? 0 : this.zzyg.length;
                            if (length4 != 0 || i3 != iArr.length) {
                                int[] iArr2 = new int[length4 + i3];
                                if (length4 != 0) {
                                    System.arraycopy(this.zzyg, 0, iArr2, 0, length4);
                                }
                                System.arraycopy(iArr, 0, iArr2, length4, i3);
                                this.zzyg = iArr2;
                                break;
                            } else {
                                this.zzyg = iArr;
                                break;
                            }
                        } else {
                            break;
                        }
                    case 82:
                        int zzagt = zzarsVar.zzagt(zzarsVar.cd());
                        int position = zzarsVar.getPosition();
                        int i4 = 0;
                        while (zzarsVar.ci() > 0) {
                            switch (zzarsVar.bY()) {
                                case 1:
                                case 2:
                                case 3:
                                case 4:
                                case 5:
                                case 6:
                                case 7:
                                case 8:
                                case 9:
                                case 10:
                                case 11:
                                case 12:
                                case 13:
                                case 14:
                                case 15:
                                case 16:
                                case 17:
                                    i4++;
                                    break;
                            }
                        }
                        if (i4 != 0) {
                            zzarsVar.zzagv(position);
                            int length5 = this.zzyg == null ? 0 : this.zzyg.length;
                            int[] iArr3 = new int[i4 + length5];
                            if (length5 != 0) {
                                System.arraycopy(this.zzyg, 0, iArr3, 0, length5);
                            }
                            while (zzarsVar.ci() > 0) {
                                int bY3 = zzarsVar.bY();
                                switch (bY3) {
                                    case 1:
                                    case 2:
                                    case 3:
                                    case 4:
                                    case 5:
                                    case 6:
                                    case 7:
                                    case 8:
                                    case 9:
                                    case 10:
                                    case 11:
                                    case 12:
                                    case 13:
                                    case 14:
                                    case 15:
                                    case 16:
                                    case 17:
                                        iArr3[length5] = bY3;
                                        length5++;
                                        break;
                                }
                            }
                            this.zzyg = iArr3;
                        }
                        zzarsVar.zzagu(zzagt);
                        break;
                    case 90:
                        int zzc5 = zzasd.zzc(zzarsVar, 90);
                        int length6 = this.zzyf == null ? 0 : this.zzyf.length;
                        zza[] zzaVarArr4 = new zza[zzc5 + length6];
                        if (length6 != 0) {
                            System.arraycopy(this.zzyf, 0, zzaVarArr4, 0, length6);
                        }
                        while (length6 < zzaVarArr4.length - 1) {
                            zzaVarArr4[length6] = new zza();
                            zzarsVar.zza(zzaVarArr4[length6]);
                            zzarsVar.bU();
                            length6++;
                        }
                        zzaVarArr4[length6] = new zza();
                        zzarsVar.zza(zzaVarArr4[length6]);
                        this.zzyf = zzaVarArr4;
                        break;
                    case 96:
                        this.zzye = zzarsVar.ca();
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
    }
}
