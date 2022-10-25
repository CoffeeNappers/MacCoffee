package com.google.android.gms.internal;

import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.internal.zzaj;
import java.io.IOException;
/* loaded from: classes2.dex */
public interface zzai {

    /* loaded from: classes2.dex */
    public static final class zza extends zzaru<zza> {
        public int level;
        public int zzvr;
        public int zzvs;

        public zza() {
            zzac();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zza)) {
                return false;
            }
            zza zzaVar = (zza) obj;
            if (this.level != zzaVar.level || this.zzvr != zzaVar.zzvr || this.zzvs != zzaVar.zzvs) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzaVar.btG == null || zzaVar.btG.isEmpty() : this.btG.equals(zzaVar.btG);
        }

        public int hashCode() {
            return ((this.btG == null || this.btG.isEmpty()) ? 0 : this.btG.hashCode()) + ((((((((getClass().getName().hashCode() + 527) * 31) + this.level) * 31) + this.zzvr) * 31) + this.zzvs) * 31);
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.level != 1) {
                zzartVar.zzaf(1, this.level);
            }
            if (this.zzvr != 0) {
                zzartVar.zzaf(2, this.zzvr);
            }
            if (this.zzvs != 0) {
                zzartVar.zzaf(3, this.zzvs);
            }
            super.zza(zzartVar);
        }

        public zza zzac() {
            this.level = 1;
            this.zzvr = 0;
            this.zzvs = 0;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzn */
        public zza zzb(zzars zzarsVar) throws IOException {
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
                                this.level = bY;
                                continue;
                        }
                    case 16:
                        this.zzvr = zzarsVar.bY();
                        break;
                    case 24:
                        this.zzvs = zzarsVar.bY();
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
            if (this.level != 1) {
                zzx += zzart.zzah(1, this.level);
            }
            if (this.zzvr != 0) {
                zzx += zzart.zzah(2, this.zzvr);
            }
            return this.zzvs != 0 ? zzx + zzart.zzah(3, this.zzvs) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzb extends zzaru<zzb> {
        private static volatile zzb[] zzvt;
        public int name;
        public int[] zzvu;
        public int zzvv;
        public boolean zzvw;
        public boolean zzvx;

        public zzb() {
            zzae();
        }

        public static zzb[] zzad() {
            if (zzvt == null) {
                synchronized (zzary.btO) {
                    if (zzvt == null) {
                        zzvt = new zzb[0];
                    }
                }
            }
            return zzvt;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzb)) {
                return false;
            }
            zzb zzbVar = (zzb) obj;
            if (!zzary.equals(this.zzvu, zzbVar.zzvu) || this.zzvv != zzbVar.zzvv || this.name != zzbVar.name || this.zzvw != zzbVar.zzvw || this.zzvx != zzbVar.zzvx) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzbVar.btG == null || zzbVar.btG.isEmpty() : this.btG.equals(zzbVar.btG);
        }

        public int hashCode() {
            int i = 1231;
            int hashCode = ((this.zzvw ? 1231 : 1237) + ((((((((getClass().getName().hashCode() + 527) * 31) + zzary.hashCode(this.zzvu)) * 31) + this.zzvv) * 31) + this.name) * 31)) * 31;
            if (!this.zzvx) {
                i = 1237;
            }
            return ((this.btG == null || this.btG.isEmpty()) ? 0 : this.btG.hashCode()) + ((hashCode + i) * 31);
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzvx) {
                zzartVar.zzg(1, this.zzvx);
            }
            zzartVar.zzaf(2, this.zzvv);
            if (this.zzvu != null && this.zzvu.length > 0) {
                for (int i = 0; i < this.zzvu.length; i++) {
                    zzartVar.zzaf(3, this.zzvu[i]);
                }
            }
            if (this.name != 0) {
                zzartVar.zzaf(4, this.name);
            }
            if (this.zzvw) {
                zzartVar.zzg(6, this.zzvw);
            }
            super.zza(zzartVar);
        }

        public zzb zzae() {
            this.zzvu = zzasd.btR;
            this.zzvv = 0;
            this.name = 0;
            this.zzvw = false;
            this.zzvx = false;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzo */
        public zzb zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.zzvx = zzarsVar.ca();
                        break;
                    case 16:
                        this.zzvv = zzarsVar.bY();
                        break;
                    case 24:
                        int zzc = zzasd.zzc(zzarsVar, 24);
                        int length = this.zzvu == null ? 0 : this.zzvu.length;
                        int[] iArr = new int[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.zzvu, 0, iArr, 0, length);
                        }
                        while (length < iArr.length - 1) {
                            iArr[length] = zzarsVar.bY();
                            zzarsVar.bU();
                            length++;
                        }
                        iArr[length] = zzarsVar.bY();
                        this.zzvu = iArr;
                        break;
                    case 26:
                        int zzagt = zzarsVar.zzagt(zzarsVar.cd());
                        int position = zzarsVar.getPosition();
                        int i = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i++;
                        }
                        zzarsVar.zzagv(position);
                        int length2 = this.zzvu == null ? 0 : this.zzvu.length;
                        int[] iArr2 = new int[i + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.zzvu, 0, iArr2, 0, length2);
                        }
                        while (length2 < iArr2.length) {
                            iArr2[length2] = zzarsVar.bY();
                            length2++;
                        }
                        this.zzvu = iArr2;
                        zzarsVar.zzagu(zzagt);
                        break;
                    case 32:
                        this.name = zzarsVar.bY();
                        break;
                    case 48:
                        this.zzvw = zzarsVar.ca();
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
            int i;
            int i2 = 0;
            int zzx = super.zzx();
            if (this.zzvx) {
                zzx += zzart.zzh(1, this.zzvx);
            }
            int zzah = zzart.zzah(2, this.zzvv) + zzx;
            if (this.zzvu == null || this.zzvu.length <= 0) {
                i = zzah;
            } else {
                for (int i3 = 0; i3 < this.zzvu.length; i3++) {
                    i2 += zzart.zzagz(this.zzvu[i3]);
                }
                i = zzah + i2 + (this.zzvu.length * 1);
            }
            if (this.name != 0) {
                i += zzart.zzah(4, this.name);
            }
            return this.zzvw ? i + zzart.zzh(6, this.zzvw) : i;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzc extends zzaru<zzc> {
        private static volatile zzc[] zzvy;
        public String zzcb;
        public long zzvz;
        public long zzwa;
        public boolean zzwb;
        public long zzwc;

        public zzc() {
            zzag();
        }

        public static zzc[] zzaf() {
            if (zzvy == null) {
                synchronized (zzary.btO) {
                    if (zzvy == null) {
                        zzvy = new zzc[0];
                    }
                }
            }
            return zzvy;
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
            if (this.zzvz != zzcVar.zzvz || this.zzwa != zzcVar.zzwa || this.zzwb != zzcVar.zzwb || this.zzwc != zzcVar.zzwc) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzcVar.btG == null || zzcVar.btG.isEmpty() : this.btG.equals(zzcVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((((this.zzwb ? 1231 : 1237) + (((((((this.zzcb == null ? 0 : this.zzcb.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31) + ((int) (this.zzvz ^ (this.zzvz >>> 32)))) * 31) + ((int) (this.zzwa ^ (this.zzwa >>> 32)))) * 31)) * 31) + ((int) (this.zzwc ^ (this.zzwc >>> 32)))) * 31;
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
            if (this.zzvz != 0) {
                zzartVar.zzb(2, this.zzvz);
            }
            if (this.zzwa != 2147483647L) {
                zzartVar.zzb(3, this.zzwa);
            }
            if (this.zzwb) {
                zzartVar.zzg(4, this.zzwb);
            }
            if (this.zzwc != 0) {
                zzartVar.zzb(5, this.zzwc);
            }
            super.zza(zzartVar);
        }

        public zzc zzag() {
            this.zzcb = "";
            this.zzvz = 0L;
            this.zzwa = 2147483647L;
            this.zzwb = false;
            this.zzwc = 0L;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzp */
        public zzc zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.zzcb = zzarsVar.readString();
                        break;
                    case 16:
                        this.zzvz = zzarsVar.bX();
                        break;
                    case 24:
                        this.zzwa = zzarsVar.bX();
                        break;
                    case 32:
                        this.zzwb = zzarsVar.ca();
                        break;
                    case 40:
                        this.zzwc = zzarsVar.bX();
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
            if (this.zzvz != 0) {
                zzx += zzart.zzf(2, this.zzvz);
            }
            if (this.zzwa != 2147483647L) {
                zzx += zzart.zzf(3, this.zzwa);
            }
            if (this.zzwb) {
                zzx += zzart.zzh(4, this.zzwb);
            }
            return this.zzwc != 0 ? zzx + zzart.zzf(5, this.zzwc) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzd extends zzaru<zzd> {
        public zzaj.zza[] zzwd;
        public zzaj.zza[] zzwe;
        public zzc[] zzwf;

        public zzd() {
            zzah();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzd)) {
                return false;
            }
            zzd zzdVar = (zzd) obj;
            if (!zzary.equals(this.zzwd, zzdVar.zzwd) || !zzary.equals(this.zzwe, zzdVar.zzwe) || !zzary.equals(this.zzwf, zzdVar.zzwf)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzdVar.btG == null || zzdVar.btG.isEmpty() : this.btG.equals(zzdVar.btG);
        }

        public int hashCode() {
            return ((this.btG == null || this.btG.isEmpty()) ? 0 : this.btG.hashCode()) + ((((((((getClass().getName().hashCode() + 527) * 31) + zzary.hashCode(this.zzwd)) * 31) + zzary.hashCode(this.zzwe)) * 31) + zzary.hashCode(this.zzwf)) * 31);
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzwd != null && this.zzwd.length > 0) {
                for (int i = 0; i < this.zzwd.length; i++) {
                    zzaj.zza zzaVar = this.zzwd[i];
                    if (zzaVar != null) {
                        zzartVar.zza(1, zzaVar);
                    }
                }
            }
            if (this.zzwe != null && this.zzwe.length > 0) {
                for (int i2 = 0; i2 < this.zzwe.length; i2++) {
                    zzaj.zza zzaVar2 = this.zzwe[i2];
                    if (zzaVar2 != null) {
                        zzartVar.zza(2, zzaVar2);
                    }
                }
            }
            if (this.zzwf != null && this.zzwf.length > 0) {
                for (int i3 = 0; i3 < this.zzwf.length; i3++) {
                    zzc zzcVar = this.zzwf[i3];
                    if (zzcVar != null) {
                        zzartVar.zza(3, zzcVar);
                    }
                }
            }
            super.zza(zzartVar);
        }

        public zzd zzah() {
            this.zzwd = zzaj.zza.zzar();
            this.zzwe = zzaj.zza.zzar();
            this.zzwf = zzc.zzaf();
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzq */
        public zzd zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        int zzc = zzasd.zzc(zzarsVar, 10);
                        int length = this.zzwd == null ? 0 : this.zzwd.length;
                        zzaj.zza[] zzaVarArr = new zzaj.zza[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.zzwd, 0, zzaVarArr, 0, length);
                        }
                        while (length < zzaVarArr.length - 1) {
                            zzaVarArr[length] = new zzaj.zza();
                            zzarsVar.zza(zzaVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzaVarArr[length] = new zzaj.zza();
                        zzarsVar.zza(zzaVarArr[length]);
                        this.zzwd = zzaVarArr;
                        break;
                    case 18:
                        int zzc2 = zzasd.zzc(zzarsVar, 18);
                        int length2 = this.zzwe == null ? 0 : this.zzwe.length;
                        zzaj.zza[] zzaVarArr2 = new zzaj.zza[zzc2 + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.zzwe, 0, zzaVarArr2, 0, length2);
                        }
                        while (length2 < zzaVarArr2.length - 1) {
                            zzaVarArr2[length2] = new zzaj.zza();
                            zzarsVar.zza(zzaVarArr2[length2]);
                            zzarsVar.bU();
                            length2++;
                        }
                        zzaVarArr2[length2] = new zzaj.zza();
                        zzarsVar.zza(zzaVarArr2[length2]);
                        this.zzwe = zzaVarArr2;
                        break;
                    case 26:
                        int zzc3 = zzasd.zzc(zzarsVar, 26);
                        int length3 = this.zzwf == null ? 0 : this.zzwf.length;
                        zzc[] zzcVarArr = new zzc[zzc3 + length3];
                        if (length3 != 0) {
                            System.arraycopy(this.zzwf, 0, zzcVarArr, 0, length3);
                        }
                        while (length3 < zzcVarArr.length - 1) {
                            zzcVarArr[length3] = new zzc();
                            zzarsVar.zza(zzcVarArr[length3]);
                            zzarsVar.bU();
                            length3++;
                        }
                        zzcVarArr[length3] = new zzc();
                        zzarsVar.zza(zzcVarArr[length3]);
                        this.zzwf = zzcVarArr;
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
            if (this.zzwd != null && this.zzwd.length > 0) {
                int i = zzx;
                for (int i2 = 0; i2 < this.zzwd.length; i2++) {
                    zzaj.zza zzaVar = this.zzwd[i2];
                    if (zzaVar != null) {
                        i += zzart.zzc(1, zzaVar);
                    }
                }
                zzx = i;
            }
            if (this.zzwe != null && this.zzwe.length > 0) {
                int i3 = zzx;
                for (int i4 = 0; i4 < this.zzwe.length; i4++) {
                    zzaj.zza zzaVar2 = this.zzwe[i4];
                    if (zzaVar2 != null) {
                        i3 += zzart.zzc(2, zzaVar2);
                    }
                }
                zzx = i3;
            }
            if (this.zzwf != null && this.zzwf.length > 0) {
                for (int i5 = 0; i5 < this.zzwf.length; i5++) {
                    zzc zzcVar = this.zzwf[i5];
                    if (zzcVar != null) {
                        zzx += zzart.zzc(3, zzcVar);
                    }
                }
            }
            return zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zze extends zzaru<zze> {
        private static volatile zze[] zzwg;
        public int key;
        public int value;

        public zze() {
            zzaj();
        }

        public static zze[] zzai() {
            if (zzwg == null) {
                synchronized (zzary.btO) {
                    if (zzwg == null) {
                        zzwg = new zze[0];
                    }
                }
            }
            return zzwg;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zze)) {
                return false;
            }
            zze zzeVar = (zze) obj;
            if (this.key != zzeVar.key || this.value != zzeVar.value) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzeVar.btG == null || zzeVar.btG.isEmpty() : this.btG.equals(zzeVar.btG);
        }

        public int hashCode() {
            return ((this.btG == null || this.btG.isEmpty()) ? 0 : this.btG.hashCode()) + ((((((getClass().getName().hashCode() + 527) * 31) + this.key) * 31) + this.value) * 31);
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            zzartVar.zzaf(1, this.key);
            zzartVar.zzaf(2, this.value);
            super.zza(zzartVar);
        }

        public zze zzaj() {
            this.key = 0;
            this.value = 0;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzr */
        public zze zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.key = zzarsVar.bY();
                        break;
                    case 16:
                        this.value = zzarsVar.bY();
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
            return super.zzx() + zzart.zzah(1, this.key) + zzart.zzah(2, this.value);
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzf extends zzaru<zzf> {
        public String version;
        public String[] zzwh;
        public String[] zzwi;
        public zzaj.zza[] zzwj;
        public zze[] zzwk;
        public zzb[] zzwl;
        public zzb[] zzwm;
        public zzb[] zzwn;
        public zzg[] zzwo;
        public String zzwp;
        public String zzwq;
        public String zzwr;
        public zza zzws;
        public float zzwt;
        public boolean zzwu;
        public String[] zzwv;
        public int zzww;

        public zzf() {
            zzak();
        }

        public static zzf zzf(byte[] bArr) throws zzarz {
            return (zzf) zzasa.zza(new zzf(), bArr);
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzf)) {
                return false;
            }
            zzf zzfVar = (zzf) obj;
            if (!zzary.equals(this.zzwh, zzfVar.zzwh) || !zzary.equals(this.zzwi, zzfVar.zzwi) || !zzary.equals(this.zzwj, zzfVar.zzwj) || !zzary.equals(this.zzwk, zzfVar.zzwk) || !zzary.equals(this.zzwl, zzfVar.zzwl) || !zzary.equals(this.zzwm, zzfVar.zzwm) || !zzary.equals(this.zzwn, zzfVar.zzwn) || !zzary.equals(this.zzwo, zzfVar.zzwo)) {
                return false;
            }
            if (this.zzwp == null) {
                if (zzfVar.zzwp != null) {
                    return false;
                }
            } else if (!this.zzwp.equals(zzfVar.zzwp)) {
                return false;
            }
            if (this.zzwq == null) {
                if (zzfVar.zzwq != null) {
                    return false;
                }
            } else if (!this.zzwq.equals(zzfVar.zzwq)) {
                return false;
            }
            if (this.zzwr == null) {
                if (zzfVar.zzwr != null) {
                    return false;
                }
            } else if (!this.zzwr.equals(zzfVar.zzwr)) {
                return false;
            }
            if (this.version == null) {
                if (zzfVar.version != null) {
                    return false;
                }
            } else if (!this.version.equals(zzfVar.version)) {
                return false;
            }
            if (this.zzws == null) {
                if (zzfVar.zzws != null) {
                    return false;
                }
            } else if (!this.zzws.equals(zzfVar.zzws)) {
                return false;
            }
            if (Float.floatToIntBits(this.zzwt) != Float.floatToIntBits(zzfVar.zzwt) || this.zzwu != zzfVar.zzwu || !zzary.equals(this.zzwv, zzfVar.zzwv) || this.zzww != zzfVar.zzww) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzfVar.btG == null || zzfVar.btG.isEmpty() : this.btG.equals(zzfVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((((((this.zzwu ? 1231 : 1237) + (((((this.zzws == null ? 0 : this.zzws.hashCode()) + (((this.version == null ? 0 : this.version.hashCode()) + (((this.zzwr == null ? 0 : this.zzwr.hashCode()) + (((this.zzwq == null ? 0 : this.zzwq.hashCode()) + (((this.zzwp == null ? 0 : this.zzwp.hashCode()) + ((((((((((((((((((getClass().getName().hashCode() + 527) * 31) + zzary.hashCode(this.zzwh)) * 31) + zzary.hashCode(this.zzwi)) * 31) + zzary.hashCode(this.zzwj)) * 31) + zzary.hashCode(this.zzwk)) * 31) + zzary.hashCode(this.zzwl)) * 31) + zzary.hashCode(this.zzwm)) * 31) + zzary.hashCode(this.zzwn)) * 31) + zzary.hashCode(this.zzwo)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31) + Float.floatToIntBits(this.zzwt)) * 31)) * 31) + zzary.hashCode(this.zzwv)) * 31) + this.zzww) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzwi != null && this.zzwi.length > 0) {
                for (int i = 0; i < this.zzwi.length; i++) {
                    String str = this.zzwi[i];
                    if (str != null) {
                        zzartVar.zzq(1, str);
                    }
                }
            }
            if (this.zzwj != null && this.zzwj.length > 0) {
                for (int i2 = 0; i2 < this.zzwj.length; i2++) {
                    zzaj.zza zzaVar = this.zzwj[i2];
                    if (zzaVar != null) {
                        zzartVar.zza(2, zzaVar);
                    }
                }
            }
            if (this.zzwk != null && this.zzwk.length > 0) {
                for (int i3 = 0; i3 < this.zzwk.length; i3++) {
                    zze zzeVar = this.zzwk[i3];
                    if (zzeVar != null) {
                        zzartVar.zza(3, zzeVar);
                    }
                }
            }
            if (this.zzwl != null && this.zzwl.length > 0) {
                for (int i4 = 0; i4 < this.zzwl.length; i4++) {
                    zzb zzbVar = this.zzwl[i4];
                    if (zzbVar != null) {
                        zzartVar.zza(4, zzbVar);
                    }
                }
            }
            if (this.zzwm != null && this.zzwm.length > 0) {
                for (int i5 = 0; i5 < this.zzwm.length; i5++) {
                    zzb zzbVar2 = this.zzwm[i5];
                    if (zzbVar2 != null) {
                        zzartVar.zza(5, zzbVar2);
                    }
                }
            }
            if (this.zzwn != null && this.zzwn.length > 0) {
                for (int i6 = 0; i6 < this.zzwn.length; i6++) {
                    zzb zzbVar3 = this.zzwn[i6];
                    if (zzbVar3 != null) {
                        zzartVar.zza(6, zzbVar3);
                    }
                }
            }
            if (this.zzwo != null && this.zzwo.length > 0) {
                for (int i7 = 0; i7 < this.zzwo.length; i7++) {
                    zzg zzgVar = this.zzwo[i7];
                    if (zzgVar != null) {
                        zzartVar.zza(7, zzgVar);
                    }
                }
            }
            if (this.zzwp != null && !this.zzwp.equals("")) {
                zzartVar.zzq(9, this.zzwp);
            }
            if (this.zzwq != null && !this.zzwq.equals("")) {
                zzartVar.zzq(10, this.zzwq);
            }
            if (this.zzwr != null && !this.zzwr.equals(AppEventsConstants.EVENT_PARAM_VALUE_NO)) {
                zzartVar.zzq(12, this.zzwr);
            }
            if (this.version != null && !this.version.equals("")) {
                zzartVar.zzq(13, this.version);
            }
            if (this.zzws != null) {
                zzartVar.zza(14, this.zzws);
            }
            if (Float.floatToIntBits(this.zzwt) != Float.floatToIntBits(0.0f)) {
                zzartVar.zzc(15, this.zzwt);
            }
            if (this.zzwv != null && this.zzwv.length > 0) {
                for (int i8 = 0; i8 < this.zzwv.length; i8++) {
                    String str2 = this.zzwv[i8];
                    if (str2 != null) {
                        zzartVar.zzq(16, str2);
                    }
                }
            }
            if (this.zzww != 0) {
                zzartVar.zzaf(17, this.zzww);
            }
            if (this.zzwu) {
                zzartVar.zzg(18, this.zzwu);
            }
            if (this.zzwh != null && this.zzwh.length > 0) {
                for (int i9 = 0; i9 < this.zzwh.length; i9++) {
                    String str3 = this.zzwh[i9];
                    if (str3 != null) {
                        zzartVar.zzq(19, str3);
                    }
                }
            }
            super.zza(zzartVar);
        }

        public zzf zzak() {
            this.zzwh = zzasd.btW;
            this.zzwi = zzasd.btW;
            this.zzwj = zzaj.zza.zzar();
            this.zzwk = zze.zzai();
            this.zzwl = zzb.zzad();
            this.zzwm = zzb.zzad();
            this.zzwn = zzb.zzad();
            this.zzwo = zzg.zzal();
            this.zzwp = "";
            this.zzwq = "";
            this.zzwr = AppEventsConstants.EVENT_PARAM_VALUE_NO;
            this.version = "";
            this.zzws = null;
            this.zzwt = 0.0f;
            this.zzwu = false;
            this.zzwv = zzasd.btW;
            this.zzww = 0;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzs */
        public zzf zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        int zzc = zzasd.zzc(zzarsVar, 10);
                        int length = this.zzwi == null ? 0 : this.zzwi.length;
                        String[] strArr = new String[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.zzwi, 0, strArr, 0, length);
                        }
                        while (length < strArr.length - 1) {
                            strArr[length] = zzarsVar.readString();
                            zzarsVar.bU();
                            length++;
                        }
                        strArr[length] = zzarsVar.readString();
                        this.zzwi = strArr;
                        break;
                    case 18:
                        int zzc2 = zzasd.zzc(zzarsVar, 18);
                        int length2 = this.zzwj == null ? 0 : this.zzwj.length;
                        zzaj.zza[] zzaVarArr = new zzaj.zza[zzc2 + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.zzwj, 0, zzaVarArr, 0, length2);
                        }
                        while (length2 < zzaVarArr.length - 1) {
                            zzaVarArr[length2] = new zzaj.zza();
                            zzarsVar.zza(zzaVarArr[length2]);
                            zzarsVar.bU();
                            length2++;
                        }
                        zzaVarArr[length2] = new zzaj.zza();
                        zzarsVar.zza(zzaVarArr[length2]);
                        this.zzwj = zzaVarArr;
                        break;
                    case 26:
                        int zzc3 = zzasd.zzc(zzarsVar, 26);
                        int length3 = this.zzwk == null ? 0 : this.zzwk.length;
                        zze[] zzeVarArr = new zze[zzc3 + length3];
                        if (length3 != 0) {
                            System.arraycopy(this.zzwk, 0, zzeVarArr, 0, length3);
                        }
                        while (length3 < zzeVarArr.length - 1) {
                            zzeVarArr[length3] = new zze();
                            zzarsVar.zza(zzeVarArr[length3]);
                            zzarsVar.bU();
                            length3++;
                        }
                        zzeVarArr[length3] = new zze();
                        zzarsVar.zza(zzeVarArr[length3]);
                        this.zzwk = zzeVarArr;
                        break;
                    case 34:
                        int zzc4 = zzasd.zzc(zzarsVar, 34);
                        int length4 = this.zzwl == null ? 0 : this.zzwl.length;
                        zzb[] zzbVarArr = new zzb[zzc4 + length4];
                        if (length4 != 0) {
                            System.arraycopy(this.zzwl, 0, zzbVarArr, 0, length4);
                        }
                        while (length4 < zzbVarArr.length - 1) {
                            zzbVarArr[length4] = new zzb();
                            zzarsVar.zza(zzbVarArr[length4]);
                            zzarsVar.bU();
                            length4++;
                        }
                        zzbVarArr[length4] = new zzb();
                        zzarsVar.zza(zzbVarArr[length4]);
                        this.zzwl = zzbVarArr;
                        break;
                    case 42:
                        int zzc5 = zzasd.zzc(zzarsVar, 42);
                        int length5 = this.zzwm == null ? 0 : this.zzwm.length;
                        zzb[] zzbVarArr2 = new zzb[zzc5 + length5];
                        if (length5 != 0) {
                            System.arraycopy(this.zzwm, 0, zzbVarArr2, 0, length5);
                        }
                        while (length5 < zzbVarArr2.length - 1) {
                            zzbVarArr2[length5] = new zzb();
                            zzarsVar.zza(zzbVarArr2[length5]);
                            zzarsVar.bU();
                            length5++;
                        }
                        zzbVarArr2[length5] = new zzb();
                        zzarsVar.zza(zzbVarArr2[length5]);
                        this.zzwm = zzbVarArr2;
                        break;
                    case 50:
                        int zzc6 = zzasd.zzc(zzarsVar, 50);
                        int length6 = this.zzwn == null ? 0 : this.zzwn.length;
                        zzb[] zzbVarArr3 = new zzb[zzc6 + length6];
                        if (length6 != 0) {
                            System.arraycopy(this.zzwn, 0, zzbVarArr3, 0, length6);
                        }
                        while (length6 < zzbVarArr3.length - 1) {
                            zzbVarArr3[length6] = new zzb();
                            zzarsVar.zza(zzbVarArr3[length6]);
                            zzarsVar.bU();
                            length6++;
                        }
                        zzbVarArr3[length6] = new zzb();
                        zzarsVar.zza(zzbVarArr3[length6]);
                        this.zzwn = zzbVarArr3;
                        break;
                    case 58:
                        int zzc7 = zzasd.zzc(zzarsVar, 58);
                        int length7 = this.zzwo == null ? 0 : this.zzwo.length;
                        zzg[] zzgVarArr = new zzg[zzc7 + length7];
                        if (length7 != 0) {
                            System.arraycopy(this.zzwo, 0, zzgVarArr, 0, length7);
                        }
                        while (length7 < zzgVarArr.length - 1) {
                            zzgVarArr[length7] = new zzg();
                            zzarsVar.zza(zzgVarArr[length7]);
                            zzarsVar.bU();
                            length7++;
                        }
                        zzgVarArr[length7] = new zzg();
                        zzarsVar.zza(zzgVarArr[length7]);
                        this.zzwo = zzgVarArr;
                        break;
                    case 74:
                        this.zzwp = zzarsVar.readString();
                        break;
                    case 82:
                        this.zzwq = zzarsVar.readString();
                        break;
                    case 98:
                        this.zzwr = zzarsVar.readString();
                        break;
                    case 106:
                        this.version = zzarsVar.readString();
                        break;
                    case 114:
                        if (this.zzws == null) {
                            this.zzws = new zza();
                        }
                        zzarsVar.zza(this.zzws);
                        break;
                    case 125:
                        this.zzwt = zzarsVar.readFloat();
                        break;
                    case 130:
                        int zzc8 = zzasd.zzc(zzarsVar, 130);
                        int length8 = this.zzwv == null ? 0 : this.zzwv.length;
                        String[] strArr2 = new String[zzc8 + length8];
                        if (length8 != 0) {
                            System.arraycopy(this.zzwv, 0, strArr2, 0, length8);
                        }
                        while (length8 < strArr2.length - 1) {
                            strArr2[length8] = zzarsVar.readString();
                            zzarsVar.bU();
                            length8++;
                        }
                        strArr2[length8] = zzarsVar.readString();
                        this.zzwv = strArr2;
                        break;
                    case 136:
                        this.zzww = zzarsVar.bY();
                        break;
                    case 144:
                        this.zzwu = zzarsVar.ca();
                        break;
                    case 154:
                        int zzc9 = zzasd.zzc(zzarsVar, 154);
                        int length9 = this.zzwh == null ? 0 : this.zzwh.length;
                        String[] strArr3 = new String[zzc9 + length9];
                        if (length9 != 0) {
                            System.arraycopy(this.zzwh, 0, strArr3, 0, length9);
                        }
                        while (length9 < strArr3.length - 1) {
                            strArr3[length9] = zzarsVar.readString();
                            zzarsVar.bU();
                            length9++;
                        }
                        strArr3[length9] = zzarsVar.readString();
                        this.zzwh = strArr3;
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
            int i;
            int zzx = super.zzx();
            if (this.zzwi == null || this.zzwi.length <= 0) {
                i = zzx;
            } else {
                int i2 = 0;
                int i3 = 0;
                for (int i4 = 0; i4 < this.zzwi.length; i4++) {
                    String str = this.zzwi[i4];
                    if (str != null) {
                        i3++;
                        i2 += zzart.zzuy(str);
                    }
                }
                i = zzx + i2 + (i3 * 1);
            }
            if (this.zzwj != null && this.zzwj.length > 0) {
                int i5 = i;
                for (int i6 = 0; i6 < this.zzwj.length; i6++) {
                    zzaj.zza zzaVar = this.zzwj[i6];
                    if (zzaVar != null) {
                        i5 += zzart.zzc(2, zzaVar);
                    }
                }
                i = i5;
            }
            if (this.zzwk != null && this.zzwk.length > 0) {
                int i7 = i;
                for (int i8 = 0; i8 < this.zzwk.length; i8++) {
                    zze zzeVar = this.zzwk[i8];
                    if (zzeVar != null) {
                        i7 += zzart.zzc(3, zzeVar);
                    }
                }
                i = i7;
            }
            if (this.zzwl != null && this.zzwl.length > 0) {
                int i9 = i;
                for (int i10 = 0; i10 < this.zzwl.length; i10++) {
                    zzb zzbVar = this.zzwl[i10];
                    if (zzbVar != null) {
                        i9 += zzart.zzc(4, zzbVar);
                    }
                }
                i = i9;
            }
            if (this.zzwm != null && this.zzwm.length > 0) {
                int i11 = i;
                for (int i12 = 0; i12 < this.zzwm.length; i12++) {
                    zzb zzbVar2 = this.zzwm[i12];
                    if (zzbVar2 != null) {
                        i11 += zzart.zzc(5, zzbVar2);
                    }
                }
                i = i11;
            }
            if (this.zzwn != null && this.zzwn.length > 0) {
                int i13 = i;
                for (int i14 = 0; i14 < this.zzwn.length; i14++) {
                    zzb zzbVar3 = this.zzwn[i14];
                    if (zzbVar3 != null) {
                        i13 += zzart.zzc(6, zzbVar3);
                    }
                }
                i = i13;
            }
            if (this.zzwo != null && this.zzwo.length > 0) {
                int i15 = i;
                for (int i16 = 0; i16 < this.zzwo.length; i16++) {
                    zzg zzgVar = this.zzwo[i16];
                    if (zzgVar != null) {
                        i15 += zzart.zzc(7, zzgVar);
                    }
                }
                i = i15;
            }
            if (this.zzwp != null && !this.zzwp.equals("")) {
                i += zzart.zzr(9, this.zzwp);
            }
            if (this.zzwq != null && !this.zzwq.equals("")) {
                i += zzart.zzr(10, this.zzwq);
            }
            if (this.zzwr != null && !this.zzwr.equals(AppEventsConstants.EVENT_PARAM_VALUE_NO)) {
                i += zzart.zzr(12, this.zzwr);
            }
            if (this.version != null && !this.version.equals("")) {
                i += zzart.zzr(13, this.version);
            }
            if (this.zzws != null) {
                i += zzart.zzc(14, this.zzws);
            }
            if (Float.floatToIntBits(this.zzwt) != Float.floatToIntBits(0.0f)) {
                i += zzart.zzd(15, this.zzwt);
            }
            if (this.zzwv != null && this.zzwv.length > 0) {
                int i17 = 0;
                int i18 = 0;
                for (int i19 = 0; i19 < this.zzwv.length; i19++) {
                    String str2 = this.zzwv[i19];
                    if (str2 != null) {
                        i18++;
                        i17 += zzart.zzuy(str2);
                    }
                }
                i = i + i17 + (i18 * 2);
            }
            if (this.zzww != 0) {
                i += zzart.zzah(17, this.zzww);
            }
            if (this.zzwu) {
                i += zzart.zzh(18, this.zzwu);
            }
            if (this.zzwh == null || this.zzwh.length <= 0) {
                return i;
            }
            int i20 = 0;
            int i21 = 0;
            for (int i22 = 0; i22 < this.zzwh.length; i22++) {
                String str3 = this.zzwh[i22];
                if (str3 != null) {
                    i21++;
                    i20 += zzart.zzuy(str3);
                }
            }
            return i + i20 + (i21 * 2);
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzg extends zzaru<zzg> {
        private static volatile zzg[] zzwx;
        public int[] zzwy;
        public int[] zzwz;
        public int[] zzxa;
        public int[] zzxb;
        public int[] zzxc;
        public int[] zzxd;
        public int[] zzxe;
        public int[] zzxf;
        public int[] zzxg;
        public int[] zzxh;

        public zzg() {
            zzam();
        }

        public static zzg[] zzal() {
            if (zzwx == null) {
                synchronized (zzary.btO) {
                    if (zzwx == null) {
                        zzwx = new zzg[0];
                    }
                }
            }
            return zzwx;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzg)) {
                return false;
            }
            zzg zzgVar = (zzg) obj;
            if (!zzary.equals(this.zzwy, zzgVar.zzwy) || !zzary.equals(this.zzwz, zzgVar.zzwz) || !zzary.equals(this.zzxa, zzgVar.zzxa) || !zzary.equals(this.zzxb, zzgVar.zzxb) || !zzary.equals(this.zzxc, zzgVar.zzxc) || !zzary.equals(this.zzxd, zzgVar.zzxd) || !zzary.equals(this.zzxe, zzgVar.zzxe) || !zzary.equals(this.zzxf, zzgVar.zzxf) || !zzary.equals(this.zzxg, zzgVar.zzxg) || !zzary.equals(this.zzxh, zzgVar.zzxh)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzgVar.btG == null || zzgVar.btG.isEmpty() : this.btG.equals(zzgVar.btG);
        }

        public int hashCode() {
            return ((this.btG == null || this.btG.isEmpty()) ? 0 : this.btG.hashCode()) + ((((((((((((((((((((((getClass().getName().hashCode() + 527) * 31) + zzary.hashCode(this.zzwy)) * 31) + zzary.hashCode(this.zzwz)) * 31) + zzary.hashCode(this.zzxa)) * 31) + zzary.hashCode(this.zzxb)) * 31) + zzary.hashCode(this.zzxc)) * 31) + zzary.hashCode(this.zzxd)) * 31) + zzary.hashCode(this.zzxe)) * 31) + zzary.hashCode(this.zzxf)) * 31) + zzary.hashCode(this.zzxg)) * 31) + zzary.hashCode(this.zzxh)) * 31);
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzwy != null && this.zzwy.length > 0) {
                for (int i = 0; i < this.zzwy.length; i++) {
                    zzartVar.zzaf(1, this.zzwy[i]);
                }
            }
            if (this.zzwz != null && this.zzwz.length > 0) {
                for (int i2 = 0; i2 < this.zzwz.length; i2++) {
                    zzartVar.zzaf(2, this.zzwz[i2]);
                }
            }
            if (this.zzxa != null && this.zzxa.length > 0) {
                for (int i3 = 0; i3 < this.zzxa.length; i3++) {
                    zzartVar.zzaf(3, this.zzxa[i3]);
                }
            }
            if (this.zzxb != null && this.zzxb.length > 0) {
                for (int i4 = 0; i4 < this.zzxb.length; i4++) {
                    zzartVar.zzaf(4, this.zzxb[i4]);
                }
            }
            if (this.zzxc != null && this.zzxc.length > 0) {
                for (int i5 = 0; i5 < this.zzxc.length; i5++) {
                    zzartVar.zzaf(5, this.zzxc[i5]);
                }
            }
            if (this.zzxd != null && this.zzxd.length > 0) {
                for (int i6 = 0; i6 < this.zzxd.length; i6++) {
                    zzartVar.zzaf(6, this.zzxd[i6]);
                }
            }
            if (this.zzxe != null && this.zzxe.length > 0) {
                for (int i7 = 0; i7 < this.zzxe.length; i7++) {
                    zzartVar.zzaf(7, this.zzxe[i7]);
                }
            }
            if (this.zzxf != null && this.zzxf.length > 0) {
                for (int i8 = 0; i8 < this.zzxf.length; i8++) {
                    zzartVar.zzaf(8, this.zzxf[i8]);
                }
            }
            if (this.zzxg != null && this.zzxg.length > 0) {
                for (int i9 = 0; i9 < this.zzxg.length; i9++) {
                    zzartVar.zzaf(9, this.zzxg[i9]);
                }
            }
            if (this.zzxh != null && this.zzxh.length > 0) {
                for (int i10 = 0; i10 < this.zzxh.length; i10++) {
                    zzartVar.zzaf(10, this.zzxh[i10]);
                }
            }
            super.zza(zzartVar);
        }

        public zzg zzam() {
            this.zzwy = zzasd.btR;
            this.zzwz = zzasd.btR;
            this.zzxa = zzasd.btR;
            this.zzxb = zzasd.btR;
            this.zzxc = zzasd.btR;
            this.zzxd = zzasd.btR;
            this.zzxe = zzasd.btR;
            this.zzxf = zzasd.btR;
            this.zzxg = zzasd.btR;
            this.zzxh = zzasd.btR;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzt */
        public zzg zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        int zzc = zzasd.zzc(zzarsVar, 8);
                        int length = this.zzwy == null ? 0 : this.zzwy.length;
                        int[] iArr = new int[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.zzwy, 0, iArr, 0, length);
                        }
                        while (length < iArr.length - 1) {
                            iArr[length] = zzarsVar.bY();
                            zzarsVar.bU();
                            length++;
                        }
                        iArr[length] = zzarsVar.bY();
                        this.zzwy = iArr;
                        break;
                    case 10:
                        int zzagt = zzarsVar.zzagt(zzarsVar.cd());
                        int position = zzarsVar.getPosition();
                        int i = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i++;
                        }
                        zzarsVar.zzagv(position);
                        int length2 = this.zzwy == null ? 0 : this.zzwy.length;
                        int[] iArr2 = new int[i + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.zzwy, 0, iArr2, 0, length2);
                        }
                        while (length2 < iArr2.length) {
                            iArr2[length2] = zzarsVar.bY();
                            length2++;
                        }
                        this.zzwy = iArr2;
                        zzarsVar.zzagu(zzagt);
                        break;
                    case 16:
                        int zzc2 = zzasd.zzc(zzarsVar, 16);
                        int length3 = this.zzwz == null ? 0 : this.zzwz.length;
                        int[] iArr3 = new int[zzc2 + length3];
                        if (length3 != 0) {
                            System.arraycopy(this.zzwz, 0, iArr3, 0, length3);
                        }
                        while (length3 < iArr3.length - 1) {
                            iArr3[length3] = zzarsVar.bY();
                            zzarsVar.bU();
                            length3++;
                        }
                        iArr3[length3] = zzarsVar.bY();
                        this.zzwz = iArr3;
                        break;
                    case 18:
                        int zzagt2 = zzarsVar.zzagt(zzarsVar.cd());
                        int position2 = zzarsVar.getPosition();
                        int i2 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i2++;
                        }
                        zzarsVar.zzagv(position2);
                        int length4 = this.zzwz == null ? 0 : this.zzwz.length;
                        int[] iArr4 = new int[i2 + length4];
                        if (length4 != 0) {
                            System.arraycopy(this.zzwz, 0, iArr4, 0, length4);
                        }
                        while (length4 < iArr4.length) {
                            iArr4[length4] = zzarsVar.bY();
                            length4++;
                        }
                        this.zzwz = iArr4;
                        zzarsVar.zzagu(zzagt2);
                        break;
                    case 24:
                        int zzc3 = zzasd.zzc(zzarsVar, 24);
                        int length5 = this.zzxa == null ? 0 : this.zzxa.length;
                        int[] iArr5 = new int[zzc3 + length5];
                        if (length5 != 0) {
                            System.arraycopy(this.zzxa, 0, iArr5, 0, length5);
                        }
                        while (length5 < iArr5.length - 1) {
                            iArr5[length5] = zzarsVar.bY();
                            zzarsVar.bU();
                            length5++;
                        }
                        iArr5[length5] = zzarsVar.bY();
                        this.zzxa = iArr5;
                        break;
                    case 26:
                        int zzagt3 = zzarsVar.zzagt(zzarsVar.cd());
                        int position3 = zzarsVar.getPosition();
                        int i3 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i3++;
                        }
                        zzarsVar.zzagv(position3);
                        int length6 = this.zzxa == null ? 0 : this.zzxa.length;
                        int[] iArr6 = new int[i3 + length6];
                        if (length6 != 0) {
                            System.arraycopy(this.zzxa, 0, iArr6, 0, length6);
                        }
                        while (length6 < iArr6.length) {
                            iArr6[length6] = zzarsVar.bY();
                            length6++;
                        }
                        this.zzxa = iArr6;
                        zzarsVar.zzagu(zzagt3);
                        break;
                    case 32:
                        int zzc4 = zzasd.zzc(zzarsVar, 32);
                        int length7 = this.zzxb == null ? 0 : this.zzxb.length;
                        int[] iArr7 = new int[zzc4 + length7];
                        if (length7 != 0) {
                            System.arraycopy(this.zzxb, 0, iArr7, 0, length7);
                        }
                        while (length7 < iArr7.length - 1) {
                            iArr7[length7] = zzarsVar.bY();
                            zzarsVar.bU();
                            length7++;
                        }
                        iArr7[length7] = zzarsVar.bY();
                        this.zzxb = iArr7;
                        break;
                    case 34:
                        int zzagt4 = zzarsVar.zzagt(zzarsVar.cd());
                        int position4 = zzarsVar.getPosition();
                        int i4 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i4++;
                        }
                        zzarsVar.zzagv(position4);
                        int length8 = this.zzxb == null ? 0 : this.zzxb.length;
                        int[] iArr8 = new int[i4 + length8];
                        if (length8 != 0) {
                            System.arraycopy(this.zzxb, 0, iArr8, 0, length8);
                        }
                        while (length8 < iArr8.length) {
                            iArr8[length8] = zzarsVar.bY();
                            length8++;
                        }
                        this.zzxb = iArr8;
                        zzarsVar.zzagu(zzagt4);
                        break;
                    case 40:
                        int zzc5 = zzasd.zzc(zzarsVar, 40);
                        int length9 = this.zzxc == null ? 0 : this.zzxc.length;
                        int[] iArr9 = new int[zzc5 + length9];
                        if (length9 != 0) {
                            System.arraycopy(this.zzxc, 0, iArr9, 0, length9);
                        }
                        while (length9 < iArr9.length - 1) {
                            iArr9[length9] = zzarsVar.bY();
                            zzarsVar.bU();
                            length9++;
                        }
                        iArr9[length9] = zzarsVar.bY();
                        this.zzxc = iArr9;
                        break;
                    case 42:
                        int zzagt5 = zzarsVar.zzagt(zzarsVar.cd());
                        int position5 = zzarsVar.getPosition();
                        int i5 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i5++;
                        }
                        zzarsVar.zzagv(position5);
                        int length10 = this.zzxc == null ? 0 : this.zzxc.length;
                        int[] iArr10 = new int[i5 + length10];
                        if (length10 != 0) {
                            System.arraycopy(this.zzxc, 0, iArr10, 0, length10);
                        }
                        while (length10 < iArr10.length) {
                            iArr10[length10] = zzarsVar.bY();
                            length10++;
                        }
                        this.zzxc = iArr10;
                        zzarsVar.zzagu(zzagt5);
                        break;
                    case 48:
                        int zzc6 = zzasd.zzc(zzarsVar, 48);
                        int length11 = this.zzxd == null ? 0 : this.zzxd.length;
                        int[] iArr11 = new int[zzc6 + length11];
                        if (length11 != 0) {
                            System.arraycopy(this.zzxd, 0, iArr11, 0, length11);
                        }
                        while (length11 < iArr11.length - 1) {
                            iArr11[length11] = zzarsVar.bY();
                            zzarsVar.bU();
                            length11++;
                        }
                        iArr11[length11] = zzarsVar.bY();
                        this.zzxd = iArr11;
                        break;
                    case 50:
                        int zzagt6 = zzarsVar.zzagt(zzarsVar.cd());
                        int position6 = zzarsVar.getPosition();
                        int i6 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i6++;
                        }
                        zzarsVar.zzagv(position6);
                        int length12 = this.zzxd == null ? 0 : this.zzxd.length;
                        int[] iArr12 = new int[i6 + length12];
                        if (length12 != 0) {
                            System.arraycopy(this.zzxd, 0, iArr12, 0, length12);
                        }
                        while (length12 < iArr12.length) {
                            iArr12[length12] = zzarsVar.bY();
                            length12++;
                        }
                        this.zzxd = iArr12;
                        zzarsVar.zzagu(zzagt6);
                        break;
                    case 56:
                        int zzc7 = zzasd.zzc(zzarsVar, 56);
                        int length13 = this.zzxe == null ? 0 : this.zzxe.length;
                        int[] iArr13 = new int[zzc7 + length13];
                        if (length13 != 0) {
                            System.arraycopy(this.zzxe, 0, iArr13, 0, length13);
                        }
                        while (length13 < iArr13.length - 1) {
                            iArr13[length13] = zzarsVar.bY();
                            zzarsVar.bU();
                            length13++;
                        }
                        iArr13[length13] = zzarsVar.bY();
                        this.zzxe = iArr13;
                        break;
                    case 58:
                        int zzagt7 = zzarsVar.zzagt(zzarsVar.cd());
                        int position7 = zzarsVar.getPosition();
                        int i7 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i7++;
                        }
                        zzarsVar.zzagv(position7);
                        int length14 = this.zzxe == null ? 0 : this.zzxe.length;
                        int[] iArr14 = new int[i7 + length14];
                        if (length14 != 0) {
                            System.arraycopy(this.zzxe, 0, iArr14, 0, length14);
                        }
                        while (length14 < iArr14.length) {
                            iArr14[length14] = zzarsVar.bY();
                            length14++;
                        }
                        this.zzxe = iArr14;
                        zzarsVar.zzagu(zzagt7);
                        break;
                    case 64:
                        int zzc8 = zzasd.zzc(zzarsVar, 64);
                        int length15 = this.zzxf == null ? 0 : this.zzxf.length;
                        int[] iArr15 = new int[zzc8 + length15];
                        if (length15 != 0) {
                            System.arraycopy(this.zzxf, 0, iArr15, 0, length15);
                        }
                        while (length15 < iArr15.length - 1) {
                            iArr15[length15] = zzarsVar.bY();
                            zzarsVar.bU();
                            length15++;
                        }
                        iArr15[length15] = zzarsVar.bY();
                        this.zzxf = iArr15;
                        break;
                    case 66:
                        int zzagt8 = zzarsVar.zzagt(zzarsVar.cd());
                        int position8 = zzarsVar.getPosition();
                        int i8 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i8++;
                        }
                        zzarsVar.zzagv(position8);
                        int length16 = this.zzxf == null ? 0 : this.zzxf.length;
                        int[] iArr16 = new int[i8 + length16];
                        if (length16 != 0) {
                            System.arraycopy(this.zzxf, 0, iArr16, 0, length16);
                        }
                        while (length16 < iArr16.length) {
                            iArr16[length16] = zzarsVar.bY();
                            length16++;
                        }
                        this.zzxf = iArr16;
                        zzarsVar.zzagu(zzagt8);
                        break;
                    case 72:
                        int zzc9 = zzasd.zzc(zzarsVar, 72);
                        int length17 = this.zzxg == null ? 0 : this.zzxg.length;
                        int[] iArr17 = new int[zzc9 + length17];
                        if (length17 != 0) {
                            System.arraycopy(this.zzxg, 0, iArr17, 0, length17);
                        }
                        while (length17 < iArr17.length - 1) {
                            iArr17[length17] = zzarsVar.bY();
                            zzarsVar.bU();
                            length17++;
                        }
                        iArr17[length17] = zzarsVar.bY();
                        this.zzxg = iArr17;
                        break;
                    case 74:
                        int zzagt9 = zzarsVar.zzagt(zzarsVar.cd());
                        int position9 = zzarsVar.getPosition();
                        int i9 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i9++;
                        }
                        zzarsVar.zzagv(position9);
                        int length18 = this.zzxg == null ? 0 : this.zzxg.length;
                        int[] iArr18 = new int[i9 + length18];
                        if (length18 != 0) {
                            System.arraycopy(this.zzxg, 0, iArr18, 0, length18);
                        }
                        while (length18 < iArr18.length) {
                            iArr18[length18] = zzarsVar.bY();
                            length18++;
                        }
                        this.zzxg = iArr18;
                        zzarsVar.zzagu(zzagt9);
                        break;
                    case 80:
                        int zzc10 = zzasd.zzc(zzarsVar, 80);
                        int length19 = this.zzxh == null ? 0 : this.zzxh.length;
                        int[] iArr19 = new int[zzc10 + length19];
                        if (length19 != 0) {
                            System.arraycopy(this.zzxh, 0, iArr19, 0, length19);
                        }
                        while (length19 < iArr19.length - 1) {
                            iArr19[length19] = zzarsVar.bY();
                            zzarsVar.bU();
                            length19++;
                        }
                        iArr19[length19] = zzarsVar.bY();
                        this.zzxh = iArr19;
                        break;
                    case 82:
                        int zzagt10 = zzarsVar.zzagt(zzarsVar.cd());
                        int position10 = zzarsVar.getPosition();
                        int i10 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i10++;
                        }
                        zzarsVar.zzagv(position10);
                        int length20 = this.zzxh == null ? 0 : this.zzxh.length;
                        int[] iArr20 = new int[i10 + length20];
                        if (length20 != 0) {
                            System.arraycopy(this.zzxh, 0, iArr20, 0, length20);
                        }
                        while (length20 < iArr20.length) {
                            iArr20[length20] = zzarsVar.bY();
                            length20++;
                        }
                        this.zzxh = iArr20;
                        zzarsVar.zzagu(zzagt10);
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
            int i;
            int zzx = super.zzx();
            if (this.zzwy == null || this.zzwy.length <= 0) {
                i = zzx;
            } else {
                int i2 = 0;
                for (int i3 = 0; i3 < this.zzwy.length; i3++) {
                    i2 += zzart.zzagz(this.zzwy[i3]);
                }
                i = zzx + i2 + (this.zzwy.length * 1);
            }
            if (this.zzwz != null && this.zzwz.length > 0) {
                int i4 = 0;
                for (int i5 = 0; i5 < this.zzwz.length; i5++) {
                    i4 += zzart.zzagz(this.zzwz[i5]);
                }
                i = i + i4 + (this.zzwz.length * 1);
            }
            if (this.zzxa != null && this.zzxa.length > 0) {
                int i6 = 0;
                for (int i7 = 0; i7 < this.zzxa.length; i7++) {
                    i6 += zzart.zzagz(this.zzxa[i7]);
                }
                i = i + i6 + (this.zzxa.length * 1);
            }
            if (this.zzxb != null && this.zzxb.length > 0) {
                int i8 = 0;
                for (int i9 = 0; i9 < this.zzxb.length; i9++) {
                    i8 += zzart.zzagz(this.zzxb[i9]);
                }
                i = i + i8 + (this.zzxb.length * 1);
            }
            if (this.zzxc != null && this.zzxc.length > 0) {
                int i10 = 0;
                for (int i11 = 0; i11 < this.zzxc.length; i11++) {
                    i10 += zzart.zzagz(this.zzxc[i11]);
                }
                i = i + i10 + (this.zzxc.length * 1);
            }
            if (this.zzxd != null && this.zzxd.length > 0) {
                int i12 = 0;
                for (int i13 = 0; i13 < this.zzxd.length; i13++) {
                    i12 += zzart.zzagz(this.zzxd[i13]);
                }
                i = i + i12 + (this.zzxd.length * 1);
            }
            if (this.zzxe != null && this.zzxe.length > 0) {
                int i14 = 0;
                for (int i15 = 0; i15 < this.zzxe.length; i15++) {
                    i14 += zzart.zzagz(this.zzxe[i15]);
                }
                i = i + i14 + (this.zzxe.length * 1);
            }
            if (this.zzxf != null && this.zzxf.length > 0) {
                int i16 = 0;
                for (int i17 = 0; i17 < this.zzxf.length; i17++) {
                    i16 += zzart.zzagz(this.zzxf[i17]);
                }
                i = i + i16 + (this.zzxf.length * 1);
            }
            if (this.zzxg != null && this.zzxg.length > 0) {
                int i18 = 0;
                for (int i19 = 0; i19 < this.zzxg.length; i19++) {
                    i18 += zzart.zzagz(this.zzxg[i19]);
                }
                i = i + i18 + (this.zzxg.length * 1);
            }
            if (this.zzxh == null || this.zzxh.length <= 0) {
                return i;
            }
            int i20 = 0;
            for (int i21 = 0; i21 < this.zzxh.length; i21++) {
                i20 += zzart.zzagz(this.zzxh[i21]);
            }
            return i + i20 + (this.zzxh.length * 1);
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzh extends zzaru<zzh> {
        public static final zzarv<zzaj.zza, zzh> zzxi = zzarv.zza(11, zzh.class, 810);
        private static final zzh[] zzxj = new zzh[0];
        public int[] zzxk;
        public int[] zzxl;
        public int[] zzxm;
        public int zzxn;
        public int[] zzxo;
        public int zzxp;
        public int zzxq;

        public zzh() {
            zzan();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzh)) {
                return false;
            }
            zzh zzhVar = (zzh) obj;
            if (!zzary.equals(this.zzxk, zzhVar.zzxk) || !zzary.equals(this.zzxl, zzhVar.zzxl) || !zzary.equals(this.zzxm, zzhVar.zzxm) || this.zzxn != zzhVar.zzxn || !zzary.equals(this.zzxo, zzhVar.zzxo) || this.zzxp != zzhVar.zzxp || this.zzxq != zzhVar.zzxq) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzhVar.btG == null || zzhVar.btG.isEmpty() : this.btG.equals(zzhVar.btG);
        }

        public int hashCode() {
            return ((this.btG == null || this.btG.isEmpty()) ? 0 : this.btG.hashCode()) + ((((((((((((((((getClass().getName().hashCode() + 527) * 31) + zzary.hashCode(this.zzxk)) * 31) + zzary.hashCode(this.zzxl)) * 31) + zzary.hashCode(this.zzxm)) * 31) + this.zzxn) * 31) + zzary.hashCode(this.zzxo)) * 31) + this.zzxp) * 31) + this.zzxq) * 31);
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzxk != null && this.zzxk.length > 0) {
                for (int i = 0; i < this.zzxk.length; i++) {
                    zzartVar.zzaf(1, this.zzxk[i]);
                }
            }
            if (this.zzxl != null && this.zzxl.length > 0) {
                for (int i2 = 0; i2 < this.zzxl.length; i2++) {
                    zzartVar.zzaf(2, this.zzxl[i2]);
                }
            }
            if (this.zzxm != null && this.zzxm.length > 0) {
                for (int i3 = 0; i3 < this.zzxm.length; i3++) {
                    zzartVar.zzaf(3, this.zzxm[i3]);
                }
            }
            if (this.zzxn != 0) {
                zzartVar.zzaf(4, this.zzxn);
            }
            if (this.zzxo != null && this.zzxo.length > 0) {
                for (int i4 = 0; i4 < this.zzxo.length; i4++) {
                    zzartVar.zzaf(5, this.zzxo[i4]);
                }
            }
            if (this.zzxp != 0) {
                zzartVar.zzaf(6, this.zzxp);
            }
            if (this.zzxq != 0) {
                zzartVar.zzaf(7, this.zzxq);
            }
            super.zza(zzartVar);
        }

        public zzh zzan() {
            this.zzxk = zzasd.btR;
            this.zzxl = zzasd.btR;
            this.zzxm = zzasd.btR;
            this.zzxn = 0;
            this.zzxo = zzasd.btR;
            this.zzxp = 0;
            this.zzxq = 0;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzu */
        public zzh zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        int zzc = zzasd.zzc(zzarsVar, 8);
                        int length = this.zzxk == null ? 0 : this.zzxk.length;
                        int[] iArr = new int[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.zzxk, 0, iArr, 0, length);
                        }
                        while (length < iArr.length - 1) {
                            iArr[length] = zzarsVar.bY();
                            zzarsVar.bU();
                            length++;
                        }
                        iArr[length] = zzarsVar.bY();
                        this.zzxk = iArr;
                        break;
                    case 10:
                        int zzagt = zzarsVar.zzagt(zzarsVar.cd());
                        int position = zzarsVar.getPosition();
                        int i = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i++;
                        }
                        zzarsVar.zzagv(position);
                        int length2 = this.zzxk == null ? 0 : this.zzxk.length;
                        int[] iArr2 = new int[i + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.zzxk, 0, iArr2, 0, length2);
                        }
                        while (length2 < iArr2.length) {
                            iArr2[length2] = zzarsVar.bY();
                            length2++;
                        }
                        this.zzxk = iArr2;
                        zzarsVar.zzagu(zzagt);
                        break;
                    case 16:
                        int zzc2 = zzasd.zzc(zzarsVar, 16);
                        int length3 = this.zzxl == null ? 0 : this.zzxl.length;
                        int[] iArr3 = new int[zzc2 + length3];
                        if (length3 != 0) {
                            System.arraycopy(this.zzxl, 0, iArr3, 0, length3);
                        }
                        while (length3 < iArr3.length - 1) {
                            iArr3[length3] = zzarsVar.bY();
                            zzarsVar.bU();
                            length3++;
                        }
                        iArr3[length3] = zzarsVar.bY();
                        this.zzxl = iArr3;
                        break;
                    case 18:
                        int zzagt2 = zzarsVar.zzagt(zzarsVar.cd());
                        int position2 = zzarsVar.getPosition();
                        int i2 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i2++;
                        }
                        zzarsVar.zzagv(position2);
                        int length4 = this.zzxl == null ? 0 : this.zzxl.length;
                        int[] iArr4 = new int[i2 + length4];
                        if (length4 != 0) {
                            System.arraycopy(this.zzxl, 0, iArr4, 0, length4);
                        }
                        while (length4 < iArr4.length) {
                            iArr4[length4] = zzarsVar.bY();
                            length4++;
                        }
                        this.zzxl = iArr4;
                        zzarsVar.zzagu(zzagt2);
                        break;
                    case 24:
                        int zzc3 = zzasd.zzc(zzarsVar, 24);
                        int length5 = this.zzxm == null ? 0 : this.zzxm.length;
                        int[] iArr5 = new int[zzc3 + length5];
                        if (length5 != 0) {
                            System.arraycopy(this.zzxm, 0, iArr5, 0, length5);
                        }
                        while (length5 < iArr5.length - 1) {
                            iArr5[length5] = zzarsVar.bY();
                            zzarsVar.bU();
                            length5++;
                        }
                        iArr5[length5] = zzarsVar.bY();
                        this.zzxm = iArr5;
                        break;
                    case 26:
                        int zzagt3 = zzarsVar.zzagt(zzarsVar.cd());
                        int position3 = zzarsVar.getPosition();
                        int i3 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i3++;
                        }
                        zzarsVar.zzagv(position3);
                        int length6 = this.zzxm == null ? 0 : this.zzxm.length;
                        int[] iArr6 = new int[i3 + length6];
                        if (length6 != 0) {
                            System.arraycopy(this.zzxm, 0, iArr6, 0, length6);
                        }
                        while (length6 < iArr6.length) {
                            iArr6[length6] = zzarsVar.bY();
                            length6++;
                        }
                        this.zzxm = iArr6;
                        zzarsVar.zzagu(zzagt3);
                        break;
                    case 32:
                        this.zzxn = zzarsVar.bY();
                        break;
                    case 40:
                        int zzc4 = zzasd.zzc(zzarsVar, 40);
                        int length7 = this.zzxo == null ? 0 : this.zzxo.length;
                        int[] iArr7 = new int[zzc4 + length7];
                        if (length7 != 0) {
                            System.arraycopy(this.zzxo, 0, iArr7, 0, length7);
                        }
                        while (length7 < iArr7.length - 1) {
                            iArr7[length7] = zzarsVar.bY();
                            zzarsVar.bU();
                            length7++;
                        }
                        iArr7[length7] = zzarsVar.bY();
                        this.zzxo = iArr7;
                        break;
                    case 42:
                        int zzagt4 = zzarsVar.zzagt(zzarsVar.cd());
                        int position4 = zzarsVar.getPosition();
                        int i4 = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i4++;
                        }
                        zzarsVar.zzagv(position4);
                        int length8 = this.zzxo == null ? 0 : this.zzxo.length;
                        int[] iArr8 = new int[i4 + length8];
                        if (length8 != 0) {
                            System.arraycopy(this.zzxo, 0, iArr8, 0, length8);
                        }
                        while (length8 < iArr8.length) {
                            iArr8[length8] = zzarsVar.bY();
                            length8++;
                        }
                        this.zzxo = iArr8;
                        zzarsVar.zzagu(zzagt4);
                        break;
                    case 48:
                        this.zzxp = zzarsVar.bY();
                        break;
                    case 56:
                        this.zzxq = zzarsVar.bY();
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
            int i;
            int zzx = super.zzx();
            if (this.zzxk == null || this.zzxk.length <= 0) {
                i = zzx;
            } else {
                int i2 = 0;
                for (int i3 = 0; i3 < this.zzxk.length; i3++) {
                    i2 += zzart.zzagz(this.zzxk[i3]);
                }
                i = zzx + i2 + (this.zzxk.length * 1);
            }
            if (this.zzxl != null && this.zzxl.length > 0) {
                int i4 = 0;
                for (int i5 = 0; i5 < this.zzxl.length; i5++) {
                    i4 += zzart.zzagz(this.zzxl[i5]);
                }
                i = i + i4 + (this.zzxl.length * 1);
            }
            if (this.zzxm != null && this.zzxm.length > 0) {
                int i6 = 0;
                for (int i7 = 0; i7 < this.zzxm.length; i7++) {
                    i6 += zzart.zzagz(this.zzxm[i7]);
                }
                i = i + i6 + (this.zzxm.length * 1);
            }
            if (this.zzxn != 0) {
                i += zzart.zzah(4, this.zzxn);
            }
            if (this.zzxo != null && this.zzxo.length > 0) {
                int i8 = 0;
                for (int i9 = 0; i9 < this.zzxo.length; i9++) {
                    i8 += zzart.zzagz(this.zzxo[i9]);
                }
                i = i + i8 + (this.zzxo.length * 1);
            }
            if (this.zzxp != 0) {
                i += zzart.zzah(6, this.zzxp);
            }
            return this.zzxq != 0 ? i + zzart.zzah(7, this.zzxq) : i;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzi extends zzaru<zzi> {
        private static volatile zzi[] zzxr;
        public String name;
        public zzaj.zza zzxs;
        public zzd zzxt;

        public zzi() {
            zzap();
        }

        public static zzi[] zzao() {
            if (zzxr == null) {
                synchronized (zzary.btO) {
                    if (zzxr == null) {
                        zzxr = new zzi[0];
                    }
                }
            }
            return zzxr;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzi)) {
                return false;
            }
            zzi zziVar = (zzi) obj;
            if (this.name == null) {
                if (zziVar.name != null) {
                    return false;
                }
            } else if (!this.name.equals(zziVar.name)) {
                return false;
            }
            if (this.zzxs == null) {
                if (zziVar.zzxs != null) {
                    return false;
                }
            } else if (!this.zzxs.equals(zziVar.zzxs)) {
                return false;
            }
            if (this.zzxt == null) {
                if (zziVar.zzxt != null) {
                    return false;
                }
            } else if (!this.zzxt.equals(zziVar.zzxt)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zziVar.btG == null || zziVar.btG.isEmpty() : this.btG.equals(zziVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.zzxt == null ? 0 : this.zzxt.hashCode()) + (((this.zzxs == null ? 0 : this.zzxs.hashCode()) + (((this.name == null ? 0 : this.name.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31)) * 31;
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
            if (this.zzxs != null) {
                zzartVar.zza(2, this.zzxs);
            }
            if (this.zzxt != null) {
                zzartVar.zza(3, this.zzxt);
            }
            super.zza(zzartVar);
        }

        public zzi zzap() {
            this.name = "";
            this.zzxs = null;
            this.zzxt = null;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzv */
        public zzi zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.name = zzarsVar.readString();
                        break;
                    case 18:
                        if (this.zzxs == null) {
                            this.zzxs = new zzaj.zza();
                        }
                        zzarsVar.zza(this.zzxs);
                        break;
                    case 26:
                        if (this.zzxt == null) {
                            this.zzxt = new zzd();
                        }
                        zzarsVar.zza(this.zzxt);
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
            if (this.name != null && !this.name.equals("")) {
                zzx += zzart.zzr(1, this.name);
            }
            if (this.zzxs != null) {
                zzx += zzart.zzc(2, this.zzxs);
            }
            return this.zzxt != null ? zzx + zzart.zzc(3, this.zzxt) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzj extends zzaru<zzj> {
        public zzi[] zzxu;
        public zzf zzxv;
        public String zzxw;

        public zzj() {
            zzaq();
        }

        public static zzj zzg(byte[] bArr) throws zzarz {
            return (zzj) zzasa.zza(new zzj(), bArr);
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzj)) {
                return false;
            }
            zzj zzjVar = (zzj) obj;
            if (!zzary.equals(this.zzxu, zzjVar.zzxu)) {
                return false;
            }
            if (this.zzxv == null) {
                if (zzjVar.zzxv != null) {
                    return false;
                }
            } else if (!this.zzxv.equals(zzjVar.zzxv)) {
                return false;
            }
            if (this.zzxw == null) {
                if (zzjVar.zzxw != null) {
                    return false;
                }
            } else if (!this.zzxw.equals(zzjVar.zzxw)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzjVar.btG == null || zzjVar.btG.isEmpty() : this.btG.equals(zzjVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.zzxw == null ? 0 : this.zzxw.hashCode()) + (((this.zzxv == null ? 0 : this.zzxv.hashCode()) + ((((getClass().getName().hashCode() + 527) * 31) + zzary.hashCode(this.zzxu)) * 31)) * 31)) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzxu != null && this.zzxu.length > 0) {
                for (int i = 0; i < this.zzxu.length; i++) {
                    zzi zziVar = this.zzxu[i];
                    if (zziVar != null) {
                        zzartVar.zza(1, zziVar);
                    }
                }
            }
            if (this.zzxv != null) {
                zzartVar.zza(2, this.zzxv);
            }
            if (this.zzxw != null && !this.zzxw.equals("")) {
                zzartVar.zzq(3, this.zzxw);
            }
            super.zza(zzartVar);
        }

        public zzj zzaq() {
            this.zzxu = zzi.zzao();
            this.zzxv = null;
            this.zzxw = "";
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzw */
        public zzj zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        int zzc = zzasd.zzc(zzarsVar, 10);
                        int length = this.zzxu == null ? 0 : this.zzxu.length;
                        zzi[] zziVarArr = new zzi[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.zzxu, 0, zziVarArr, 0, length);
                        }
                        while (length < zziVarArr.length - 1) {
                            zziVarArr[length] = new zzi();
                            zzarsVar.zza(zziVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zziVarArr[length] = new zzi();
                        zzarsVar.zza(zziVarArr[length]);
                        this.zzxu = zziVarArr;
                        break;
                    case 18:
                        if (this.zzxv == null) {
                            this.zzxv = new zzf();
                        }
                        zzarsVar.zza(this.zzxv);
                        break;
                    case 26:
                        this.zzxw = zzarsVar.readString();
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
            if (this.zzxu != null && this.zzxu.length > 0) {
                for (int i = 0; i < this.zzxu.length; i++) {
                    zzi zziVar = this.zzxu[i];
                    if (zziVar != null) {
                        zzx += zzart.zzc(1, zziVar);
                    }
                }
            }
            if (this.zzxv != null) {
                zzx += zzart.zzc(2, this.zzxv);
            }
            return (this.zzxw == null || this.zzxw.equals("")) ? zzx : zzx + zzart.zzr(3, this.zzxw);
        }
    }
}
