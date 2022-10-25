package com.google.android.gms.internal;

import com.facebook.imageutils.JfifUtil;
import java.io.IOException;
/* loaded from: classes2.dex */
public interface zzad {

    /* loaded from: classes2.dex */
    public static final class zza extends zzasa {
        public zzb zzck;
        public zzc zzcl;

        public zza() {
            zzw();
        }

        public static zza zzc(byte[] bArr) throws zzarz {
            return (zza) zzasa.zza(new zza(), bArr);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zza */
        public zza zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        if (this.zzck == null) {
                            this.zzck = new zzb();
                        }
                        zzarsVar.zza(this.zzck);
                        break;
                    case 18:
                        if (this.zzcl == null) {
                            this.zzcl = new zzc();
                        }
                        zzarsVar.zza(this.zzcl);
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

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzck != null) {
                zzartVar.zza(1, this.zzck);
            }
            if (this.zzcl != null) {
                zzartVar.zza(2, this.zzcl);
            }
            super.zza(zzartVar);
        }

        public zza zzw() {
            this.zzck = null;
            this.zzcl = null;
            this.btP = -1;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.zzck != null) {
                zzx += zzart.zzc(1, this.zzck);
            }
            return this.zzcl != null ? zzx + zzart.zzc(2, this.zzcl) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzb extends zzasa {
        public Integer zzcm;

        public zzb() {
            zzy();
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzcm != null) {
                zzartVar.zzaf(27, this.zzcm.intValue());
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzc */
        public zzb zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case JfifUtil.MARKER_SOI /* 216 */:
                        int bY = zzarsVar.bY();
                        switch (bY) {
                            case 0:
                            case 1:
                            case 2:
                            case 3:
                            case 4:
                                this.zzcm = Integer.valueOf(bY);
                                continue;
                        }
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

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            return this.zzcm != null ? zzx + zzart.zzah(27, this.zzcm.intValue()) : zzx;
        }

        public zzb zzy() {
            this.btP = -1;
            return this;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzc extends zzasa {
        public String zzcn;
        public String zzco;
        public String zzcp;
        public String zzcq;
        public String zzcr;

        public zzc() {
            zzz();
        }

        @Override // com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzcn != null) {
                zzartVar.zzq(1, this.zzcn);
            }
            if (this.zzco != null) {
                zzartVar.zzq(2, this.zzco);
            }
            if (this.zzcp != null) {
                zzartVar.zzq(3, this.zzcp);
            }
            if (this.zzcq != null) {
                zzartVar.zzq(4, this.zzcq);
            }
            if (this.zzcr != null) {
                zzartVar.zzq(5, this.zzcr);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzd */
        public zzc zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.zzcn = zzarsVar.readString();
                        break;
                    case 18:
                        this.zzco = zzarsVar.readString();
                        break;
                    case 26:
                        this.zzcp = zzarsVar.readString();
                        break;
                    case 34:
                        this.zzcq = zzarsVar.readString();
                        break;
                    case 42:
                        this.zzcr = zzarsVar.readString();
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

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzasa
        public int zzx() {
            int zzx = super.zzx();
            if (this.zzcn != null) {
                zzx += zzart.zzr(1, this.zzcn);
            }
            if (this.zzco != null) {
                zzx += zzart.zzr(2, this.zzco);
            }
            if (this.zzcp != null) {
                zzx += zzart.zzr(3, this.zzcp);
            }
            if (this.zzcq != null) {
                zzx += zzart.zzr(4, this.zzcq);
            }
            return this.zzcr != null ? zzx + zzart.zzr(5, this.zzcr) : zzx;
        }

        public zzc zzz() {
            this.zzcn = null;
            this.zzco = null;
            this.zzcp = null;
            this.zzcq = null;
            this.zzcr = null;
            this.btP = -1;
            return this;
        }
    }
}
