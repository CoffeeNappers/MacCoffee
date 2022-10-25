package com.google.android.gms.internal;

import com.facebook.imageutils.JfifUtil;
import com.facebook.imageutils.TiffUtil;
import java.io.IOException;
/* loaded from: classes2.dex */
public interface zzwc {

    /* loaded from: classes2.dex */
    public static final class zza extends zzasa {
        private static volatile zza[] awI;
        public Integer avZ;
        public zzf awJ;
        public zzf awK;
        public Boolean awL;

        public zza() {
            zzbzx();
        }

        public static zza[] zzbzw() {
            if (awI == null) {
                synchronized (zzary.btO) {
                    if (awI == null) {
                        awI = new zza[0];
                    }
                }
            }
            return awI;
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
            if (this.awJ == null) {
                if (zzaVar.awJ != null) {
                    return false;
                }
            } else if (!this.awJ.equals(zzaVar.awJ)) {
                return false;
            }
            if (this.awK == null) {
                if (zzaVar.awK != null) {
                    return false;
                }
            } else if (!this.awK.equals(zzaVar.awK)) {
                return false;
            }
            return this.awL == null ? zzaVar.awL == null : this.awL.equals(zzaVar.awL);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.awK == null ? 0 : this.awK.hashCode()) + (((this.awJ == null ? 0 : this.awJ.hashCode()) + (((this.avZ == null ? 0 : this.avZ.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31)) * 31;
            if (this.awL != null) {
                i = this.awL.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.avZ != null) {
                zzartVar.zzaf(1, this.avZ.intValue());
            }
            if (this.awJ != null) {
                zzartVar.zza(2, this.awJ);
            }
            if (this.awK != null) {
                zzartVar.zza(3, this.awK);
            }
            if (this.awL != null) {
                zzartVar.zzg(4, this.awL.booleanValue());
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzap */
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
                        if (this.awJ == null) {
                            this.awJ = new zzf();
                        }
                        zzarsVar.zza(this.awJ);
                        break;
                    case 26:
                        if (this.awK == null) {
                            this.awK = new zzf();
                        }
                        zzarsVar.zza(this.awK);
                        break;
                    case 32:
                        this.awL = Boolean.valueOf(zzarsVar.ca());
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

        public zza zzbzx() {
            this.avZ = null;
            this.awJ = null;
            this.awK = null;
            this.awL = null;
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
            if (this.awJ != null) {
                zzx += zzart.zzc(2, this.awJ);
            }
            if (this.awK != null) {
                zzx += zzart.zzc(3, this.awK);
            }
            return this.awL != null ? zzx + zzart.zzh(4, this.awL.booleanValue()) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzb extends zzasa {
        private static volatile zzb[] awM;
        public zzc[] awN;
        public Long awO;
        public Long awP;
        public Integer count;
        public String name;

        public zzb() {
            zzbzz();
        }

        public static zzb[] zzbzy() {
            if (awM == null) {
                synchronized (zzary.btO) {
                    if (awM == null) {
                        awM = new zzb[0];
                    }
                }
            }
            return awM;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzb)) {
                return false;
            }
            zzb zzbVar = (zzb) obj;
            if (!zzary.equals(this.awN, zzbVar.awN)) {
                return false;
            }
            if (this.name == null) {
                if (zzbVar.name != null) {
                    return false;
                }
            } else if (!this.name.equals(zzbVar.name)) {
                return false;
            }
            if (this.awO == null) {
                if (zzbVar.awO != null) {
                    return false;
                }
            } else if (!this.awO.equals(zzbVar.awO)) {
                return false;
            }
            if (this.awP == null) {
                if (zzbVar.awP != null) {
                    return false;
                }
            } else if (!this.awP.equals(zzbVar.awP)) {
                return false;
            }
            return this.count == null ? zzbVar.count == null : this.count.equals(zzbVar.count);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.awP == null ? 0 : this.awP.hashCode()) + (((this.awO == null ? 0 : this.awO.hashCode()) + (((this.name == null ? 0 : this.name.hashCode()) + ((((getClass().getName().hashCode() + 527) * 31) + zzary.hashCode(this.awN)) * 31)) * 31)) * 31)) * 31;
            if (this.count != null) {
                i = this.count.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.awN != null && this.awN.length > 0) {
                for (int i = 0; i < this.awN.length; i++) {
                    zzc zzcVar = this.awN[i];
                    if (zzcVar != null) {
                        zzartVar.zza(1, zzcVar);
                    }
                }
            }
            if (this.name != null) {
                zzartVar.zzq(2, this.name);
            }
            if (this.awO != null) {
                zzartVar.zzb(3, this.awO.longValue());
            }
            if (this.awP != null) {
                zzartVar.zzb(4, this.awP.longValue());
            }
            if (this.count != null) {
                zzartVar.zzaf(5, this.count.intValue());
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzaq */
        public zzb zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        int zzc = zzasd.zzc(zzarsVar, 10);
                        int length = this.awN == null ? 0 : this.awN.length;
                        zzc[] zzcVarArr = new zzc[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.awN, 0, zzcVarArr, 0, length);
                        }
                        while (length < zzcVarArr.length - 1) {
                            zzcVarArr[length] = new zzc();
                            zzarsVar.zza(zzcVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzcVarArr[length] = new zzc();
                        zzarsVar.zza(zzcVarArr[length]);
                        this.awN = zzcVarArr;
                        break;
                    case 18:
                        this.name = zzarsVar.readString();
                        break;
                    case 24:
                        this.awO = Long.valueOf(zzarsVar.bX());
                        break;
                    case 32:
                        this.awP = Long.valueOf(zzarsVar.bX());
                        break;
                    case 40:
                        this.count = Integer.valueOf(zzarsVar.bY());
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

        public zzb zzbzz() {
            this.awN = zzc.zzcaa();
            this.name = null;
            this.awO = null;
            this.awP = null;
            this.count = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.awN != null && this.awN.length > 0) {
                for (int i = 0; i < this.awN.length; i++) {
                    zzc zzcVar = this.awN[i];
                    if (zzcVar != null) {
                        zzx += zzart.zzc(1, zzcVar);
                    }
                }
            }
            if (this.name != null) {
                zzx += zzart.zzr(2, this.name);
            }
            if (this.awO != null) {
                zzx += zzart.zzf(3, this.awO.longValue());
            }
            if (this.awP != null) {
                zzx += zzart.zzf(4, this.awP.longValue());
            }
            return this.count != null ? zzx + zzart.zzah(5, this.count.intValue()) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzc extends zzasa {
        private static volatile zzc[] awQ;
        public String Fe;
        public Float avV;
        public Double avW;
        public Long awR;
        public String name;

        public zzc() {
            zzcab();
        }

        public static zzc[] zzcaa() {
            if (awQ == null) {
                synchronized (zzary.btO) {
                    if (awQ == null) {
                        awQ = new zzc[0];
                    }
                }
            }
            return awQ;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzc)) {
                return false;
            }
            zzc zzcVar = (zzc) obj;
            if (this.name == null) {
                if (zzcVar.name != null) {
                    return false;
                }
            } else if (!this.name.equals(zzcVar.name)) {
                return false;
            }
            if (this.Fe == null) {
                if (zzcVar.Fe != null) {
                    return false;
                }
            } else if (!this.Fe.equals(zzcVar.Fe)) {
                return false;
            }
            if (this.awR == null) {
                if (zzcVar.awR != null) {
                    return false;
                }
            } else if (!this.awR.equals(zzcVar.awR)) {
                return false;
            }
            if (this.avV == null) {
                if (zzcVar.avV != null) {
                    return false;
                }
            } else if (!this.avV.equals(zzcVar.avV)) {
                return false;
            }
            return this.avW == null ? zzcVar.avW == null : this.avW.equals(zzcVar.avW);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.avV == null ? 0 : this.avV.hashCode()) + (((this.awR == null ? 0 : this.awR.hashCode()) + (((this.Fe == null ? 0 : this.Fe.hashCode()) + (((this.name == null ? 0 : this.name.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31)) * 31)) * 31;
            if (this.avW != null) {
                i = this.avW.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.name != null) {
                zzartVar.zzq(1, this.name);
            }
            if (this.Fe != null) {
                zzartVar.zzq(2, this.Fe);
            }
            if (this.awR != null) {
                zzartVar.zzb(3, this.awR.longValue());
            }
            if (this.avV != null) {
                zzartVar.zzc(4, this.avV.floatValue());
            }
            if (this.avW != null) {
                zzartVar.zza(5, this.avW.doubleValue());
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzar */
        public zzc zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.name = zzarsVar.readString();
                        break;
                    case 18:
                        this.Fe = zzarsVar.readString();
                        break;
                    case 24:
                        this.awR = Long.valueOf(zzarsVar.bX());
                        break;
                    case 37:
                        this.avV = Float.valueOf(zzarsVar.readFloat());
                        break;
                    case 41:
                        this.avW = Double.valueOf(zzarsVar.readDouble());
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

        public zzc zzcab() {
            this.name = null;
            this.Fe = null;
            this.awR = null;
            this.avV = null;
            this.avW = null;
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
            if (this.Fe != null) {
                zzx += zzart.zzr(2, this.Fe);
            }
            if (this.awR != null) {
                zzx += zzart.zzf(3, this.awR.longValue());
            }
            if (this.avV != null) {
                zzx += zzart.zzd(4, this.avV.floatValue());
            }
            return this.avW != null ? zzx + zzart.zzb(5, this.avW.doubleValue()) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzd extends zzasa {
        public zze[] awS;

        public zzd() {
            zzcac();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            return (obj instanceof zzd) && zzary.equals(this.awS, ((zzd) obj).awS);
        }

        public int hashCode() {
            return ((getClass().getName().hashCode() + 527) * 31) + zzary.hashCode(this.awS);
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.awS != null && this.awS.length > 0) {
                for (int i = 0; i < this.awS.length; i++) {
                    zze zzeVar = this.awS[i];
                    if (zzeVar != null) {
                        zzartVar.zza(1, zzeVar);
                    }
                }
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzas */
        public zzd zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        int zzc = zzasd.zzc(zzarsVar, 10);
                        int length = this.awS == null ? 0 : this.awS.length;
                        zze[] zzeVarArr = new zze[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.awS, 0, zzeVarArr, 0, length);
                        }
                        while (length < zzeVarArr.length - 1) {
                            zzeVarArr[length] = new zze();
                            zzarsVar.zza(zzeVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzeVarArr[length] = new zze();
                        zzarsVar.zza(zzeVarArr[length]);
                        this.awS = zzeVarArr;
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

        public zzd zzcac() {
            this.awS = zze.zzcad();
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.awS != null && this.awS.length > 0) {
                for (int i = 0; i < this.awS.length; i++) {
                    zze zzeVar = this.awS[i];
                    if (zzeVar != null) {
                        zzx += zzart.zzc(1, zzeVar);
                    }
                }
            }
            return zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zze extends zzasa {
        private static volatile zze[] awT;
        public String aii;
        public String aqZ;
        public String ara;
        public String ard;
        public String arh;
        public Integer awU;
        public zzb[] awV;
        public zzg[] awW;
        public Long awX;
        public Long awY;
        public Long awZ;
        public Long axa;
        public Long axb;
        public String axc;
        public String axd;
        public String axe;
        public Integer axf;
        public Long axg;
        public Long axh;
        public String axi;
        public Boolean axj;
        public String axk;
        public Long axl;
        public Integer axm;
        public Boolean axn;
        public zza[] axo;
        public Integer axp;
        public Integer axq;
        public Integer axr;
        public String axs;
        public Long axt;
        public String zzcs;
        public String zzdb;

        public zze() {
            zzcae();
        }

        public static zze[] zzcad() {
            if (awT == null) {
                synchronized (zzary.btO) {
                    if (awT == null) {
                        awT = new zze[0];
                    }
                }
            }
            return awT;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zze)) {
                return false;
            }
            zze zzeVar = (zze) obj;
            if (this.awU == null) {
                if (zzeVar.awU != null) {
                    return false;
                }
            } else if (!this.awU.equals(zzeVar.awU)) {
                return false;
            }
            if (zzary.equals(this.awV, zzeVar.awV) && zzary.equals(this.awW, zzeVar.awW)) {
                if (this.awX == null) {
                    if (zzeVar.awX != null) {
                        return false;
                    }
                } else if (!this.awX.equals(zzeVar.awX)) {
                    return false;
                }
                if (this.awY == null) {
                    if (zzeVar.awY != null) {
                        return false;
                    }
                } else if (!this.awY.equals(zzeVar.awY)) {
                    return false;
                }
                if (this.awZ == null) {
                    if (zzeVar.awZ != null) {
                        return false;
                    }
                } else if (!this.awZ.equals(zzeVar.awZ)) {
                    return false;
                }
                if (this.axa == null) {
                    if (zzeVar.axa != null) {
                        return false;
                    }
                } else if (!this.axa.equals(zzeVar.axa)) {
                    return false;
                }
                if (this.axb == null) {
                    if (zzeVar.axb != null) {
                        return false;
                    }
                } else if (!this.axb.equals(zzeVar.axb)) {
                    return false;
                }
                if (this.axc == null) {
                    if (zzeVar.axc != null) {
                        return false;
                    }
                } else if (!this.axc.equals(zzeVar.axc)) {
                    return false;
                }
                if (this.zzdb == null) {
                    if (zzeVar.zzdb != null) {
                        return false;
                    }
                } else if (!this.zzdb.equals(zzeVar.zzdb)) {
                    return false;
                }
                if (this.axd == null) {
                    if (zzeVar.axd != null) {
                        return false;
                    }
                } else if (!this.axd.equals(zzeVar.axd)) {
                    return false;
                }
                if (this.axe == null) {
                    if (zzeVar.axe != null) {
                        return false;
                    }
                } else if (!this.axe.equals(zzeVar.axe)) {
                    return false;
                }
                if (this.axf == null) {
                    if (zzeVar.axf != null) {
                        return false;
                    }
                } else if (!this.axf.equals(zzeVar.axf)) {
                    return false;
                }
                if (this.ara == null) {
                    if (zzeVar.ara != null) {
                        return false;
                    }
                } else if (!this.ara.equals(zzeVar.ara)) {
                    return false;
                }
                if (this.zzcs == null) {
                    if (zzeVar.zzcs != null) {
                        return false;
                    }
                } else if (!this.zzcs.equals(zzeVar.zzcs)) {
                    return false;
                }
                if (this.aii == null) {
                    if (zzeVar.aii != null) {
                        return false;
                    }
                } else if (!this.aii.equals(zzeVar.aii)) {
                    return false;
                }
                if (this.axg == null) {
                    if (zzeVar.axg != null) {
                        return false;
                    }
                } else if (!this.axg.equals(zzeVar.axg)) {
                    return false;
                }
                if (this.axh == null) {
                    if (zzeVar.axh != null) {
                        return false;
                    }
                } else if (!this.axh.equals(zzeVar.axh)) {
                    return false;
                }
                if (this.axi == null) {
                    if (zzeVar.axi != null) {
                        return false;
                    }
                } else if (!this.axi.equals(zzeVar.axi)) {
                    return false;
                }
                if (this.axj == null) {
                    if (zzeVar.axj != null) {
                        return false;
                    }
                } else if (!this.axj.equals(zzeVar.axj)) {
                    return false;
                }
                if (this.axk == null) {
                    if (zzeVar.axk != null) {
                        return false;
                    }
                } else if (!this.axk.equals(zzeVar.axk)) {
                    return false;
                }
                if (this.axl == null) {
                    if (zzeVar.axl != null) {
                        return false;
                    }
                } else if (!this.axl.equals(zzeVar.axl)) {
                    return false;
                }
                if (this.axm == null) {
                    if (zzeVar.axm != null) {
                        return false;
                    }
                } else if (!this.axm.equals(zzeVar.axm)) {
                    return false;
                }
                if (this.ard == null) {
                    if (zzeVar.ard != null) {
                        return false;
                    }
                } else if (!this.ard.equals(zzeVar.ard)) {
                    return false;
                }
                if (this.aqZ == null) {
                    if (zzeVar.aqZ != null) {
                        return false;
                    }
                } else if (!this.aqZ.equals(zzeVar.aqZ)) {
                    return false;
                }
                if (this.axn == null) {
                    if (zzeVar.axn != null) {
                        return false;
                    }
                } else if (!this.axn.equals(zzeVar.axn)) {
                    return false;
                }
                if (!zzary.equals(this.axo, zzeVar.axo)) {
                    return false;
                }
                if (this.arh == null) {
                    if (zzeVar.arh != null) {
                        return false;
                    }
                } else if (!this.arh.equals(zzeVar.arh)) {
                    return false;
                }
                if (this.axp == null) {
                    if (zzeVar.axp != null) {
                        return false;
                    }
                } else if (!this.axp.equals(zzeVar.axp)) {
                    return false;
                }
                if (this.axq == null) {
                    if (zzeVar.axq != null) {
                        return false;
                    }
                } else if (!this.axq.equals(zzeVar.axq)) {
                    return false;
                }
                if (this.axr == null) {
                    if (zzeVar.axr != null) {
                        return false;
                    }
                } else if (!this.axr.equals(zzeVar.axr)) {
                    return false;
                }
                if (this.axs == null) {
                    if (zzeVar.axs != null) {
                        return false;
                    }
                } else if (!this.axs.equals(zzeVar.axs)) {
                    return false;
                }
                return this.axt == null ? zzeVar.axt == null : this.axt.equals(zzeVar.axt);
            }
            return false;
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.axs == null ? 0 : this.axs.hashCode()) + (((this.axr == null ? 0 : this.axr.hashCode()) + (((this.axq == null ? 0 : this.axq.hashCode()) + (((this.axp == null ? 0 : this.axp.hashCode()) + (((this.arh == null ? 0 : this.arh.hashCode()) + (((((this.axn == null ? 0 : this.axn.hashCode()) + (((this.aqZ == null ? 0 : this.aqZ.hashCode()) + (((this.ard == null ? 0 : this.ard.hashCode()) + (((this.axm == null ? 0 : this.axm.hashCode()) + (((this.axl == null ? 0 : this.axl.hashCode()) + (((this.axk == null ? 0 : this.axk.hashCode()) + (((this.axj == null ? 0 : this.axj.hashCode()) + (((this.axi == null ? 0 : this.axi.hashCode()) + (((this.axh == null ? 0 : this.axh.hashCode()) + (((this.axg == null ? 0 : this.axg.hashCode()) + (((this.aii == null ? 0 : this.aii.hashCode()) + (((this.zzcs == null ? 0 : this.zzcs.hashCode()) + (((this.ara == null ? 0 : this.ara.hashCode()) + (((this.axf == null ? 0 : this.axf.hashCode()) + (((this.axe == null ? 0 : this.axe.hashCode()) + (((this.axd == null ? 0 : this.axd.hashCode()) + (((this.zzdb == null ? 0 : this.zzdb.hashCode()) + (((this.axc == null ? 0 : this.axc.hashCode()) + (((this.axb == null ? 0 : this.axb.hashCode()) + (((this.axa == null ? 0 : this.axa.hashCode()) + (((this.awZ == null ? 0 : this.awZ.hashCode()) + (((this.awY == null ? 0 : this.awY.hashCode()) + (((this.awX == null ? 0 : this.awX.hashCode()) + (((((((this.awU == null ? 0 : this.awU.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31) + zzary.hashCode(this.awV)) * 31) + zzary.hashCode(this.awW)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31) + zzary.hashCode(this.axo)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31;
            if (this.axt != null) {
                i = this.axt.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.awU != null) {
                zzartVar.zzaf(1, this.awU.intValue());
            }
            if (this.awV != null && this.awV.length > 0) {
                for (int i = 0; i < this.awV.length; i++) {
                    zzb zzbVar = this.awV[i];
                    if (zzbVar != null) {
                        zzartVar.zza(2, zzbVar);
                    }
                }
            }
            if (this.awW != null && this.awW.length > 0) {
                for (int i2 = 0; i2 < this.awW.length; i2++) {
                    zzg zzgVar = this.awW[i2];
                    if (zzgVar != null) {
                        zzartVar.zza(3, zzgVar);
                    }
                }
            }
            if (this.awX != null) {
                zzartVar.zzb(4, this.awX.longValue());
            }
            if (this.awY != null) {
                zzartVar.zzb(5, this.awY.longValue());
            }
            if (this.awZ != null) {
                zzartVar.zzb(6, this.awZ.longValue());
            }
            if (this.axb != null) {
                zzartVar.zzb(7, this.axb.longValue());
            }
            if (this.axc != null) {
                zzartVar.zzq(8, this.axc);
            }
            if (this.zzdb != null) {
                zzartVar.zzq(9, this.zzdb);
            }
            if (this.axd != null) {
                zzartVar.zzq(10, this.axd);
            }
            if (this.axe != null) {
                zzartVar.zzq(11, this.axe);
            }
            if (this.axf != null) {
                zzartVar.zzaf(12, this.axf.intValue());
            }
            if (this.ara != null) {
                zzartVar.zzq(13, this.ara);
            }
            if (this.zzcs != null) {
                zzartVar.zzq(14, this.zzcs);
            }
            if (this.aii != null) {
                zzartVar.zzq(16, this.aii);
            }
            if (this.axg != null) {
                zzartVar.zzb(17, this.axg.longValue());
            }
            if (this.axh != null) {
                zzartVar.zzb(18, this.axh.longValue());
            }
            if (this.axi != null) {
                zzartVar.zzq(19, this.axi);
            }
            if (this.axj != null) {
                zzartVar.zzg(20, this.axj.booleanValue());
            }
            if (this.axk != null) {
                zzartVar.zzq(21, this.axk);
            }
            if (this.axl != null) {
                zzartVar.zzb(22, this.axl.longValue());
            }
            if (this.axm != null) {
                zzartVar.zzaf(23, this.axm.intValue());
            }
            if (this.ard != null) {
                zzartVar.zzq(24, this.ard);
            }
            if (this.aqZ != null) {
                zzartVar.zzq(25, this.aqZ);
            }
            if (this.axa != null) {
                zzartVar.zzb(26, this.axa.longValue());
            }
            if (this.axn != null) {
                zzartVar.zzg(28, this.axn.booleanValue());
            }
            if (this.axo != null && this.axo.length > 0) {
                for (int i3 = 0; i3 < this.axo.length; i3++) {
                    zza zzaVar = this.axo[i3];
                    if (zzaVar != null) {
                        zzartVar.zza(29, zzaVar);
                    }
                }
            }
            if (this.arh != null) {
                zzartVar.zzq(30, this.arh);
            }
            if (this.axp != null) {
                zzartVar.zzaf(31, this.axp.intValue());
            }
            if (this.axq != null) {
                zzartVar.zzaf(32, this.axq.intValue());
            }
            if (this.axr != null) {
                zzartVar.zzaf(33, this.axr.intValue());
            }
            if (this.axs != null) {
                zzartVar.zzq(34, this.axs);
            }
            if (this.axt != null) {
                zzartVar.zzb(35, this.axt.longValue());
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzat */
        public zze zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.awU = Integer.valueOf(zzarsVar.bY());
                        break;
                    case 18:
                        int zzc = zzasd.zzc(zzarsVar, 18);
                        int length = this.awV == null ? 0 : this.awV.length;
                        zzb[] zzbVarArr = new zzb[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.awV, 0, zzbVarArr, 0, length);
                        }
                        while (length < zzbVarArr.length - 1) {
                            zzbVarArr[length] = new zzb();
                            zzarsVar.zza(zzbVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzbVarArr[length] = new zzb();
                        zzarsVar.zza(zzbVarArr[length]);
                        this.awV = zzbVarArr;
                        break;
                    case 26:
                        int zzc2 = zzasd.zzc(zzarsVar, 26);
                        int length2 = this.awW == null ? 0 : this.awW.length;
                        zzg[] zzgVarArr = new zzg[zzc2 + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.awW, 0, zzgVarArr, 0, length2);
                        }
                        while (length2 < zzgVarArr.length - 1) {
                            zzgVarArr[length2] = new zzg();
                            zzarsVar.zza(zzgVarArr[length2]);
                            zzarsVar.bU();
                            length2++;
                        }
                        zzgVarArr[length2] = new zzg();
                        zzarsVar.zza(zzgVarArr[length2]);
                        this.awW = zzgVarArr;
                        break;
                    case 32:
                        this.awX = Long.valueOf(zzarsVar.bX());
                        break;
                    case 40:
                        this.awY = Long.valueOf(zzarsVar.bX());
                        break;
                    case 48:
                        this.awZ = Long.valueOf(zzarsVar.bX());
                        break;
                    case 56:
                        this.axb = Long.valueOf(zzarsVar.bX());
                        break;
                    case 66:
                        this.axc = zzarsVar.readString();
                        break;
                    case 74:
                        this.zzdb = zzarsVar.readString();
                        break;
                    case 82:
                        this.axd = zzarsVar.readString();
                        break;
                    case 90:
                        this.axe = zzarsVar.readString();
                        break;
                    case 96:
                        this.axf = Integer.valueOf(zzarsVar.bY());
                        break;
                    case 106:
                        this.ara = zzarsVar.readString();
                        break;
                    case 114:
                        this.zzcs = zzarsVar.readString();
                        break;
                    case 130:
                        this.aii = zzarsVar.readString();
                        break;
                    case 136:
                        this.axg = Long.valueOf(zzarsVar.bX());
                        break;
                    case 144:
                        this.axh = Long.valueOf(zzarsVar.bX());
                        break;
                    case 154:
                        this.axi = zzarsVar.readString();
                        break;
                    case 160:
                        this.axj = Boolean.valueOf(zzarsVar.ca());
                        break;
                    case 170:
                        this.axk = zzarsVar.readString();
                        break;
                    case 176:
                        this.axl = Long.valueOf(zzarsVar.bX());
                        break;
                    case 184:
                        this.axm = Integer.valueOf(zzarsVar.bY());
                        break;
                    case 194:
                        this.ard = zzarsVar.readString();
                        break;
                    case 202:
                        this.aqZ = zzarsVar.readString();
                        break;
                    case JfifUtil.MARKER_RST0 /* 208 */:
                        this.axa = Long.valueOf(zzarsVar.bX());
                        break;
                    case 224:
                        this.axn = Boolean.valueOf(zzarsVar.ca());
                        break;
                    case 234:
                        int zzc3 = zzasd.zzc(zzarsVar, 234);
                        int length3 = this.axo == null ? 0 : this.axo.length;
                        zza[] zzaVarArr = new zza[zzc3 + length3];
                        if (length3 != 0) {
                            System.arraycopy(this.axo, 0, zzaVarArr, 0, length3);
                        }
                        while (length3 < zzaVarArr.length - 1) {
                            zzaVarArr[length3] = new zza();
                            zzarsVar.zza(zzaVarArr[length3]);
                            zzarsVar.bU();
                            length3++;
                        }
                        zzaVarArr[length3] = new zza();
                        zzarsVar.zza(zzaVarArr[length3]);
                        this.axo = zzaVarArr;
                        break;
                    case 242:
                        this.arh = zzarsVar.readString();
                        break;
                    case 248:
                        this.axp = Integer.valueOf(zzarsVar.bY());
                        break;
                    case 256:
                        this.axq = Integer.valueOf(zzarsVar.bY());
                        break;
                    case 264:
                        this.axr = Integer.valueOf(zzarsVar.bY());
                        break;
                    case TiffUtil.TIFF_TAG_ORIENTATION /* 274 */:
                        this.axs = zzarsVar.readString();
                        break;
                    case 280:
                        this.axt = Long.valueOf(zzarsVar.bX());
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

        public zze zzcae() {
            this.awU = null;
            this.awV = zzb.zzbzy();
            this.awW = zzg.zzcag();
            this.awX = null;
            this.awY = null;
            this.awZ = null;
            this.axa = null;
            this.axb = null;
            this.axc = null;
            this.zzdb = null;
            this.axd = null;
            this.axe = null;
            this.axf = null;
            this.ara = null;
            this.zzcs = null;
            this.aii = null;
            this.axg = null;
            this.axh = null;
            this.axi = null;
            this.axj = null;
            this.axk = null;
            this.axl = null;
            this.axm = null;
            this.ard = null;
            this.aqZ = null;
            this.axn = null;
            this.axo = zza.zzbzw();
            this.arh = null;
            this.axp = null;
            this.axq = null;
            this.axr = null;
            this.axs = null;
            this.axt = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.awU != null) {
                zzx += zzart.zzah(1, this.awU.intValue());
            }
            if (this.awV != null && this.awV.length > 0) {
                int i = zzx;
                for (int i2 = 0; i2 < this.awV.length; i2++) {
                    zzb zzbVar = this.awV[i2];
                    if (zzbVar != null) {
                        i += zzart.zzc(2, zzbVar);
                    }
                }
                zzx = i;
            }
            if (this.awW != null && this.awW.length > 0) {
                int i3 = zzx;
                for (int i4 = 0; i4 < this.awW.length; i4++) {
                    zzg zzgVar = this.awW[i4];
                    if (zzgVar != null) {
                        i3 += zzart.zzc(3, zzgVar);
                    }
                }
                zzx = i3;
            }
            if (this.awX != null) {
                zzx += zzart.zzf(4, this.awX.longValue());
            }
            if (this.awY != null) {
                zzx += zzart.zzf(5, this.awY.longValue());
            }
            if (this.awZ != null) {
                zzx += zzart.zzf(6, this.awZ.longValue());
            }
            if (this.axb != null) {
                zzx += zzart.zzf(7, this.axb.longValue());
            }
            if (this.axc != null) {
                zzx += zzart.zzr(8, this.axc);
            }
            if (this.zzdb != null) {
                zzx += zzart.zzr(9, this.zzdb);
            }
            if (this.axd != null) {
                zzx += zzart.zzr(10, this.axd);
            }
            if (this.axe != null) {
                zzx += zzart.zzr(11, this.axe);
            }
            if (this.axf != null) {
                zzx += zzart.zzah(12, this.axf.intValue());
            }
            if (this.ara != null) {
                zzx += zzart.zzr(13, this.ara);
            }
            if (this.zzcs != null) {
                zzx += zzart.zzr(14, this.zzcs);
            }
            if (this.aii != null) {
                zzx += zzart.zzr(16, this.aii);
            }
            if (this.axg != null) {
                zzx += zzart.zzf(17, this.axg.longValue());
            }
            if (this.axh != null) {
                zzx += zzart.zzf(18, this.axh.longValue());
            }
            if (this.axi != null) {
                zzx += zzart.zzr(19, this.axi);
            }
            if (this.axj != null) {
                zzx += zzart.zzh(20, this.axj.booleanValue());
            }
            if (this.axk != null) {
                zzx += zzart.zzr(21, this.axk);
            }
            if (this.axl != null) {
                zzx += zzart.zzf(22, this.axl.longValue());
            }
            if (this.axm != null) {
                zzx += zzart.zzah(23, this.axm.intValue());
            }
            if (this.ard != null) {
                zzx += zzart.zzr(24, this.ard);
            }
            if (this.aqZ != null) {
                zzx += zzart.zzr(25, this.aqZ);
            }
            if (this.axa != null) {
                zzx += zzart.zzf(26, this.axa.longValue());
            }
            if (this.axn != null) {
                zzx += zzart.zzh(28, this.axn.booleanValue());
            }
            if (this.axo != null && this.axo.length > 0) {
                for (int i5 = 0; i5 < this.axo.length; i5++) {
                    zza zzaVar = this.axo[i5];
                    if (zzaVar != null) {
                        zzx += zzart.zzc(29, zzaVar);
                    }
                }
            }
            if (this.arh != null) {
                zzx += zzart.zzr(30, this.arh);
            }
            if (this.axp != null) {
                zzx += zzart.zzah(31, this.axp.intValue());
            }
            if (this.axq != null) {
                zzx += zzart.zzah(32, this.axq.intValue());
            }
            if (this.axr != null) {
                zzx += zzart.zzah(33, this.axr.intValue());
            }
            if (this.axs != null) {
                zzx += zzart.zzr(34, this.axs);
            }
            return this.axt != null ? zzx + zzart.zzf(35, this.axt.longValue()) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzf extends zzasa {
        public long[] axu;
        public long[] axv;

        public zzf() {
            zzcaf();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzf)) {
                return false;
            }
            zzf zzfVar = (zzf) obj;
            return zzary.equals(this.axu, zzfVar.axu) && zzary.equals(this.axv, zzfVar.axv);
        }

        public int hashCode() {
            return ((((getClass().getName().hashCode() + 527) * 31) + zzary.hashCode(this.axu)) * 31) + zzary.hashCode(this.axv);
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.axu != null && this.axu.length > 0) {
                for (int i = 0; i < this.axu.length; i++) {
                    zzartVar.zza(1, this.axu[i]);
                }
            }
            if (this.axv != null && this.axv.length > 0) {
                for (int i2 = 0; i2 < this.axv.length; i2++) {
                    zzartVar.zza(2, this.axv[i2]);
                }
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzau */
        public zzf zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        int zzc = zzasd.zzc(zzarsVar, 8);
                        int length = this.axu == null ? 0 : this.axu.length;
                        long[] jArr = new long[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.axu, 0, jArr, 0, length);
                        }
                        while (length < jArr.length - 1) {
                            jArr[length] = zzarsVar.bW();
                            zzarsVar.bU();
                            length++;
                        }
                        jArr[length] = zzarsVar.bW();
                        this.axu = jArr;
                        break;
                    case 10:
                        int zzagt = zzarsVar.zzagt(zzarsVar.cd());
                        int position = zzarsVar.getPosition();
                        int i = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bW();
                            i++;
                        }
                        zzarsVar.zzagv(position);
                        int length2 = this.axu == null ? 0 : this.axu.length;
                        long[] jArr2 = new long[i + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.axu, 0, jArr2, 0, length2);
                        }
                        while (length2 < jArr2.length) {
                            jArr2[length2] = zzarsVar.bW();
                            length2++;
                        }
                        this.axu = jArr2;
                        zzarsVar.zzagu(zzagt);
                        break;
                    case 16:
                        int zzc2 = zzasd.zzc(zzarsVar, 16);
                        int length3 = this.axv == null ? 0 : this.axv.length;
                        long[] jArr3 = new long[zzc2 + length3];
                        if (length3 != 0) {
                            System.arraycopy(this.axv, 0, jArr3, 0, length3);
                        }
                        while (length3 < jArr3.length - 1) {
                            jArr3[length3] = zzarsVar.bW();
                            zzarsVar.bU();
                            length3++;
                        }
                        jArr3[length3] = zzarsVar.bW();
                        this.axv = jArr3;
                        break;
                    case 18:
                        int zzagt2 = zzarsVar.zzagt(zzarsVar.cd());
                        int position2 = zzarsVar.getPosition();
                        int i2 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bW();
                            i2++;
                        }
                        zzarsVar.zzagv(position2);
                        int length4 = this.axv == null ? 0 : this.axv.length;
                        long[] jArr4 = new long[i2 + length4];
                        if (length4 != 0) {
                            System.arraycopy(this.axv, 0, jArr4, 0, length4);
                        }
                        while (length4 < jArr4.length) {
                            jArr4[length4] = zzarsVar.bW();
                            length4++;
                        }
                        this.axv = jArr4;
                        zzarsVar.zzagu(zzagt2);
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

        public zzf zzcaf() {
            this.axu = zzasd.btS;
            this.axv = zzasd.btS;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int i;
            int zzx = super.zzx();
            if (this.axu == null || this.axu.length <= 0) {
                i = zzx;
            } else {
                int i2 = 0;
                for (int i3 = 0; i3 < this.axu.length; i3++) {
                    i2 += zzart.zzcy(this.axu[i3]);
                }
                i = zzx + i2 + (this.axu.length * 1);
            }
            if (this.axv == null || this.axv.length <= 0) {
                return i;
            }
            int i4 = 0;
            for (int i5 = 0; i5 < this.axv.length; i5++) {
                i4 += zzart.zzcy(this.axv[i5]);
            }
            return i + i4 + (this.axv.length * 1);
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzg extends zzasa {
        private static volatile zzg[] axw;
        public String Fe;
        public Float avV;
        public Double avW;
        public Long awR;
        public Long axx;
        public String name;

        public zzg() {
            zzcah();
        }

        public static zzg[] zzcag() {
            if (axw == null) {
                synchronized (zzary.btO) {
                    if (axw == null) {
                        axw = new zzg[0];
                    }
                }
            }
            return axw;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzg)) {
                return false;
            }
            zzg zzgVar = (zzg) obj;
            if (this.axx == null) {
                if (zzgVar.axx != null) {
                    return false;
                }
            } else if (!this.axx.equals(zzgVar.axx)) {
                return false;
            }
            if (this.name == null) {
                if (zzgVar.name != null) {
                    return false;
                }
            } else if (!this.name.equals(zzgVar.name)) {
                return false;
            }
            if (this.Fe == null) {
                if (zzgVar.Fe != null) {
                    return false;
                }
            } else if (!this.Fe.equals(zzgVar.Fe)) {
                return false;
            }
            if (this.awR == null) {
                if (zzgVar.awR != null) {
                    return false;
                }
            } else if (!this.awR.equals(zzgVar.awR)) {
                return false;
            }
            if (this.avV == null) {
                if (zzgVar.avV != null) {
                    return false;
                }
            } else if (!this.avV.equals(zzgVar.avV)) {
                return false;
            }
            return this.avW == null ? zzgVar.avW == null : this.avW.equals(zzgVar.avW);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.avV == null ? 0 : this.avV.hashCode()) + (((this.awR == null ? 0 : this.awR.hashCode()) + (((this.Fe == null ? 0 : this.Fe.hashCode()) + (((this.name == null ? 0 : this.name.hashCode()) + (((this.axx == null ? 0 : this.axx.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31)) * 31)) * 31)) * 31;
            if (this.avW != null) {
                i = this.avW.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.axx != null) {
                zzartVar.zzb(1, this.axx.longValue());
            }
            if (this.name != null) {
                zzartVar.zzq(2, this.name);
            }
            if (this.Fe != null) {
                zzartVar.zzq(3, this.Fe);
            }
            if (this.awR != null) {
                zzartVar.zzb(4, this.awR.longValue());
            }
            if (this.avV != null) {
                zzartVar.zzc(5, this.avV.floatValue());
            }
            if (this.avW != null) {
                zzartVar.zza(6, this.avW.doubleValue());
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzav */
        public zzg zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.axx = Long.valueOf(zzarsVar.bX());
                        break;
                    case 18:
                        this.name = zzarsVar.readString();
                        break;
                    case 26:
                        this.Fe = zzarsVar.readString();
                        break;
                    case 32:
                        this.awR = Long.valueOf(zzarsVar.bX());
                        break;
                    case 45:
                        this.avV = Float.valueOf(zzarsVar.readFloat());
                        break;
                    case 49:
                        this.avW = Double.valueOf(zzarsVar.readDouble());
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

        public zzg zzcah() {
            this.axx = null;
            this.name = null;
            this.Fe = null;
            this.awR = null;
            this.avV = null;
            this.avW = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.axx != null) {
                zzx += zzart.zzf(1, this.axx.longValue());
            }
            if (this.name != null) {
                zzx += zzart.zzr(2, this.name);
            }
            if (this.Fe != null) {
                zzx += zzart.zzr(3, this.Fe);
            }
            if (this.awR != null) {
                zzx += zzart.zzf(4, this.awR.longValue());
            }
            if (this.avV != null) {
                zzx += zzart.zzd(5, this.avV.floatValue());
            }
            return this.avW != null ? zzx + zzart.zzb(6, this.avW.doubleValue()) : zzx;
        }
    }
}
