package com.google.android.gms.internal;

import java.io.IOException;
/* loaded from: classes2.dex */
public interface zzwa {

    /* loaded from: classes2.dex */
    public static final class zza extends zzasa {
        private static volatile zza[] avY;
        public Integer avZ;
        public zze[] awa;
        public zzb[] awb;

        public zza() {
            zzbzi();
        }

        public static zza[] zzbzh() {
            if (avY == null) {
                synchronized (zzary.btO) {
                    if (avY == null) {
                        avY = new zza[0];
                    }
                }
            }
            return avY;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zza)) {
                return false;
            }
            zza zzaVar = (zza) obj;
            if (this.avZ == null) {
                if (zzaVar.avZ != null) {
                    return false;
                }
            } else if (!this.avZ.equals(zzaVar.avZ)) {
                return false;
            }
            return zzary.equals(this.awa, zzaVar.awa) && zzary.equals(this.awb, zzaVar.awb);
        }

        public int hashCode() {
            return (((((this.avZ == null ? 0 : this.avZ.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31) + zzary.hashCode(this.awa)) * 31) + zzary.hashCode(this.awb);
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.avZ != null) {
                zzartVar.zzaf(1, this.avZ.intValue());
            }
            if (this.awa != null && this.awa.length > 0) {
                for (int i = 0; i < this.awa.length; i++) {
                    zze zzeVar = this.awa[i];
                    if (zzeVar != null) {
                        zzartVar.zza(2, zzeVar);
                    }
                }
            }
            if (this.awb != null && this.awb.length > 0) {
                for (int i2 = 0; i2 < this.awb.length; i2++) {
                    zzb zzbVar = this.awb[i2];
                    if (zzbVar != null) {
                        zzartVar.zza(3, zzbVar);
                    }
                }
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzag */
        public zza zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.avZ = Integer.valueOf(zzarsVar.bY());
                        break;
                    case 18:
                        int zzc = zzasd.zzc(zzarsVar, 18);
                        int length = this.awa == null ? 0 : this.awa.length;
                        zze[] zzeVarArr = new zze[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.awa, 0, zzeVarArr, 0, length);
                        }
                        while (length < zzeVarArr.length - 1) {
                            zzeVarArr[length] = new zze();
                            zzarsVar.zza(zzeVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzeVarArr[length] = new zze();
                        zzarsVar.zza(zzeVarArr[length]);
                        this.awa = zzeVarArr;
                        break;
                    case 26:
                        int zzc2 = zzasd.zzc(zzarsVar, 26);
                        int length2 = this.awb == null ? 0 : this.awb.length;
                        zzb[] zzbVarArr = new zzb[zzc2 + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.awb, 0, zzbVarArr, 0, length2);
                        }
                        while (length2 < zzbVarArr.length - 1) {
                            zzbVarArr[length2] = new zzb();
                            zzarsVar.zza(zzbVarArr[length2]);
                            zzarsVar.bU();
                            length2++;
                        }
                        zzbVarArr[length2] = new zzb();
                        zzarsVar.zza(zzbVarArr[length2]);
                        this.awb = zzbVarArr;
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

        public zza zzbzi() {
            this.avZ = null;
            this.awa = zze.zzbzo();
            this.awb = zzb.zzbzj();
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.avZ != null) {
                zzx += zzart.zzah(1, this.avZ.intValue());
            }
            if (this.awa != null && this.awa.length > 0) {
                int i = zzx;
                for (int i2 = 0; i2 < this.awa.length; i2++) {
                    zze zzeVar = this.awa[i2];
                    if (zzeVar != null) {
                        i += zzart.zzc(2, zzeVar);
                    }
                }
                zzx = i;
            }
            if (this.awb != null && this.awb.length > 0) {
                for (int i3 = 0; i3 < this.awb.length; i3++) {
                    zzb zzbVar = this.awb[i3];
                    if (zzbVar != null) {
                        zzx += zzart.zzc(3, zzbVar);
                    }
                }
            }
            return zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzb extends zzasa {
        private static volatile zzb[] awc;
        public Integer awd;
        public String awe;
        public zzc[] awf;
        public Boolean awg;
        public zzd awh;

        public zzb() {
            zzbzk();
        }

        public static zzb[] zzbzj() {
            if (awc == null) {
                synchronized (zzary.btO) {
                    if (awc == null) {
                        awc = new zzb[0];
                    }
                }
            }
            return awc;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzb)) {
                return false;
            }
            zzb zzbVar = (zzb) obj;
            if (this.awd == null) {
                if (zzbVar.awd != null) {
                    return false;
                }
            } else if (!this.awd.equals(zzbVar.awd)) {
                return false;
            }
            if (this.awe == null) {
                if (zzbVar.awe != null) {
                    return false;
                }
            } else if (!this.awe.equals(zzbVar.awe)) {
                return false;
            }
            if (!zzary.equals(this.awf, zzbVar.awf)) {
                return false;
            }
            if (this.awg == null) {
                if (zzbVar.awg != null) {
                    return false;
                }
            } else if (!this.awg.equals(zzbVar.awg)) {
                return false;
            }
            return this.awh == null ? zzbVar.awh == null : this.awh.equals(zzbVar.awh);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.awg == null ? 0 : this.awg.hashCode()) + (((((this.awe == null ? 0 : this.awe.hashCode()) + (((this.awd == null ? 0 : this.awd.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31) + zzary.hashCode(this.awf)) * 31)) * 31;
            if (this.awh != null) {
                i = this.awh.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.awd != null) {
                zzartVar.zzaf(1, this.awd.intValue());
            }
            if (this.awe != null) {
                zzartVar.zzq(2, this.awe);
            }
            if (this.awf != null && this.awf.length > 0) {
                for (int i = 0; i < this.awf.length; i++) {
                    zzc zzcVar = this.awf[i];
                    if (zzcVar != null) {
                        zzartVar.zza(3, zzcVar);
                    }
                }
            }
            if (this.awg != null) {
                zzartVar.zzg(4, this.awg.booleanValue());
            }
            if (this.awh != null) {
                zzartVar.zza(5, this.awh);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzah */
        public zzb zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.awd = Integer.valueOf(zzarsVar.bY());
                        break;
                    case 18:
                        this.awe = zzarsVar.readString();
                        break;
                    case 26:
                        int zzc = zzasd.zzc(zzarsVar, 26);
                        int length = this.awf == null ? 0 : this.awf.length;
                        zzc[] zzcVarArr = new zzc[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.awf, 0, zzcVarArr, 0, length);
                        }
                        while (length < zzcVarArr.length - 1) {
                            zzcVarArr[length] = new zzc();
                            zzarsVar.zza(zzcVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzcVarArr[length] = new zzc();
                        zzarsVar.zza(zzcVarArr[length]);
                        this.awf = zzcVarArr;
                        break;
                    case 32:
                        this.awg = Boolean.valueOf(zzarsVar.ca());
                        break;
                    case 42:
                        if (this.awh == null) {
                            this.awh = new zzd();
                        }
                        zzarsVar.zza(this.awh);
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

        public zzb zzbzk() {
            this.awd = null;
            this.awe = null;
            this.awf = zzc.zzbzl();
            this.awg = null;
            this.awh = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.awd != null) {
                zzx += zzart.zzah(1, this.awd.intValue());
            }
            if (this.awe != null) {
                zzx += zzart.zzr(2, this.awe);
            }
            if (this.awf != null && this.awf.length > 0) {
                int i = zzx;
                for (int i2 = 0; i2 < this.awf.length; i2++) {
                    zzc zzcVar = this.awf[i2];
                    if (zzcVar != null) {
                        i += zzart.zzc(3, zzcVar);
                    }
                }
                zzx = i;
            }
            if (this.awg != null) {
                zzx += zzart.zzh(4, this.awg.booleanValue());
            }
            return this.awh != null ? zzx + zzart.zzc(5, this.awh) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzc extends zzasa {
        private static volatile zzc[] awi;
        public zzf awj;
        public zzd awk;
        public Boolean awl;
        public String awm;

        public zzc() {
            zzbzm();
        }

        public static zzc[] zzbzl() {
            if (awi == null) {
                synchronized (zzary.btO) {
                    if (awi == null) {
                        awi = new zzc[0];
                    }
                }
            }
            return awi;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzc)) {
                return false;
            }
            zzc zzcVar = (zzc) obj;
            if (this.awj == null) {
                if (zzcVar.awj != null) {
                    return false;
                }
            } else if (!this.awj.equals(zzcVar.awj)) {
                return false;
            }
            if (this.awk == null) {
                if (zzcVar.awk != null) {
                    return false;
                }
            } else if (!this.awk.equals(zzcVar.awk)) {
                return false;
            }
            if (this.awl == null) {
                if (zzcVar.awl != null) {
                    return false;
                }
            } else if (!this.awl.equals(zzcVar.awl)) {
                return false;
            }
            return this.awm == null ? zzcVar.awm == null : this.awm.equals(zzcVar.awm);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.awl == null ? 0 : this.awl.hashCode()) + (((this.awk == null ? 0 : this.awk.hashCode()) + (((this.awj == null ? 0 : this.awj.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31)) * 31;
            if (this.awm != null) {
                i = this.awm.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.awj != null) {
                zzartVar.zza(1, this.awj);
            }
            if (this.awk != null) {
                zzartVar.zza(2, this.awk);
            }
            if (this.awl != null) {
                zzartVar.zzg(3, this.awl.booleanValue());
            }
            if (this.awm != null) {
                zzartVar.zzq(4, this.awm);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzai */
        public zzc zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        if (this.awj == null) {
                            this.awj = new zzf();
                        }
                        zzarsVar.zza(this.awj);
                        break;
                    case 18:
                        if (this.awk == null) {
                            this.awk = new zzd();
                        }
                        zzarsVar.zza(this.awk);
                        break;
                    case 24:
                        this.awl = Boolean.valueOf(zzarsVar.ca());
                        break;
                    case 34:
                        this.awm = zzarsVar.readString();
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

        public zzc zzbzm() {
            this.awj = null;
            this.awk = null;
            this.awl = null;
            this.awm = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.awj != null) {
                zzx += zzart.zzc(1, this.awj);
            }
            if (this.awk != null) {
                zzx += zzart.zzc(2, this.awk);
            }
            if (this.awl != null) {
                zzx += zzart.zzh(3, this.awl.booleanValue());
            }
            return this.awm != null ? zzx + zzart.zzr(4, this.awm) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzd extends zzasa {
        public Integer awn;
        public Boolean awo;
        public String awp;
        public String awq;
        public String awr;

        public zzd() {
            zzbzn();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzd)) {
                return false;
            }
            zzd zzdVar = (zzd) obj;
            if (this.awn == null) {
                if (zzdVar.awn != null) {
                    return false;
                }
            } else if (!this.awn.equals(zzdVar.awn)) {
                return false;
            }
            if (this.awo == null) {
                if (zzdVar.awo != null) {
                    return false;
                }
            } else if (!this.awo.equals(zzdVar.awo)) {
                return false;
            }
            if (this.awp == null) {
                if (zzdVar.awp != null) {
                    return false;
                }
            } else if (!this.awp.equals(zzdVar.awp)) {
                return false;
            }
            if (this.awq == null) {
                if (zzdVar.awq != null) {
                    return false;
                }
            } else if (!this.awq.equals(zzdVar.awq)) {
                return false;
            }
            return this.awr == null ? zzdVar.awr == null : this.awr.equals(zzdVar.awr);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.awq == null ? 0 : this.awq.hashCode()) + (((this.awp == null ? 0 : this.awp.hashCode()) + (((this.awo == null ? 0 : this.awo.hashCode()) + (((this.awn == null ? 0 : this.awn.intValue()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31)) * 31)) * 31;
            if (this.awr != null) {
                i = this.awr.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.awn != null) {
                zzartVar.zzaf(1, this.awn.intValue());
            }
            if (this.awo != null) {
                zzartVar.zzg(2, this.awo.booleanValue());
            }
            if (this.awp != null) {
                zzartVar.zzq(3, this.awp);
            }
            if (this.awq != null) {
                zzartVar.zzq(4, this.awq);
            }
            if (this.awr != null) {
                zzartVar.zzq(5, this.awr);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzaj */
        public zzd zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        int bY = zzarsVar.bY();
                        switch (bY) {
                            case 0:
                            case 1:
                            case 2:
                            case 3:
                            case 4:
                                this.awn = Integer.valueOf(bY);
                                continue;
                        }
                    case 16:
                        this.awo = Boolean.valueOf(zzarsVar.ca());
                        break;
                    case 26:
                        this.awp = zzarsVar.readString();
                        break;
                    case 34:
                        this.awq = zzarsVar.readString();
                        break;
                    case 42:
                        this.awr = zzarsVar.readString();
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

        public zzd zzbzn() {
            this.awo = null;
            this.awp = null;
            this.awq = null;
            this.awr = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.awn != null) {
                zzx += zzart.zzah(1, this.awn.intValue());
            }
            if (this.awo != null) {
                zzx += zzart.zzh(2, this.awo.booleanValue());
            }
            if (this.awp != null) {
                zzx += zzart.zzr(3, this.awp);
            }
            if (this.awq != null) {
                zzx += zzart.zzr(4, this.awq);
            }
            return this.awr != null ? zzx + zzart.zzr(5, this.awr) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zze extends zzasa {
        private static volatile zze[] aws;
        public Integer awd;
        public String awt;
        public zzc awu;

        public zze() {
            zzbzp();
        }

        public static zze[] zzbzo() {
            if (aws == null) {
                synchronized (zzary.btO) {
                    if (aws == null) {
                        aws = new zze[0];
                    }
                }
            }
            return aws;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zze)) {
                return false;
            }
            zze zzeVar = (zze) obj;
            if (this.awd == null) {
                if (zzeVar.awd != null) {
                    return false;
                }
            } else if (!this.awd.equals(zzeVar.awd)) {
                return false;
            }
            if (this.awt == null) {
                if (zzeVar.awt != null) {
                    return false;
                }
            } else if (!this.awt.equals(zzeVar.awt)) {
                return false;
            }
            return this.awu == null ? zzeVar.awu == null : this.awu.equals(zzeVar.awu);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.awt == null ? 0 : this.awt.hashCode()) + (((this.awd == null ? 0 : this.awd.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31;
            if (this.awu != null) {
                i = this.awu.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.awd != null) {
                zzartVar.zzaf(1, this.awd.intValue());
            }
            if (this.awt != null) {
                zzartVar.zzq(2, this.awt);
            }
            if (this.awu != null) {
                zzartVar.zza(3, this.awu);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzak */
        public zze zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.awd = Integer.valueOf(zzarsVar.bY());
                        break;
                    case 18:
                        this.awt = zzarsVar.readString();
                        break;
                    case 26:
                        if (this.awu == null) {
                            this.awu = new zzc();
                        }
                        zzarsVar.zza(this.awu);
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

        public zze zzbzp() {
            this.awd = null;
            this.awt = null;
            this.awu = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.awd != null) {
                zzx += zzart.zzah(1, this.awd.intValue());
            }
            if (this.awt != null) {
                zzx += zzart.zzr(2, this.awt);
            }
            return this.awu != null ? zzx + zzart.zzc(3, this.awu) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzf extends zzasa {
        public Integer awv;
        public String aww;
        public Boolean awx;
        public String[] awy;

        public zzf() {
            zzbzq();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzf)) {
                return false;
            }
            zzf zzfVar = (zzf) obj;
            if (this.awv == null) {
                if (zzfVar.awv != null) {
                    return false;
                }
            } else if (!this.awv.equals(zzfVar.awv)) {
                return false;
            }
            if (this.aww == null) {
                if (zzfVar.aww != null) {
                    return false;
                }
            } else if (!this.aww.equals(zzfVar.aww)) {
                return false;
            }
            if (this.awx == null) {
                if (zzfVar.awx != null) {
                    return false;
                }
            } else if (!this.awx.equals(zzfVar.awx)) {
                return false;
            }
            return zzary.equals(this.awy, zzfVar.awy);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.aww == null ? 0 : this.aww.hashCode()) + (((this.awv == null ? 0 : this.awv.intValue()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31;
            if (this.awx != null) {
                i = this.awx.hashCode();
            }
            return ((hashCode + i) * 31) + zzary.hashCode(this.awy);
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.awv != null) {
                zzartVar.zzaf(1, this.awv.intValue());
            }
            if (this.aww != null) {
                zzartVar.zzq(2, this.aww);
            }
            if (this.awx != null) {
                zzartVar.zzg(3, this.awx.booleanValue());
            }
            if (this.awy != null && this.awy.length > 0) {
                for (int i = 0; i < this.awy.length; i++) {
                    String str = this.awy[i];
                    if (str != null) {
                        zzartVar.zzq(4, str);
                    }
                }
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzal */
        public zzf zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        int bY = zzarsVar.bY();
                        switch (bY) {
                            case 0:
                            case 1:
                            case 2:
                            case 3:
                            case 4:
                            case 5:
                            case 6:
                                this.awv = Integer.valueOf(bY);
                                continue;
                        }
                    case 18:
                        this.aww = zzarsVar.readString();
                        break;
                    case 24:
                        this.awx = Boolean.valueOf(zzarsVar.ca());
                        break;
                    case 34:
                        int zzc = zzasd.zzc(zzarsVar, 34);
                        int length = this.awy == null ? 0 : this.awy.length;
                        String[] strArr = new String[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.awy, 0, strArr, 0, length);
                        }
                        while (length < strArr.length - 1) {
                            strArr[length] = zzarsVar.readString();
                            zzarsVar.bU();
                            length++;
                        }
                        strArr[length] = zzarsVar.readString();
                        this.awy = strArr;
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

        public zzf zzbzq() {
            this.aww = null;
            this.awx = null;
            this.awy = zzasd.btW;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.awv != null) {
                zzx += zzart.zzah(1, this.awv.intValue());
            }
            if (this.aww != null) {
                zzx += zzart.zzr(2, this.aww);
            }
            if (this.awx != null) {
                zzx += zzart.zzh(3, this.awx.booleanValue());
            }
            if (this.awy == null || this.awy.length <= 0) {
                return zzx;
            }
            int i = 0;
            int i2 = 0;
            for (int i3 = 0; i3 < this.awy.length; i3++) {
                String str = this.awy[i3];
                if (str != null) {
                    i2++;
                    i += zzart.zzuy(str);
                }
            }
            return zzx + i + (i2 * 1);
        }
    }
}
