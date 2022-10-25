package com.google.android.gms.internal;

import java.io.IOException;
/* loaded from: classes2.dex */
public interface zzvw {

    /* loaded from: classes2.dex */
    public static final class zza extends zzaru<zza> {
        public C0138zza[] ahB;

        /* renamed from: com.google.android.gms.internal.zzvw$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        public static final class C0138zza extends zzaru<C0138zza> {
            private static volatile C0138zza[] ahC;
            public String ahD;
            public String ahE;
            public int viewId;

            public C0138zza() {
                zzboa();
            }

            public static C0138zza[] zzbnz() {
                if (ahC == null) {
                    synchronized (zzary.btO) {
                        if (ahC == null) {
                            ahC = new C0138zza[0];
                        }
                    }
                }
                return ahC;
            }

            public boolean equals(Object obj) {
                if (obj == this) {
                    return true;
                }
                if (!(obj instanceof C0138zza)) {
                    return false;
                }
                C0138zza c0138zza = (C0138zza) obj;
                if (this.ahD == null) {
                    if (c0138zza.ahD != null) {
                        return false;
                    }
                } else if (!this.ahD.equals(c0138zza.ahD)) {
                    return false;
                }
                if (this.ahE == null) {
                    if (c0138zza.ahE != null) {
                        return false;
                    }
                } else if (!this.ahE.equals(c0138zza.ahE)) {
                    return false;
                }
                if (this.viewId != c0138zza.viewId) {
                    return false;
                }
                return (this.btG == null || this.btG.isEmpty()) ? c0138zza.btG == null || c0138zza.btG.isEmpty() : this.btG.equals(c0138zza.btG);
            }

            public int hashCode() {
                int i = 0;
                int hashCode = ((((this.ahE == null ? 0 : this.ahE.hashCode()) + (((this.ahD == null ? 0 : this.ahD.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31) + this.viewId) * 31;
                if (this.btG != null && !this.btG.isEmpty()) {
                    i = this.btG.hashCode();
                }
                return hashCode + i;
            }

            @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
            public void zza(zzart zzartVar) throws IOException {
                if (this.ahD != null && !this.ahD.equals("")) {
                    zzartVar.zzq(1, this.ahD);
                }
                if (this.ahE != null && !this.ahE.equals("")) {
                    zzartVar.zzq(2, this.ahE);
                }
                if (this.viewId != 0) {
                    zzartVar.zzaf(3, this.viewId);
                }
                super.zza(zzartVar);
            }

            @Override // com.google.android.gms.internal.zzasa
            /* renamed from: zzac */
            public C0138zza zzb(zzars zzarsVar) throws IOException {
                while (true) {
                    int bU = zzarsVar.bU();
                    switch (bU) {
                        case 0:
                            break;
                        case 10:
                            this.ahD = zzarsVar.readString();
                            break;
                        case 18:
                            this.ahE = zzarsVar.readString();
                            break;
                        case 24:
                            this.viewId = zzarsVar.bY();
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

            public C0138zza zzboa() {
                this.ahD = "";
                this.ahE = "";
                this.viewId = 0;
                this.btG = null;
                this.btP = -1;
                return this;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
            public int zzx() {
                int zzx = super.zzx();
                if (this.ahD != null && !this.ahD.equals("")) {
                    zzx += zzart.zzr(1, this.ahD);
                }
                if (this.ahE != null && !this.ahE.equals("")) {
                    zzx += zzart.zzr(2, this.ahE);
                }
                return this.viewId != 0 ? zzx + zzart.zzah(3, this.viewId) : zzx;
            }
        }

        public zza() {
            zzbny();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zza)) {
                return false;
            }
            zza zzaVar = (zza) obj;
            if (!zzary.equals(this.ahB, zzaVar.ahB)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzaVar.btG == null || zzaVar.btG.isEmpty() : this.btG.equals(zzaVar.btG);
        }

        public int hashCode() {
            return ((this.btG == null || this.btG.isEmpty()) ? 0 : this.btG.hashCode()) + ((((getClass().getName().hashCode() + 527) * 31) + zzary.hashCode(this.ahB)) * 31);
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.ahB != null && this.ahB.length > 0) {
                for (int i = 0; i < this.ahB.length; i++) {
                    C0138zza c0138zza = this.ahB[i];
                    if (c0138zza != null) {
                        zzartVar.zza(1, c0138zza);
                    }
                }
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzab */
        public zza zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        int zzc = zzasd.zzc(zzarsVar, 10);
                        int length = this.ahB == null ? 0 : this.ahB.length;
                        C0138zza[] c0138zzaArr = new C0138zza[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.ahB, 0, c0138zzaArr, 0, length);
                        }
                        while (length < c0138zzaArr.length - 1) {
                            c0138zzaArr[length] = new C0138zza();
                            zzarsVar.zza(c0138zzaArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        c0138zzaArr[length] = new C0138zza();
                        zzarsVar.zza(c0138zzaArr[length]);
                        this.ahB = c0138zzaArr;
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

        public zza zzbny() {
            this.ahB = C0138zza.zzbnz();
            this.btG = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.ahB != null && this.ahB.length > 0) {
                for (int i = 0; i < this.ahB.length; i++) {
                    C0138zza c0138zza = this.ahB[i];
                    if (c0138zza != null) {
                        zzx += zzart.zzc(1, c0138zza);
                    }
                }
            }
            return zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzb extends zzaru<zzb> {
        private static volatile zzb[] ahF;
        public zzd ahG;
        public String name;

        public zzb() {
            zzboc();
        }

        public static zzb[] zzbob() {
            if (ahF == null) {
                synchronized (zzary.btO) {
                    if (ahF == null) {
                        ahF = new zzb[0];
                    }
                }
            }
            return ahF;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzb)) {
                return false;
            }
            zzb zzbVar = (zzb) obj;
            if (this.name == null) {
                if (zzbVar.name != null) {
                    return false;
                }
            } else if (!this.name.equals(zzbVar.name)) {
                return false;
            }
            if (this.ahG == null) {
                if (zzbVar.ahG != null) {
                    return false;
                }
            } else if (!this.ahG.equals(zzbVar.ahG)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzbVar.btG == null || zzbVar.btG.isEmpty() : this.btG.equals(zzbVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.ahG == null ? 0 : this.ahG.hashCode()) + (((this.name == null ? 0 : this.name.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.name != null && !this.name.equals("")) {
                zzartVar.zzq(1, this.name);
            }
            if (this.ahG != null) {
                zzartVar.zza(2, this.ahG);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzad */
        public zzb zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.name = zzarsVar.readString();
                        break;
                    case 18:
                        if (this.ahG == null) {
                            this.ahG = new zzd();
                        }
                        zzarsVar.zza(this.ahG);
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

        public zzb zzboc() {
            this.name = "";
            this.ahG = null;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.name != null && !this.name.equals("")) {
                zzx += zzart.zzr(1, this.name);
            }
            return this.ahG != null ? zzx + zzart.zzc(2, this.ahG) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzc extends zzaru<zzc> {
        public zzb[] ahH;
        public String type;

        public zzc() {
            zzbod();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzc)) {
                return false;
            }
            zzc zzcVar = (zzc) obj;
            if (this.type == null) {
                if (zzcVar.type != null) {
                    return false;
                }
            } else if (!this.type.equals(zzcVar.type)) {
                return false;
            }
            if (!zzary.equals(this.ahH, zzcVar.ahH)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzcVar.btG == null || zzcVar.btG.isEmpty() : this.btG.equals(zzcVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((((this.type == null ? 0 : this.type.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31) + zzary.hashCode(this.ahH)) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.type != null && !this.type.equals("")) {
                zzartVar.zzq(1, this.type);
            }
            if (this.ahH != null && this.ahH.length > 0) {
                for (int i = 0; i < this.ahH.length; i++) {
                    zzb zzbVar = this.ahH[i];
                    if (zzbVar != null) {
                        zzartVar.zza(2, zzbVar);
                    }
                }
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzae */
        public zzc zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.type = zzarsVar.readString();
                        break;
                    case 18:
                        int zzc = zzasd.zzc(zzarsVar, 18);
                        int length = this.ahH == null ? 0 : this.ahH.length;
                        zzb[] zzbVarArr = new zzb[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.ahH, 0, zzbVarArr, 0, length);
                        }
                        while (length < zzbVarArr.length - 1) {
                            zzbVarArr[length] = new zzb();
                            zzarsVar.zza(zzbVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzbVarArr[length] = new zzb();
                        zzarsVar.zza(zzbVarArr[length]);
                        this.ahH = zzbVarArr;
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

        public zzc zzbod() {
            this.type = "";
            this.ahH = zzb.zzbob();
            this.btG = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.type != null && !this.type.equals("")) {
                zzx += zzart.zzr(1, this.type);
            }
            if (this.ahH == null || this.ahH.length <= 0) {
                return zzx;
            }
            int i = zzx;
            for (int i2 = 0; i2 < this.ahH.length; i2++) {
                zzb zzbVar = this.ahH[i2];
                if (zzbVar != null) {
                    i += zzart.zzc(2, zzbVar);
                }
            }
            return i;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzd extends zzaru<zzd> {
        public String Fe;
        public boolean ahI;
        public long ahJ;
        public double ahK;
        public zzc ahL;

        public zzd() {
            zzboe();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzd)) {
                return false;
            }
            zzd zzdVar = (zzd) obj;
            if (this.ahI != zzdVar.ahI) {
                return false;
            }
            if (this.Fe == null) {
                if (zzdVar.Fe != null) {
                    return false;
                }
            } else if (!this.Fe.equals(zzdVar.Fe)) {
                return false;
            }
            if (this.ahJ != zzdVar.ahJ || Double.doubleToLongBits(this.ahK) != Double.doubleToLongBits(zzdVar.ahK)) {
                return false;
            }
            if (this.ahL == null) {
                if (zzdVar.ahL != null) {
                    return false;
                }
            } else if (!this.ahL.equals(zzdVar.ahL)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzdVar.btG == null || zzdVar.btG.isEmpty() : this.btG.equals(zzdVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = (((this.Fe == null ? 0 : this.Fe.hashCode()) + (((this.ahI ? 1231 : 1237) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31) + ((int) (this.ahJ ^ (this.ahJ >>> 32)));
            long doubleToLongBits = Double.doubleToLongBits(this.ahK);
            int hashCode2 = ((this.ahL == null ? 0 : this.ahL.hashCode()) + (((hashCode * 31) + ((int) (doubleToLongBits ^ (doubleToLongBits >>> 32)))) * 31)) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode2 + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.ahI) {
                zzartVar.zzg(1, this.ahI);
            }
            if (this.Fe != null && !this.Fe.equals("")) {
                zzartVar.zzq(2, this.Fe);
            }
            if (this.ahJ != 0) {
                zzartVar.zzb(3, this.ahJ);
            }
            if (Double.doubleToLongBits(this.ahK) != Double.doubleToLongBits(0.0d)) {
                zzartVar.zza(4, this.ahK);
            }
            if (this.ahL != null) {
                zzartVar.zza(5, this.ahL);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzaf */
        public zzd zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.ahI = zzarsVar.ca();
                        break;
                    case 18:
                        this.Fe = zzarsVar.readString();
                        break;
                    case 24:
                        this.ahJ = zzarsVar.bX();
                        break;
                    case 33:
                        this.ahK = zzarsVar.readDouble();
                        break;
                    case 42:
                        if (this.ahL == null) {
                            this.ahL = new zzc();
                        }
                        zzarsVar.zza(this.ahL);
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

        public zzd zzboe() {
            this.ahI = false;
            this.Fe = "";
            this.ahJ = 0L;
            this.ahK = 0.0d;
            this.ahL = null;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.ahI) {
                zzx += zzart.zzh(1, this.ahI);
            }
            if (this.Fe != null && !this.Fe.equals("")) {
                zzx += zzart.zzr(2, this.Fe);
            }
            if (this.ahJ != 0) {
                zzx += zzart.zzf(3, this.ahJ);
            }
            if (Double.doubleToLongBits(this.ahK) != Double.doubleToLongBits(0.0d)) {
                zzx += zzart.zzb(4, this.ahK);
            }
            return this.ahL != null ? zzx + zzart.zzc(5, this.ahL) : zzx;
        }
    }
}
