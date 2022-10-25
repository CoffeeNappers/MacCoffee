package com.google.android.gms.internal;

import java.io.IOException;
import java.util.Arrays;
/* loaded from: classes2.dex */
public interface zzasf {

    /* loaded from: classes2.dex */
    public static final class zza extends zzaru<zza> implements Cloneable {
        public int bub;
        public String buc;
        public String version;

        public zza() {
            cB();
        }

        public zza cB() {
            this.bub = 0;
            this.buc = "";
            this.version = "";
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        /* renamed from: cC */
        public zza clone() {
            try {
                return (zza) super.clone();
            } catch (CloneNotSupportedException e) {
                throw new AssertionError(e);
            }
        }

        @Override // com.google.android.gms.internal.zzaru
        public /* synthetic */ zza cn() throws CloneNotSupportedException {
            return (zza) clone();
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public /* synthetic */ zzasa co() throws CloneNotSupportedException {
            return (zza) clone();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zza)) {
                return false;
            }
            zza zzaVar = (zza) obj;
            if (this.bub != zzaVar.bub) {
                return false;
            }
            if (this.buc == null) {
                if (zzaVar.buc != null) {
                    return false;
                }
            } else if (!this.buc.equals(zzaVar.buc)) {
                return false;
            }
            if (this.version == null) {
                if (zzaVar.version != null) {
                    return false;
                }
            } else if (!this.version.equals(zzaVar.version)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzaVar.btG == null || zzaVar.btG.isEmpty() : this.btG.equals(zzaVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.version == null ? 0 : this.version.hashCode()) + (((this.buc == null ? 0 : this.buc.hashCode()) + ((((getClass().getName().hashCode() + 527) * 31) + this.bub) * 31)) * 31)) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.bub != 0) {
                zzartVar.zzaf(1, this.bub);
            }
            if (this.buc != null && !this.buc.equals("")) {
                zzartVar.zzq(2, this.buc);
            }
            if (this.version != null && !this.version.equals("")) {
                zzartVar.zzq(3, this.version);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzco */
        public zza zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.bub = zzarsVar.bY();
                        break;
                    case 18:
                        this.buc = zzarsVar.readString();
                        break;
                    case 26:
                        this.version = zzarsVar.readString();
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
            if (this.bub != 0) {
                zzx += zzart.zzah(1, this.bub);
            }
            if (this.buc != null && !this.buc.equals("")) {
                zzx += zzart.zzr(2, this.buc);
            }
            return (this.version == null || this.version.equals("")) ? zzx : zzx + zzart.zzr(3, this.version);
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzb extends zzaru<zzb> implements Cloneable {
        public byte[] bud;
        public String bue;
        public byte[][] buf;
        public boolean bug;

        public zzb() {
            cD();
        }

        public zzb cD() {
            this.bud = zzasd.btY;
            this.bue = "";
            this.buf = zzasd.btX;
            this.bug = false;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        /* renamed from: cE */
        public zzb clone() {
            try {
                zzb zzbVar = (zzb) super.clone();
                if (this.buf != null && this.buf.length > 0) {
                    zzbVar.buf = (byte[][]) this.buf.clone();
                }
                return zzbVar;
            } catch (CloneNotSupportedException e) {
                throw new AssertionError(e);
            }
        }

        @Override // com.google.android.gms.internal.zzaru
        public /* synthetic */ zzb cn() throws CloneNotSupportedException {
            return (zzb) clone();
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public /* synthetic */ zzasa co() throws CloneNotSupportedException {
            return (zzb) clone();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzb)) {
                return false;
            }
            zzb zzbVar = (zzb) obj;
            if (!Arrays.equals(this.bud, zzbVar.bud)) {
                return false;
            }
            if (this.bue == null) {
                if (zzbVar.bue != null) {
                    return false;
                }
            } else if (!this.bue.equals(zzbVar.bue)) {
                return false;
            }
            if (!zzary.zza(this.buf, zzbVar.buf) || this.bug != zzbVar.bug) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzbVar.btG == null || zzbVar.btG.isEmpty() : this.btG.equals(zzbVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.bug ? 1231 : 1237) + (((((this.bue == null ? 0 : this.bue.hashCode()) + ((((getClass().getName().hashCode() + 527) * 31) + Arrays.hashCode(this.bud)) * 31)) * 31) + zzary.zzb(this.buf)) * 31)) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (!Arrays.equals(this.bud, zzasd.btY)) {
                zzartVar.zzb(1, this.bud);
            }
            if (this.buf != null && this.buf.length > 0) {
                for (int i = 0; i < this.buf.length; i++) {
                    byte[] bArr = this.buf[i];
                    if (bArr != null) {
                        zzartVar.zzb(2, bArr);
                    }
                }
            }
            if (this.bug) {
                zzartVar.zzg(3, this.bug);
            }
            if (this.bue != null && !this.bue.equals("")) {
                zzartVar.zzq(4, this.bue);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzcp */
        public zzb zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.bud = zzarsVar.readBytes();
                        break;
                    case 18:
                        int zzc = zzasd.zzc(zzarsVar, 18);
                        int length = this.buf == null ? 0 : this.buf.length;
                        byte[][] bArr = new byte[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.buf, 0, bArr, 0, length);
                        }
                        while (length < bArr.length - 1) {
                            bArr[length] = zzarsVar.readBytes();
                            zzarsVar.bU();
                            length++;
                        }
                        bArr[length] = zzarsVar.readBytes();
                        this.buf = bArr;
                        break;
                    case 24:
                        this.bug = zzarsVar.ca();
                        break;
                    case 34:
                        this.bue = zzarsVar.readString();
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
            if (!Arrays.equals(this.bud, zzasd.btY)) {
                zzx += zzart.zzc(1, this.bud);
            }
            if (this.buf != null && this.buf.length > 0) {
                int i = 0;
                int i2 = 0;
                for (int i3 = 0; i3 < this.buf.length; i3++) {
                    byte[] bArr = this.buf[i3];
                    if (bArr != null) {
                        i2++;
                        i += zzart.zzbg(bArr);
                    }
                }
                zzx = zzx + i + (i2 * 1);
            }
            if (this.bug) {
                zzx += zzart.zzh(3, this.bug);
            }
            return (this.bue == null || this.bue.equals("")) ? zzx : zzx + zzart.zzr(4, this.bue);
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzc extends zzaru<zzc> implements Cloneable {
        public boolean bdw;
        public long buh;
        public long bui;
        public long buj;
        public int buk;
        public zzd[] bul;
        public byte[] bum;
        public zza bun;
        public byte[] buo;
        public String bup;
        public String buq;
        public String bur;
        public long bus;
        public zzb but;
        public byte[] buu;
        public String buv;
        public int buw;
        public int[] bux;
        public long buy;
        public zze buz;
        public String tag;
        public int zzajo;

        public zzc() {
            cF();
        }

        public zzc cF() {
            this.buh = 0L;
            this.bui = 0L;
            this.buj = 0L;
            this.tag = "";
            this.buk = 0;
            this.zzajo = 0;
            this.bdw = false;
            this.bul = zzd.cH();
            this.bum = zzasd.btY;
            this.bun = null;
            this.buo = zzasd.btY;
            this.bup = "";
            this.buq = "";
            this.bur = "";
            this.bus = 180000L;
            this.but = null;
            this.buu = zzasd.btY;
            this.buv = "";
            this.buw = 0;
            this.bux = zzasd.btR;
            this.buy = 0L;
            this.buz = null;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        /* renamed from: cG */
        public zzc clone() {
            try {
                zzc zzcVar = (zzc) super.clone();
                if (this.bul != null && this.bul.length > 0) {
                    zzcVar.bul = new zzd[this.bul.length];
                    int i = 0;
                    while (true) {
                        int i2 = i;
                        if (i2 >= this.bul.length) {
                            break;
                        }
                        if (this.bul[i2] != null) {
                            zzcVar.bul[i2] = (zzd) this.bul[i2].clone();
                        }
                        i = i2 + 1;
                    }
                }
                if (this.bun != null) {
                    zzcVar.bun = (zza) this.bun.clone();
                }
                if (this.but != null) {
                    zzcVar.but = (zzb) this.but.clone();
                }
                if (this.bux != null && this.bux.length > 0) {
                    zzcVar.bux = (int[]) this.bux.clone();
                }
                if (this.buz != null) {
                    zzcVar.buz = (zze) this.buz.clone();
                }
                return zzcVar;
            } catch (CloneNotSupportedException e) {
                throw new AssertionError(e);
            }
        }

        @Override // com.google.android.gms.internal.zzaru
        public /* synthetic */ zzc cn() throws CloneNotSupportedException {
            return (zzc) clone();
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public /* synthetic */ zzasa co() throws CloneNotSupportedException {
            return (zzc) clone();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzc)) {
                return false;
            }
            zzc zzcVar = (zzc) obj;
            if (this.buh != zzcVar.buh || this.bui != zzcVar.bui || this.buj != zzcVar.buj) {
                return false;
            }
            if (this.tag == null) {
                if (zzcVar.tag != null) {
                    return false;
                }
            } else if (!this.tag.equals(zzcVar.tag)) {
                return false;
            }
            if (this.buk != zzcVar.buk || this.zzajo != zzcVar.zzajo || this.bdw != zzcVar.bdw || !zzary.equals(this.bul, zzcVar.bul) || !Arrays.equals(this.bum, zzcVar.bum)) {
                return false;
            }
            if (this.bun == null) {
                if (zzcVar.bun != null) {
                    return false;
                }
            } else if (!this.bun.equals(zzcVar.bun)) {
                return false;
            }
            if (!Arrays.equals(this.buo, zzcVar.buo)) {
                return false;
            }
            if (this.bup == null) {
                if (zzcVar.bup != null) {
                    return false;
                }
            } else if (!this.bup.equals(zzcVar.bup)) {
                return false;
            }
            if (this.buq == null) {
                if (zzcVar.buq != null) {
                    return false;
                }
            } else if (!this.buq.equals(zzcVar.buq)) {
                return false;
            }
            if (this.bur == null) {
                if (zzcVar.bur != null) {
                    return false;
                }
            } else if (!this.bur.equals(zzcVar.bur)) {
                return false;
            }
            if (this.bus != zzcVar.bus) {
                return false;
            }
            if (this.but == null) {
                if (zzcVar.but != null) {
                    return false;
                }
            } else if (!this.but.equals(zzcVar.but)) {
                return false;
            }
            if (!Arrays.equals(this.buu, zzcVar.buu)) {
                return false;
            }
            if (this.buv == null) {
                if (zzcVar.buv != null) {
                    return false;
                }
            } else if (!this.buv.equals(zzcVar.buv)) {
                return false;
            }
            if (this.buw != zzcVar.buw || !zzary.equals(this.bux, zzcVar.bux) || this.buy != zzcVar.buy) {
                return false;
            }
            if (this.buz == null) {
                if (zzcVar.buz != null) {
                    return false;
                }
            } else if (!this.buz.equals(zzcVar.buz)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzcVar.btG == null || zzcVar.btG.isEmpty() : this.btG.equals(zzcVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.buz == null ? 0 : this.buz.hashCode()) + (((((((((this.buv == null ? 0 : this.buv.hashCode()) + (((((this.but == null ? 0 : this.but.hashCode()) + (((((this.bur == null ? 0 : this.bur.hashCode()) + (((this.buq == null ? 0 : this.buq.hashCode()) + (((this.bup == null ? 0 : this.bup.hashCode()) + (((((this.bun == null ? 0 : this.bun.hashCode()) + (((((((this.bdw ? 1231 : 1237) + (((((((this.tag == null ? 0 : this.tag.hashCode()) + ((((((((getClass().getName().hashCode() + 527) * 31) + ((int) (this.buh ^ (this.buh >>> 32)))) * 31) + ((int) (this.bui ^ (this.bui >>> 32)))) * 31) + ((int) (this.buj ^ (this.buj >>> 32)))) * 31)) * 31) + this.buk) * 31) + this.zzajo) * 31)) * 31) + zzary.hashCode(this.bul)) * 31) + Arrays.hashCode(this.bum)) * 31)) * 31) + Arrays.hashCode(this.buo)) * 31)) * 31)) * 31)) * 31) + ((int) (this.bus ^ (this.bus >>> 32)))) * 31)) * 31) + Arrays.hashCode(this.buu)) * 31)) * 31) + this.buw) * 31) + zzary.hashCode(this.bux)) * 31) + ((int) (this.buy ^ (this.buy >>> 32)))) * 31)) * 31;
            if (this.btG != null && !this.btG.isEmpty()) {
                i = this.btG.hashCode();
            }
            return hashCode + i;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.buh != 0) {
                zzartVar.zzb(1, this.buh);
            }
            if (this.tag != null && !this.tag.equals("")) {
                zzartVar.zzq(2, this.tag);
            }
            if (this.bul != null && this.bul.length > 0) {
                for (int i = 0; i < this.bul.length; i++) {
                    zzd zzdVar = this.bul[i];
                    if (zzdVar != null) {
                        zzartVar.zza(3, zzdVar);
                    }
                }
            }
            if (!Arrays.equals(this.bum, zzasd.btY)) {
                zzartVar.zzb(4, this.bum);
            }
            if (!Arrays.equals(this.buo, zzasd.btY)) {
                zzartVar.zzb(6, this.buo);
            }
            if (this.bup != null && !this.bup.equals("")) {
                zzartVar.zzq(8, this.bup);
            }
            if (this.bun != null) {
                zzartVar.zza(9, this.bun);
            }
            if (this.bdw) {
                zzartVar.zzg(10, this.bdw);
            }
            if (this.buk != 0) {
                zzartVar.zzaf(11, this.buk);
            }
            if (this.zzajo != 0) {
                zzartVar.zzaf(12, this.zzajo);
            }
            if (this.buq != null && !this.buq.equals("")) {
                zzartVar.zzq(13, this.buq);
            }
            if (this.bur != null && !this.bur.equals("")) {
                zzartVar.zzq(14, this.bur);
            }
            if (this.bus != 180000) {
                zzartVar.zzd(15, this.bus);
            }
            if (this.but != null) {
                zzartVar.zza(16, this.but);
            }
            if (this.bui != 0) {
                zzartVar.zzb(17, this.bui);
            }
            if (!Arrays.equals(this.buu, zzasd.btY)) {
                zzartVar.zzb(18, this.buu);
            }
            if (this.buw != 0) {
                zzartVar.zzaf(19, this.buw);
            }
            if (this.bux != null && this.bux.length > 0) {
                for (int i2 = 0; i2 < this.bux.length; i2++) {
                    zzartVar.zzaf(20, this.bux[i2]);
                }
            }
            if (this.buj != 0) {
                zzartVar.zzb(21, this.buj);
            }
            if (this.buy != 0) {
                zzartVar.zzb(22, this.buy);
            }
            if (this.buz != null) {
                zzartVar.zza(23, this.buz);
            }
            if (this.buv != null && !this.buv.equals("")) {
                zzartVar.zzq(24, this.buv);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzcq */
        public zzc zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.buh = zzarsVar.bX();
                        break;
                    case 18:
                        this.tag = zzarsVar.readString();
                        break;
                    case 26:
                        int zzc = zzasd.zzc(zzarsVar, 26);
                        int length = this.bul == null ? 0 : this.bul.length;
                        zzd[] zzdVarArr = new zzd[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.bul, 0, zzdVarArr, 0, length);
                        }
                        while (length < zzdVarArr.length - 1) {
                            zzdVarArr[length] = new zzd();
                            zzarsVar.zza(zzdVarArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        zzdVarArr[length] = new zzd();
                        zzarsVar.zza(zzdVarArr[length]);
                        this.bul = zzdVarArr;
                        break;
                    case 34:
                        this.bum = zzarsVar.readBytes();
                        break;
                    case 50:
                        this.buo = zzarsVar.readBytes();
                        break;
                    case 66:
                        this.bup = zzarsVar.readString();
                        break;
                    case 74:
                        if (this.bun == null) {
                            this.bun = new zza();
                        }
                        zzarsVar.zza(this.bun);
                        break;
                    case 80:
                        this.bdw = zzarsVar.ca();
                        break;
                    case 88:
                        this.buk = zzarsVar.bY();
                        break;
                    case 96:
                        this.zzajo = zzarsVar.bY();
                        break;
                    case 106:
                        this.buq = zzarsVar.readString();
                        break;
                    case 114:
                        this.bur = zzarsVar.readString();
                        break;
                    case 120:
                        this.bus = zzarsVar.cc();
                        break;
                    case 130:
                        if (this.but == null) {
                            this.but = new zzb();
                        }
                        zzarsVar.zza(this.but);
                        break;
                    case 136:
                        this.bui = zzarsVar.bX();
                        break;
                    case 146:
                        this.buu = zzarsVar.readBytes();
                        break;
                    case 152:
                        int bY = zzarsVar.bY();
                        switch (bY) {
                            case 0:
                            case 1:
                            case 2:
                                this.buw = bY;
                                continue;
                        }
                    case 160:
                        int zzc2 = zzasd.zzc(zzarsVar, 160);
                        int length2 = this.bux == null ? 0 : this.bux.length;
                        int[] iArr = new int[zzc2 + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.bux, 0, iArr, 0, length2);
                        }
                        while (length2 < iArr.length - 1) {
                            iArr[length2] = zzarsVar.bY();
                            zzarsVar.bU();
                            length2++;
                        }
                        iArr[length2] = zzarsVar.bY();
                        this.bux = iArr;
                        break;
                    case 162:
                        int zzagt = zzarsVar.zzagt(zzarsVar.cd());
                        int position = zzarsVar.getPosition();
                        int i = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i++;
                        }
                        zzarsVar.zzagv(position);
                        int length3 = this.bux == null ? 0 : this.bux.length;
                        int[] iArr2 = new int[i + length3];
                        if (length3 != 0) {
                            System.arraycopy(this.bux, 0, iArr2, 0, length3);
                        }
                        while (length3 < iArr2.length) {
                            iArr2[length3] = zzarsVar.bY();
                            length3++;
                        }
                        this.bux = iArr2;
                        zzarsVar.zzagu(zzagt);
                        break;
                    case 168:
                        this.buj = zzarsVar.bX();
                        break;
                    case 176:
                        this.buy = zzarsVar.bX();
                        break;
                    case 186:
                        if (this.buz == null) {
                            this.buz = new zze();
                        }
                        zzarsVar.zza(this.buz);
                        break;
                    case 194:
                        this.buv = zzarsVar.readString();
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
            if (this.buh != 0) {
                zzx += zzart.zzf(1, this.buh);
            }
            if (this.tag != null && !this.tag.equals("")) {
                zzx += zzart.zzr(2, this.tag);
            }
            if (this.bul != null && this.bul.length > 0) {
                int i = zzx;
                for (int i2 = 0; i2 < this.bul.length; i2++) {
                    zzd zzdVar = this.bul[i2];
                    if (zzdVar != null) {
                        i += zzart.zzc(3, zzdVar);
                    }
                }
                zzx = i;
            }
            if (!Arrays.equals(this.bum, zzasd.btY)) {
                zzx += zzart.zzc(4, this.bum);
            }
            if (!Arrays.equals(this.buo, zzasd.btY)) {
                zzx += zzart.zzc(6, this.buo);
            }
            if (this.bup != null && !this.bup.equals("")) {
                zzx += zzart.zzr(8, this.bup);
            }
            if (this.bun != null) {
                zzx += zzart.zzc(9, this.bun);
            }
            if (this.bdw) {
                zzx += zzart.zzh(10, this.bdw);
            }
            if (this.buk != 0) {
                zzx += zzart.zzah(11, this.buk);
            }
            if (this.zzajo != 0) {
                zzx += zzart.zzah(12, this.zzajo);
            }
            if (this.buq != null && !this.buq.equals("")) {
                zzx += zzart.zzr(13, this.buq);
            }
            if (this.bur != null && !this.bur.equals("")) {
                zzx += zzart.zzr(14, this.bur);
            }
            if (this.bus != 180000) {
                zzx += zzart.zzh(15, this.bus);
            }
            if (this.but != null) {
                zzx += zzart.zzc(16, this.but);
            }
            if (this.bui != 0) {
                zzx += zzart.zzf(17, this.bui);
            }
            if (!Arrays.equals(this.buu, zzasd.btY)) {
                zzx += zzart.zzc(18, this.buu);
            }
            if (this.buw != 0) {
                zzx += zzart.zzah(19, this.buw);
            }
            if (this.bux != null && this.bux.length > 0) {
                int i3 = 0;
                for (int i4 = 0; i4 < this.bux.length; i4++) {
                    i3 += zzart.zzagz(this.bux[i4]);
                }
                zzx = zzx + i3 + (this.bux.length * 2);
            }
            if (this.buj != 0) {
                zzx += zzart.zzf(21, this.buj);
            }
            if (this.buy != 0) {
                zzx += zzart.zzf(22, this.buy);
            }
            if (this.buz != null) {
                zzx += zzart.zzc(23, this.buz);
            }
            return (this.buv == null || this.buv.equals("")) ? zzx : zzx + zzart.zzr(24, this.buv);
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzd extends zzaru<zzd> implements Cloneable {
        private static volatile zzd[] buA;
        public String value;
        public String zzcb;

        public zzd() {
            cI();
        }

        public static zzd[] cH() {
            if (buA == null) {
                synchronized (zzary.btO) {
                    if (buA == null) {
                        buA = new zzd[0];
                    }
                }
            }
            return buA;
        }

        public zzd cI() {
            this.zzcb = "";
            this.value = "";
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        /* renamed from: cJ */
        public zzd clone() {
            try {
                return (zzd) super.clone();
            } catch (CloneNotSupportedException e) {
                throw new AssertionError(e);
            }
        }

        @Override // com.google.android.gms.internal.zzaru
        public /* synthetic */ zzd cn() throws CloneNotSupportedException {
            return (zzd) clone();
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public /* synthetic */ zzasa co() throws CloneNotSupportedException {
            return (zzd) clone();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzd)) {
                return false;
            }
            zzd zzdVar = (zzd) obj;
            if (this.zzcb == null) {
                if (zzdVar.zzcb != null) {
                    return false;
                }
            } else if (!this.zzcb.equals(zzdVar.zzcb)) {
                return false;
            }
            if (this.value == null) {
                if (zzdVar.value != null) {
                    return false;
                }
            } else if (!this.value.equals(zzdVar.value)) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzdVar.btG == null || zzdVar.btG.isEmpty() : this.btG.equals(zzdVar.btG);
        }

        public int hashCode() {
            int i = 0;
            int hashCode = ((this.value == null ? 0 : this.value.hashCode()) + (((this.zzcb == null ? 0 : this.zzcb.hashCode()) + ((getClass().getName().hashCode() + 527) * 31)) * 31)) * 31;
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
            if (this.value != null && !this.value.equals("")) {
                zzartVar.zzq(2, this.value);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzcr */
        public zzd zzb(zzars zzarsVar) throws IOException {
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
            return (this.value == null || this.value.equals("")) ? zzx : zzx + zzart.zzr(2, this.value);
        }
    }

    /* loaded from: classes2.dex */
    public static final class zze extends zzaru<zze> implements Cloneable {
        public int buB;
        public int buC;

        public zze() {
            cK();
        }

        public zze cK() {
            this.buB = -1;
            this.buC = 0;
            this.btG = null;
            this.btP = -1;
            return this;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        /* renamed from: cL */
        public zze clone() {
            try {
                return (zze) super.clone();
            } catch (CloneNotSupportedException e) {
                throw new AssertionError(e);
            }
        }

        @Override // com.google.android.gms.internal.zzaru
        public /* synthetic */ zze cn() throws CloneNotSupportedException {
            return (zze) clone();
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public /* synthetic */ zzasa co() throws CloneNotSupportedException {
            return (zze) clone();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zze)) {
                return false;
            }
            zze zzeVar = (zze) obj;
            if (this.buB != zzeVar.buB || this.buC != zzeVar.buC) {
                return false;
            }
            return (this.btG == null || this.btG.isEmpty()) ? zzeVar.btG == null || zzeVar.btG.isEmpty() : this.btG.equals(zzeVar.btG);
        }

        public int hashCode() {
            return ((this.btG == null || this.btG.isEmpty()) ? 0 : this.btG.hashCode()) + ((((((getClass().getName().hashCode() + 527) * 31) + this.buB) * 31) + this.buC) * 31);
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.buB != -1) {
                zzartVar.zzaf(1, this.buB);
            }
            if (this.buC != 0) {
                zzartVar.zzaf(2, this.buC);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzcs */
        public zze zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        int bY = zzarsVar.bY();
                        switch (bY) {
                            case -1:
                            case 0:
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
                                this.buB = bY;
                                continue;
                        }
                    case 16:
                        int bY2 = zzarsVar.bY();
                        switch (bY2) {
                            case 0:
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
                            case 100:
                                this.buC = bY2;
                                continue;
                        }
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
            if (this.buB != -1) {
                zzx += zzart.zzah(1, this.buB);
            }
            return this.buC != 0 ? zzx + zzart.zzah(2, this.buC) : zzx;
        }
    }
}
