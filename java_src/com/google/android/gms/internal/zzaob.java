package com.google.android.gms.internal;

import java.io.IOException;
import java.util.Arrays;
/* loaded from: classes2.dex */
public interface zzaob {

    /* loaded from: classes2.dex */
    public static final class zza extends zzaru<zza> {
        public zzd[] blC;
        public long timestamp;

        public zza() {
            aa();
        }

        public zza aa() {
            this.blC = zzd.ae();
            this.timestamp = 0L;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zza)) {
                return false;
            }
            zza zzaVar = (zza) obj;
            if (!zzary.equals(this.blC, zzaVar.blC) || this.timestamp != zzaVar.timestamp) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzaVar.btG == null || zzaVar.btG.isEmpty() : this.btG.equals(zzaVar.btG);
        }

        public int hashCode() {
            return ((this.btG == null || this.btG.isEmpty()) ? 0 : this.btG.hashCode()) + ((((((getClass().getName().hashCode() + 527) * 31) + zzary.hashCode(this.blC)) * 31) + ((int) (this.timestamp ^ (this.timestamp >>> 32)))) * 31);
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.blC != null && this.blC.length > 0) {
                for (int i = 0; i < this.blC.length; i++) {
                    zzd zzdVar = this.blC[i];
                    if (zzdVar != null) {
                        zzartVar.zza(1, zzdVar);
                    }
                }
            }
            if (this.timestamp != 0) {
                zzartVar.zzc(2, this.timestamp);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzbc */
        public zza zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        int zzc = zzasd.zzc(zzarsVar, 10);
                        int length = this.blC == null ? 0 : this.blC.length;
                        zzd[] zzdVarArr = new zzd[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.blC, 0, zzdVarArr, 0, length);
                        }
                        while (length < zzdVarArr.length - 1) {
                            zzdVarArr[length] = new zzd();
                            zzarsVar.zza(zzdVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzdVarArr[length] = new zzd();
                        zzarsVar.zza(zzdVarArr[length]);
                        this.blC = zzdVarArr;
                        break;
                    case 17:
                        this.timestamp = zzarsVar.bZ();
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

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.blC != null && this.blC.length > 0) {
                for (int i = 0; i < this.blC.length; i++) {
                    zzd zzdVar = this.blC[i];
                    if (zzdVar != null) {
                        zzx += zzart.zzc(1, zzdVar);
                    }
                }
            }
            return this.timestamp != 0 ? zzx + zzart.zzg(2, this.timestamp) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzb extends zzaru<zzb> {
        private static volatile zzb[] blD;
        public byte[] blE;
        public String zzcb;

        public zzb() {
            ac();
        }

        public static zzb[] ab() {
            if (blD == null) {
                synchronized (zzary.btO) {
                    if (blD == null) {
                        blD = new zzb[0];
                    }
                }
            }
            return blD;
        }

        public zzb ac() {
            this.zzcb = "";
            this.blE = zzasd.btY;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzb)) {
                return false;
            }
            zzb zzbVar = (zzb) obj;
            if (this.zzcb == null) {
                if (zzbVar.zzcb != null) {
                    return false;
                }
            } else if (!this.zzcb.equals(zzbVar.zzcb)) {
                return false;
            }
            if (!Arrays.equals(this.blE, zzbVar.blE)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzbVar.btG == null || zzbVar.btG.isEmpty() : this.btG.equals(zzbVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((((this.zzcb == null ? 0 : this.zzcb.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31) + Arrays.hashCode(this.blE)) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzcb != null && !this.zzcb.equals("")) {
                zzartVar.zzq(1, this.zzcb);
            }
            if (!Arrays.equals(this.blE, zzasd.btY)) {
                zzartVar.zzb(2, this.blE);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzbd */
        public zzb zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.zzcb = zzarsVar.readString();
                        break;
                    case 18:
                        this.blE = zzarsVar.readBytes();
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

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.zzcb != null && !this.zzcb.equals("")) {
                zzx += zzart.zzr(1, this.zzcb);
            }
            return !Arrays.equals(this.blE, zzasd.btY) ? zzx + zzart.zzc(2, this.blE) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzc extends zzaru<zzc> {
        public int blF;
        public boolean blG;

        public zzc() {
            ad();
        }

        public zzc ad() {
            this.blF = 0;
            this.blG = false;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzc)) {
                return false;
            }
            zzc zzcVar = (zzc) obj;
            if (this.blF != zzcVar.blF || this.blG != zzcVar.blG) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzcVar.btG == null || zzcVar.btG.isEmpty() : this.btG.equals(zzcVar.btG);
        }

        public int hashCode() {
            return ((this.btG == null || this.btG.isEmpty()) ? 0 : this.btG.hashCode()) + (((this.blG ? 1231 : 1237) + ((((getClass().getName().hashCode() + 527) * 31) + this.blF) * 31)) * 31);
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.blF != 0) {
                zzartVar.zzaf(1, this.blF);
            }
            if (this.blG) {
                zzartVar.zzg(2, this.blG);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzbe */
        public zzc zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.blF = zzarsVar.bY();
                        break;
                    case 16:
                        this.blG = zzarsVar.ca();
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

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.blF != 0) {
                zzx += zzart.zzah(1, this.blF);
            }
            return this.blG ? zzx + zzart.zzh(2, this.blG) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzd extends zzaru<zzd> {
        private static volatile zzd[] blH;
        public String EY;
        public zzb[] blI;

        public zzd() {
            af();
        }

        public static zzd[] ae() {
            if (blH == null) {
                synchronized (zzary.btO) {
                    if (blH == null) {
                        blH = new zzd[0];
                    }
                }
            }
            return blH;
        }

        public zzd af() {
            this.EY = "";
            this.blI = zzb.ab();
            this.btG = null;
            this.btP = -1;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzd)) {
                return false;
            }
            zzd zzdVar = (zzd) obj;
            if (this.EY == null) {
                if (zzdVar.EY != null) {
                    return false;
                }
            } else if (!this.EY.equals(zzdVar.EY)) {
                return false;
            }
            if (!zzary.equals(this.blI, zzdVar.blI)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzdVar.btG == null || zzdVar.btG.isEmpty() : this.btG.equals(zzdVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((((this.EY == null ? 0 : this.EY.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31) + zzary.hashCode(this.blI)) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.EY != null && !this.EY.equals("")) {
                zzartVar.zzq(1, this.EY);
            }
            if (this.blI != null && this.blI.length > 0) {
                for (int i = 0; i < this.blI.length; i++) {
                    zzb zzbVar = this.blI[i];
                    if (zzbVar != null) {
                        zzartVar.zza(2, zzbVar);
                    }
                }
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzbf */
        public zzd zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.EY = zzarsVar.readString();
                        break;
                    case 18:
                        int zzc = zzasd.zzc(zzarsVar, 18);
                        int length = this.blI == null ? 0 : this.blI.length;
                        zzb[] zzbVarArr = new zzb[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.blI, 0, zzbVarArr, 0, length);
                        }
                        while (length < zzbVarArr.length - 1) {
                            zzbVarArr[length] = new zzb();
                            zzarsVar.zza(zzbVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzbVarArr[length] = new zzb();
                        zzarsVar.zza(zzbVarArr[length]);
                        this.blI = zzbVarArr;
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

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.EY != null && !this.EY.equals("")) {
                zzx += zzart.zzr(1, this.EY);
            }
            if (this.blI == null || this.blI.length <= 0) {
                return zzx;
            }
            int i = zzx;
            for (int i2 = 0; i2 < this.blI.length; i2++) {
                zzb zzbVar = this.blI[i2];
                if (zzbVar != null) {
                    i += zzart.zzc(2, zzbVar);
                }
            }
            return i;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zze extends zzaru<zze> {
        public zza blJ;
        public zza blK;
        public zza blL;
        public zzc blM;
        public zzf[] blN;

        public zze() {
            ag();
        }

        public zze ag() {
            this.blJ = null;
            this.blK = null;
            this.blL = null;
            this.blM = null;
            this.blN = zzf.ah();
            this.btG = null;
            this.btP = -1;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zze)) {
                return false;
            }
            zze zzeVar = (zze) obj;
            if (this.blJ == null) {
                if (zzeVar.blJ != null) {
                    return false;
                }
            } else if (!this.blJ.equals(zzeVar.blJ)) {
                return false;
            }
            if (this.blK == null) {
                if (zzeVar.blK != null) {
                    return false;
                }
            } else if (!this.blK.equals(zzeVar.blK)) {
                return false;
            }
            if (this.blL == null) {
                if (zzeVar.blL != null) {
                    return false;
                }
            } else if (!this.blL.equals(zzeVar.blL)) {
                return false;
            }
            if (this.blM == null) {
                if (zzeVar.blM != null) {
                    return false;
                }
            } else if (!this.blM.equals(zzeVar.blM)) {
                return false;
            }
            if (!zzary.equals(this.blN, zzeVar.blN)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzeVar.btG == null || zzeVar.btG.isEmpty() : this.btG.equals(zzeVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((((this.blM == null ? 0 : this.blM.hashCode()) + (((this.blL == null ? 0 : this.blL.hashCode()) + (((this.blK == null ? 0 : this.blK.hashCode()) + (((this.blJ == null ? 0 : this.blJ.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31)) * 31)) * 31) + zzary.hashCode(this.blN)) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.blJ != null) {
                zzartVar.zza(1, this.blJ);
            }
            if (this.blK != null) {
                zzartVar.zza(2, this.blK);
            }
            if (this.blL != null) {
                zzartVar.zza(3, this.blL);
            }
            if (this.blM != null) {
                zzartVar.zza(4, this.blM);
            }
            if (this.blN != null && this.blN.length > 0) {
                for (int i = 0; i < this.blN.length; i++) {
                    zzf zzfVar = this.blN[i];
                    if (zzfVar != null) {
                        zzartVar.zza(5, zzfVar);
                    }
                }
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzbg */
        public zze zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        if (this.blJ == null) {
                            this.blJ = new zza();
                        }
                        zzarsVar.zza(this.blJ);
                        break;
                    case 18:
                        if (this.blK == null) {
                            this.blK = new zza();
                        }
                        zzarsVar.zza(this.blK);
                        break;
                    case 26:
                        if (this.blL == null) {
                            this.blL = new zza();
                        }
                        zzarsVar.zza(this.blL);
                        break;
                    case 34:
                        if (this.blM == null) {
                            this.blM = new zzc();
                        }
                        zzarsVar.zza(this.blM);
                        break;
                    case 42:
                        int zzc = zzasd.zzc(zzarsVar, 42);
                        int length = this.blN == null ? 0 : this.blN.length;
                        zzf[] zzfVarArr = new zzf[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.blN, 0, zzfVarArr, 0, length);
                        }
                        while (length < zzfVarArr.length - 1) {
                            zzfVarArr[length] = new zzf();
                            zzarsVar.zza(zzfVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzfVarArr[length] = new zzf();
                        zzarsVar.zza(zzfVarArr[length]);
                        this.blN = zzfVarArr;
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

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.blJ != null) {
                zzx += zzart.zzc(1, this.blJ);
            }
            if (this.blK != null) {
                zzx += zzart.zzc(2, this.blK);
            }
            if (this.blL != null) {
                zzx += zzart.zzc(3, this.blL);
            }
            if (this.blM != null) {
                zzx += zzart.zzc(4, this.blM);
            }
            if (this.blN == null || this.blN.length <= 0) {
                return zzx;
            }
            int i = zzx;
            for (int i2 = 0; i2 < this.blN.length; i2++) {
                zzf zzfVar = this.blN[i2];
                if (zzfVar != null) {
                    i += zzart.zzc(5, zzfVar);
                }
            }
            return i;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzf extends zzaru<zzf> {
        private static volatile zzf[] blO;
        public String EY;
        public long blP;
        public int resourceId;

        public zzf() {
            ai();
        }

        public static zzf[] ah() {
            if (blO == null) {
                synchronized (zzary.btO) {
                    if (blO == null) {
                        blO = new zzf[0];
                    }
                }
            }
            return blO;
        }

        public zzf ai() {
            this.resourceId = 0;
            this.blP = 0L;
            this.EY = "";
            this.btG = null;
            this.btP = -1;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzf)) {
                return false;
            }
            zzf zzfVar = (zzf) obj;
            if (this.resourceId != zzfVar.resourceId || this.blP != zzfVar.blP) {
                return false;
            }
            if (this.EY == null) {
                if (zzfVar.EY != null) {
                    return false;
                }
            } else if (!this.EY.equals(zzfVar.EY)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzfVar.btG == null || zzfVar.btG.isEmpty() : this.btG.equals(zzfVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.EY == null ? 0 : this.EY.hashCode()) + ((((((getClass().getName().hashCode() + 527) * 31) + this.resourceId) * 31) + ((int) (this.blP ^ (this.blP >>> 32)))) * 31)) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.resourceId != 0) {
                zzartVar.zzaf(1, this.resourceId);
            }
            if (this.blP != 0) {
                zzartVar.zzc(2, this.blP);
            }
            if (this.EY != null && !this.EY.equals("")) {
                zzartVar.zzq(3, this.EY);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzbh */
        public zzf zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.resourceId = zzarsVar.bY();
                        break;
                    case 17:
                        this.blP = zzarsVar.bZ();
                        break;
                    case 26:
                        this.EY = zzarsVar.readString();
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

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.resourceId != 0) {
                zzx += zzart.zzah(1, this.resourceId);
            }
            if (this.blP != 0) {
                zzx += zzart.zzg(2, this.blP);
            }
            return (this.EY == null || this.EY.equals("")) ? zzx : zzx + zzart.zzr(3, this.EY);
        }
    }
}
