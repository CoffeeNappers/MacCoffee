package com.google.android.gms.internal;

import com.facebook.imagepipeline.memory.BitmapCounterProvider;
import com.facebook.imageutils.JfifUtil;
import com.facebook.imageutils.TiffUtil;
import com.my.target.ads.instream.InstreamAd;
import com.vkontakte.android.api.VKAPIRequest;
import java.io.IOException;
/* loaded from: classes2.dex */
public interface zzaf {

    /* loaded from: classes2.dex */
    public static final class zza extends zzaru<zza> {
        public zzb zzed;
        public C0071zza zzes;
        public zzb zzeu;
        public zze zzfb;
        public String zzdb = null;
        public String zzda = null;
        public Long zzdc = null;
        public Long zzdd = null;
        public Long zzde = null;
        public Long zzdf = null;
        public Long zzdg = null;
        public Long zzdh = null;
        public Long zzdi = null;
        public Long zzdj = null;
        public Long zzdk = null;
        public Long zzdl = null;
        public String zzdm = null;
        public Long zzdn = null;
        public Long zzdo = null;
        public Long zzdp = null;
        public Long zzdq = null;
        public Long zzdr = null;
        public Long zzds = null;
        public Long zzdt = null;
        public Long zzdu = null;
        public Long zzdv = null;
        public String zzcn = null;
        public String zzdw = null;
        public Long zzdx = null;
        public Long zzdy = null;
        public Long zzdz = null;
        public String zzcp = null;
        public Long zzea = null;
        public Long zzeb = null;
        public Long zzec = null;
        public Long zzee = null;
        public Long zzef = null;
        public Long zzeg = null;
        public Long zzeh = null;
        public Long zzei = null;
        public Long zzej = null;
        public String zzcq = null;
        public String zzcr = null;
        public Integer zzek = null;
        public Integer zzel = null;
        public Long zzem = null;
        public Long zzen = null;
        public Long zzeo = null;
        public Long zzep = null;
        public Long zzeq = null;
        public Integer zzer = null;
        public C0071zza[] zzet = C0071zza.zzaa();
        public Long zzev = null;
        public String zzew = null;
        public Integer zzex = null;
        public Boolean zzey = null;
        public String zzez = null;
        public Long zzfa = null;

        /* renamed from: com.google.android.gms.internal.zzaf$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        public static final class C0071zza extends zzaru<C0071zza> {
            private static volatile C0071zza[] zzfc;
            public Long zzdn = null;
            public Long zzdo = null;
            public Long zzfd = null;
            public Long zzfe = null;
            public Long zzff = null;
            public Long zzfg = null;
            public Integer zzfh = null;
            public Long zzfi = null;
            public Long zzfj = null;
            public Long zzfk = null;
            public Integer zzfl = null;
            public Long zzfm = null;

            public C0071zza() {
                this.btP = -1;
            }

            public static C0071zza[] zzaa() {
                if (zzfc == null) {
                    synchronized (zzary.btO) {
                        if (zzfc == null) {
                            zzfc = new C0071zza[0];
                        }
                    }
                }
                return zzfc;
            }

            @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
            public void zza(zzart zzartVar) throws IOException {
                if (this.zzdn != null) {
                    zzartVar.zzb(1, this.zzdn.longValue());
                }
                if (this.zzdo != null) {
                    zzartVar.zzb(2, this.zzdo.longValue());
                }
                if (this.zzfd != null) {
                    zzartVar.zzb(3, this.zzfd.longValue());
                }
                if (this.zzfe != null) {
                    zzartVar.zzb(4, this.zzfe.longValue());
                }
                if (this.zzff != null) {
                    zzartVar.zzb(5, this.zzff.longValue());
                }
                if (this.zzfg != null) {
                    zzartVar.zzb(6, this.zzfg.longValue());
                }
                if (this.zzfh != null) {
                    zzartVar.zzaf(7, this.zzfh.intValue());
                }
                if (this.zzfi != null) {
                    zzartVar.zzb(8, this.zzfi.longValue());
                }
                if (this.zzfj != null) {
                    zzartVar.zzb(9, this.zzfj.longValue());
                }
                if (this.zzfk != null) {
                    zzartVar.zzb(10, this.zzfk.longValue());
                }
                if (this.zzfl != null) {
                    zzartVar.zzaf(11, this.zzfl.intValue());
                }
                if (this.zzfm != null) {
                    zzartVar.zzb(12, this.zzfm.longValue());
                }
                super.zza(zzartVar);
            }

            @Override // com.google.android.gms.internal.zzasa
            /* renamed from: zzg */
            public C0071zza zzb(zzars zzarsVar) throws IOException {
                while (true) {
                    int bU = zzarsVar.bU();
                    switch (bU) {
                        case 0:
                            break;
                        case 8:
                            this.zzdn = Long.valueOf(zzarsVar.bX());
                            break;
                        case 16:
                            this.zzdo = Long.valueOf(zzarsVar.bX());
                            break;
                        case 24:
                            this.zzfd = Long.valueOf(zzarsVar.bX());
                            break;
                        case 32:
                            this.zzfe = Long.valueOf(zzarsVar.bX());
                            break;
                        case 40:
                            this.zzff = Long.valueOf(zzarsVar.bX());
                            break;
                        case 48:
                            this.zzfg = Long.valueOf(zzarsVar.bX());
                            break;
                        case 56:
                            int bY = zzarsVar.bY();
                            switch (bY) {
                                case 0:
                                case 1:
                                case 2:
                                case 1000:
                                    this.zzfh = Integer.valueOf(bY);
                                    continue;
                            }
                        case 64:
                            this.zzfi = Long.valueOf(zzarsVar.bX());
                            break;
                        case 72:
                            this.zzfj = Long.valueOf(zzarsVar.bX());
                            break;
                        case 80:
                            this.zzfk = Long.valueOf(zzarsVar.bX());
                            break;
                        case 88:
                            int bY2 = zzarsVar.bY();
                            switch (bY2) {
                                case 0:
                                case 1:
                                case 2:
                                case 1000:
                                    this.zzfl = Integer.valueOf(bY2);
                                    continue;
                            }
                        case 96:
                            this.zzfm = Long.valueOf(zzarsVar.bX());
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

            @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
            protected int zzx() {
                int zzx = super.zzx();
                if (this.zzdn != null) {
                    zzx += zzart.zzf(1, this.zzdn.longValue());
                }
                if (this.zzdo != null) {
                    zzx += zzart.zzf(2, this.zzdo.longValue());
                }
                if (this.zzfd != null) {
                    zzx += zzart.zzf(3, this.zzfd.longValue());
                }
                if (this.zzfe != null) {
                    zzx += zzart.zzf(4, this.zzfe.longValue());
                }
                if (this.zzff != null) {
                    zzx += zzart.zzf(5, this.zzff.longValue());
                }
                if (this.zzfg != null) {
                    zzx += zzart.zzf(6, this.zzfg.longValue());
                }
                if (this.zzfh != null) {
                    zzx += zzart.zzah(7, this.zzfh.intValue());
                }
                if (this.zzfi != null) {
                    zzx += zzart.zzf(8, this.zzfi.longValue());
                }
                if (this.zzfj != null) {
                    zzx += zzart.zzf(9, this.zzfj.longValue());
                }
                if (this.zzfk != null) {
                    zzx += zzart.zzf(10, this.zzfk.longValue());
                }
                if (this.zzfl != null) {
                    zzx += zzart.zzah(11, this.zzfl.intValue());
                }
                return this.zzfm != null ? zzx + zzart.zzf(12, this.zzfm.longValue()) : zzx;
            }
        }

        /* loaded from: classes2.dex */
        public static final class zzb extends zzaru<zzb> {
            public Long zzep = null;
            public Long zzeq = null;
            public Long zzfn = null;

            public zzb() {
                this.btP = -1;
            }

            @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
            public void zza(zzart zzartVar) throws IOException {
                if (this.zzep != null) {
                    zzartVar.zzb(1, this.zzep.longValue());
                }
                if (this.zzeq != null) {
                    zzartVar.zzb(2, this.zzeq.longValue());
                }
                if (this.zzfn != null) {
                    zzartVar.zzb(3, this.zzfn.longValue());
                }
                super.zza(zzartVar);
            }

            @Override // com.google.android.gms.internal.zzasa
            /* renamed from: zzh */
            public zzb zzb(zzars zzarsVar) throws IOException {
                while (true) {
                    int bU = zzarsVar.bU();
                    switch (bU) {
                        case 0:
                            break;
                        case 8:
                            this.zzep = Long.valueOf(zzarsVar.bX());
                            break;
                        case 16:
                            this.zzeq = Long.valueOf(zzarsVar.bX());
                            break;
                        case 24:
                            this.zzfn = Long.valueOf(zzarsVar.bX());
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

            @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
            protected int zzx() {
                int zzx = super.zzx();
                if (this.zzep != null) {
                    zzx += zzart.zzf(1, this.zzep.longValue());
                }
                if (this.zzeq != null) {
                    zzx += zzart.zzf(2, this.zzeq.longValue());
                }
                return this.zzfn != null ? zzx + zzart.zzf(3, this.zzfn.longValue()) : zzx;
            }
        }

        public zza() {
            this.btP = -1;
        }

        public static zza zzd(byte[] bArr) throws zzarz {
            return (zza) zzasa.zza(new zza(), bArr);
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzdb != null) {
                zzartVar.zzq(1, this.zzdb);
            }
            if (this.zzda != null) {
                zzartVar.zzq(2, this.zzda);
            }
            if (this.zzdc != null) {
                zzartVar.zzb(3, this.zzdc.longValue());
            }
            if (this.zzdd != null) {
                zzartVar.zzb(4, this.zzdd.longValue());
            }
            if (this.zzde != null) {
                zzartVar.zzb(5, this.zzde.longValue());
            }
            if (this.zzdf != null) {
                zzartVar.zzb(6, this.zzdf.longValue());
            }
            if (this.zzdg != null) {
                zzartVar.zzb(7, this.zzdg.longValue());
            }
            if (this.zzdh != null) {
                zzartVar.zzb(8, this.zzdh.longValue());
            }
            if (this.zzdi != null) {
                zzartVar.zzb(9, this.zzdi.longValue());
            }
            if (this.zzdj != null) {
                zzartVar.zzb(10, this.zzdj.longValue());
            }
            if (this.zzdk != null) {
                zzartVar.zzb(11, this.zzdk.longValue());
            }
            if (this.zzdl != null) {
                zzartVar.zzb(12, this.zzdl.longValue());
            }
            if (this.zzdm != null) {
                zzartVar.zzq(13, this.zzdm);
            }
            if (this.zzdn != null) {
                zzartVar.zzb(14, this.zzdn.longValue());
            }
            if (this.zzdo != null) {
                zzartVar.zzb(15, this.zzdo.longValue());
            }
            if (this.zzdp != null) {
                zzartVar.zzb(16, this.zzdp.longValue());
            }
            if (this.zzdq != null) {
                zzartVar.zzb(17, this.zzdq.longValue());
            }
            if (this.zzdr != null) {
                zzartVar.zzb(18, this.zzdr.longValue());
            }
            if (this.zzds != null) {
                zzartVar.zzb(19, this.zzds.longValue());
            }
            if (this.zzdt != null) {
                zzartVar.zzb(20, this.zzdt.longValue());
            }
            if (this.zzev != null) {
                zzartVar.zzb(21, this.zzev.longValue());
            }
            if (this.zzdu != null) {
                zzartVar.zzb(22, this.zzdu.longValue());
            }
            if (this.zzdv != null) {
                zzartVar.zzb(23, this.zzdv.longValue());
            }
            if (this.zzew != null) {
                zzartVar.zzq(24, this.zzew);
            }
            if (this.zzfa != null) {
                zzartVar.zzb(25, this.zzfa.longValue());
            }
            if (this.zzex != null) {
                zzartVar.zzaf(26, this.zzex.intValue());
            }
            if (this.zzcn != null) {
                zzartVar.zzq(27, this.zzcn);
            }
            if (this.zzey != null) {
                zzartVar.zzg(28, this.zzey.booleanValue());
            }
            if (this.zzdw != null) {
                zzartVar.zzq(29, this.zzdw);
            }
            if (this.zzez != null) {
                zzartVar.zzq(30, this.zzez);
            }
            if (this.zzdx != null) {
                zzartVar.zzb(31, this.zzdx.longValue());
            }
            if (this.zzdy != null) {
                zzartVar.zzb(32, this.zzdy.longValue());
            }
            if (this.zzdz != null) {
                zzartVar.zzb(33, this.zzdz.longValue());
            }
            if (this.zzcp != null) {
                zzartVar.zzq(34, this.zzcp);
            }
            if (this.zzea != null) {
                zzartVar.zzb(35, this.zzea.longValue());
            }
            if (this.zzeb != null) {
                zzartVar.zzb(36, this.zzeb.longValue());
            }
            if (this.zzec != null) {
                zzartVar.zzb(37, this.zzec.longValue());
            }
            if (this.zzed != null) {
                zzartVar.zza(38, this.zzed);
            }
            if (this.zzee != null) {
                zzartVar.zzb(39, this.zzee.longValue());
            }
            if (this.zzef != null) {
                zzartVar.zzb(40, this.zzef.longValue());
            }
            if (this.zzeg != null) {
                zzartVar.zzb(41, this.zzeg.longValue());
            }
            if (this.zzeh != null) {
                zzartVar.zzb(42, this.zzeh.longValue());
            }
            if (this.zzet != null && this.zzet.length > 0) {
                for (int i = 0; i < this.zzet.length; i++) {
                    C0071zza c0071zza = this.zzet[i];
                    if (c0071zza != null) {
                        zzartVar.zza(43, c0071zza);
                    }
                }
            }
            if (this.zzei != null) {
                zzartVar.zzb(44, this.zzei.longValue());
            }
            if (this.zzej != null) {
                zzartVar.zzb(45, this.zzej.longValue());
            }
            if (this.zzcq != null) {
                zzartVar.zzq(46, this.zzcq);
            }
            if (this.zzcr != null) {
                zzartVar.zzq(47, this.zzcr);
            }
            if (this.zzek != null) {
                zzartVar.zzaf(48, this.zzek.intValue());
            }
            if (this.zzel != null) {
                zzartVar.zzaf(49, this.zzel.intValue());
            }
            if (this.zzes != null) {
                zzartVar.zza(50, this.zzes);
            }
            if (this.zzem != null) {
                zzartVar.zzb(51, this.zzem.longValue());
            }
            if (this.zzen != null) {
                zzartVar.zzb(52, this.zzen.longValue());
            }
            if (this.zzeo != null) {
                zzartVar.zzb(53, this.zzeo.longValue());
            }
            if (this.zzep != null) {
                zzartVar.zzb(54, this.zzep.longValue());
            }
            if (this.zzeq != null) {
                zzartVar.zzb(55, this.zzeq.longValue());
            }
            if (this.zzer != null) {
                zzartVar.zzaf(56, this.zzer.intValue());
            }
            if (this.zzeu != null) {
                zzartVar.zza(57, this.zzeu);
            }
            if (this.zzfb != null) {
                zzartVar.zza(VKAPIRequest.ERROR_AUDIO_ACCESS, this.zzfb);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzf */
        public zza zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.zzdb = zzarsVar.readString();
                        break;
                    case 18:
                        this.zzda = zzarsVar.readString();
                        break;
                    case 24:
                        this.zzdc = Long.valueOf(zzarsVar.bX());
                        break;
                    case 32:
                        this.zzdd = Long.valueOf(zzarsVar.bX());
                        break;
                    case 40:
                        this.zzde = Long.valueOf(zzarsVar.bX());
                        break;
                    case 48:
                        this.zzdf = Long.valueOf(zzarsVar.bX());
                        break;
                    case 56:
                        this.zzdg = Long.valueOf(zzarsVar.bX());
                        break;
                    case 64:
                        this.zzdh = Long.valueOf(zzarsVar.bX());
                        break;
                    case 72:
                        this.zzdi = Long.valueOf(zzarsVar.bX());
                        break;
                    case 80:
                        this.zzdj = Long.valueOf(zzarsVar.bX());
                        break;
                    case 88:
                        this.zzdk = Long.valueOf(zzarsVar.bX());
                        break;
                    case 96:
                        this.zzdl = Long.valueOf(zzarsVar.bX());
                        break;
                    case 106:
                        this.zzdm = zzarsVar.readString();
                        break;
                    case 112:
                        this.zzdn = Long.valueOf(zzarsVar.bX());
                        break;
                    case 120:
                        this.zzdo = Long.valueOf(zzarsVar.bX());
                        break;
                    case 128:
                        this.zzdp = Long.valueOf(zzarsVar.bX());
                        break;
                    case 136:
                        this.zzdq = Long.valueOf(zzarsVar.bX());
                        break;
                    case 144:
                        this.zzdr = Long.valueOf(zzarsVar.bX());
                        break;
                    case 152:
                        this.zzds = Long.valueOf(zzarsVar.bX());
                        break;
                    case 160:
                        this.zzdt = Long.valueOf(zzarsVar.bX());
                        break;
                    case 168:
                        this.zzev = Long.valueOf(zzarsVar.bX());
                        break;
                    case 176:
                        this.zzdu = Long.valueOf(zzarsVar.bX());
                        break;
                    case 184:
                        this.zzdv = Long.valueOf(zzarsVar.bX());
                        break;
                    case 194:
                        this.zzew = zzarsVar.readString();
                        break;
                    case 200:
                        this.zzfa = Long.valueOf(zzarsVar.bX());
                        break;
                    case JfifUtil.MARKER_RST0 /* 208 */:
                        int bY = zzarsVar.bY();
                        switch (bY) {
                            case 0:
                            case 1:
                            case 2:
                            case 3:
                            case 4:
                            case 5:
                            case 6:
                                this.zzex = Integer.valueOf(bY);
                                continue;
                        }
                    case JfifUtil.MARKER_SOS /* 218 */:
                        this.zzcn = zzarsVar.readString();
                        break;
                    case 224:
                        this.zzey = Boolean.valueOf(zzarsVar.ca());
                        break;
                    case 234:
                        this.zzdw = zzarsVar.readString();
                        break;
                    case 242:
                        this.zzez = zzarsVar.readString();
                        break;
                    case 248:
                        this.zzdx = Long.valueOf(zzarsVar.bX());
                        break;
                    case 256:
                        this.zzdy = Long.valueOf(zzarsVar.bX());
                        break;
                    case 264:
                        this.zzdz = Long.valueOf(zzarsVar.bX());
                        break;
                    case TiffUtil.TIFF_TAG_ORIENTATION /* 274 */:
                        this.zzcp = zzarsVar.readString();
                        break;
                    case 280:
                        this.zzea = Long.valueOf(zzarsVar.bX());
                        break;
                    case 288:
                        this.zzeb = Long.valueOf(zzarsVar.bX());
                        break;
                    case 296:
                        this.zzec = Long.valueOf(zzarsVar.bX());
                        break;
                    case 306:
                        if (this.zzed == null) {
                            this.zzed = new zzb();
                        }
                        zzarsVar.zza(this.zzed);
                        break;
                    case 312:
                        this.zzee = Long.valueOf(zzarsVar.bX());
                        break;
                    case 320:
                        this.zzef = Long.valueOf(zzarsVar.bX());
                        break;
                    case 328:
                        this.zzeg = Long.valueOf(zzarsVar.bX());
                        break;
                    case 336:
                        this.zzeh = Long.valueOf(zzarsVar.bX());
                        break;
                    case 346:
                        int zzc = zzasd.zzc(zzarsVar, 346);
                        int length = this.zzet == null ? 0 : this.zzet.length;
                        C0071zza[] c0071zzaArr = new C0071zza[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.zzet, 0, c0071zzaArr, 0, length);
                        }
                        while (length < c0071zzaArr.length - 1) {
                            c0071zzaArr[length] = new C0071zza();
                            zzarsVar.zza(c0071zzaArr[length]);
                            zzarsVar.bU();
                            length++;
                        }
                        c0071zzaArr[length] = new C0071zza();
                        zzarsVar.zza(c0071zzaArr[length]);
                        this.zzet = c0071zzaArr;
                        break;
                    case 352:
                        this.zzei = Long.valueOf(zzarsVar.bX());
                        break;
                    case InstreamAd.DEFAULT_VIDEO_QUALITY /* 360 */:
                        this.zzej = Long.valueOf(zzarsVar.bX());
                        break;
                    case 370:
                        this.zzcq = zzarsVar.readString();
                        break;
                    case 378:
                        this.zzcr = zzarsVar.readString();
                        break;
                    case BitmapCounterProvider.MAX_BITMAP_COUNT /* 384 */:
                        int bY2 = zzarsVar.bY();
                        switch (bY2) {
                            case 0:
                            case 1:
                            case 2:
                            case 1000:
                                this.zzek = Integer.valueOf(bY2);
                                continue;
                        }
                    case 392:
                        int bY3 = zzarsVar.bY();
                        switch (bY3) {
                            case 0:
                            case 1:
                            case 2:
                            case 1000:
                                this.zzel = Integer.valueOf(bY3);
                                continue;
                        }
                    case 402:
                        if (this.zzes == null) {
                            this.zzes = new C0071zza();
                        }
                        zzarsVar.zza(this.zzes);
                        break;
                    case 408:
                        this.zzem = Long.valueOf(zzarsVar.bX());
                        break;
                    case 416:
                        this.zzen = Long.valueOf(zzarsVar.bX());
                        break;
                    case 424:
                        this.zzeo = Long.valueOf(zzarsVar.bX());
                        break;
                    case 432:
                        this.zzep = Long.valueOf(zzarsVar.bX());
                        break;
                    case 440:
                        this.zzeq = Long.valueOf(zzarsVar.bX());
                        break;
                    case 448:
                        int bY4 = zzarsVar.bY();
                        switch (bY4) {
                            case 0:
                            case 1:
                            case 2:
                            case 1000:
                                this.zzer = Integer.valueOf(bY4);
                                continue;
                        }
                    case 458:
                        if (this.zzeu == null) {
                            this.zzeu = new zzb();
                        }
                        zzarsVar.zza(this.zzeu);
                        break;
                    case 1610:
                        if (this.zzfb == null) {
                            this.zzfb = new zze();
                        }
                        zzarsVar.zza(this.zzfb);
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

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        protected int zzx() {
            int zzx = super.zzx();
            if (this.zzdb != null) {
                zzx += zzart.zzr(1, this.zzdb);
            }
            if (this.zzda != null) {
                zzx += zzart.zzr(2, this.zzda);
            }
            if (this.zzdc != null) {
                zzx += zzart.zzf(3, this.zzdc.longValue());
            }
            if (this.zzdd != null) {
                zzx += zzart.zzf(4, this.zzdd.longValue());
            }
            if (this.zzde != null) {
                zzx += zzart.zzf(5, this.zzde.longValue());
            }
            if (this.zzdf != null) {
                zzx += zzart.zzf(6, this.zzdf.longValue());
            }
            if (this.zzdg != null) {
                zzx += zzart.zzf(7, this.zzdg.longValue());
            }
            if (this.zzdh != null) {
                zzx += zzart.zzf(8, this.zzdh.longValue());
            }
            if (this.zzdi != null) {
                zzx += zzart.zzf(9, this.zzdi.longValue());
            }
            if (this.zzdj != null) {
                zzx += zzart.zzf(10, this.zzdj.longValue());
            }
            if (this.zzdk != null) {
                zzx += zzart.zzf(11, this.zzdk.longValue());
            }
            if (this.zzdl != null) {
                zzx += zzart.zzf(12, this.zzdl.longValue());
            }
            if (this.zzdm != null) {
                zzx += zzart.zzr(13, this.zzdm);
            }
            if (this.zzdn != null) {
                zzx += zzart.zzf(14, this.zzdn.longValue());
            }
            if (this.zzdo != null) {
                zzx += zzart.zzf(15, this.zzdo.longValue());
            }
            if (this.zzdp != null) {
                zzx += zzart.zzf(16, this.zzdp.longValue());
            }
            if (this.zzdq != null) {
                zzx += zzart.zzf(17, this.zzdq.longValue());
            }
            if (this.zzdr != null) {
                zzx += zzart.zzf(18, this.zzdr.longValue());
            }
            if (this.zzds != null) {
                zzx += zzart.zzf(19, this.zzds.longValue());
            }
            if (this.zzdt != null) {
                zzx += zzart.zzf(20, this.zzdt.longValue());
            }
            if (this.zzev != null) {
                zzx += zzart.zzf(21, this.zzev.longValue());
            }
            if (this.zzdu != null) {
                zzx += zzart.zzf(22, this.zzdu.longValue());
            }
            if (this.zzdv != null) {
                zzx += zzart.zzf(23, this.zzdv.longValue());
            }
            if (this.zzew != null) {
                zzx += zzart.zzr(24, this.zzew);
            }
            if (this.zzfa != null) {
                zzx += zzart.zzf(25, this.zzfa.longValue());
            }
            if (this.zzex != null) {
                zzx += zzart.zzah(26, this.zzex.intValue());
            }
            if (this.zzcn != null) {
                zzx += zzart.zzr(27, this.zzcn);
            }
            if (this.zzey != null) {
                zzx += zzart.zzh(28, this.zzey.booleanValue());
            }
            if (this.zzdw != null) {
                zzx += zzart.zzr(29, this.zzdw);
            }
            if (this.zzez != null) {
                zzx += zzart.zzr(30, this.zzez);
            }
            if (this.zzdx != null) {
                zzx += zzart.zzf(31, this.zzdx.longValue());
            }
            if (this.zzdy != null) {
                zzx += zzart.zzf(32, this.zzdy.longValue());
            }
            if (this.zzdz != null) {
                zzx += zzart.zzf(33, this.zzdz.longValue());
            }
            if (this.zzcp != null) {
                zzx += zzart.zzr(34, this.zzcp);
            }
            if (this.zzea != null) {
                zzx += zzart.zzf(35, this.zzea.longValue());
            }
            if (this.zzeb != null) {
                zzx += zzart.zzf(36, this.zzeb.longValue());
            }
            if (this.zzec != null) {
                zzx += zzart.zzf(37, this.zzec.longValue());
            }
            if (this.zzed != null) {
                zzx += zzart.zzc(38, this.zzed);
            }
            if (this.zzee != null) {
                zzx += zzart.zzf(39, this.zzee.longValue());
            }
            if (this.zzef != null) {
                zzx += zzart.zzf(40, this.zzef.longValue());
            }
            if (this.zzeg != null) {
                zzx += zzart.zzf(41, this.zzeg.longValue());
            }
            if (this.zzeh != null) {
                zzx += zzart.zzf(42, this.zzeh.longValue());
            }
            if (this.zzet != null && this.zzet.length > 0) {
                int i = zzx;
                for (int i2 = 0; i2 < this.zzet.length; i2++) {
                    C0071zza c0071zza = this.zzet[i2];
                    if (c0071zza != null) {
                        i += zzart.zzc(43, c0071zza);
                    }
                }
                zzx = i;
            }
            if (this.zzei != null) {
                zzx += zzart.zzf(44, this.zzei.longValue());
            }
            if (this.zzej != null) {
                zzx += zzart.zzf(45, this.zzej.longValue());
            }
            if (this.zzcq != null) {
                zzx += zzart.zzr(46, this.zzcq);
            }
            if (this.zzcr != null) {
                zzx += zzart.zzr(47, this.zzcr);
            }
            if (this.zzek != null) {
                zzx += zzart.zzah(48, this.zzek.intValue());
            }
            if (this.zzel != null) {
                zzx += zzart.zzah(49, this.zzel.intValue());
            }
            if (this.zzes != null) {
                zzx += zzart.zzc(50, this.zzes);
            }
            if (this.zzem != null) {
                zzx += zzart.zzf(51, this.zzem.longValue());
            }
            if (this.zzen != null) {
                zzx += zzart.zzf(52, this.zzen.longValue());
            }
            if (this.zzeo != null) {
                zzx += zzart.zzf(53, this.zzeo.longValue());
            }
            if (this.zzep != null) {
                zzx += zzart.zzf(54, this.zzep.longValue());
            }
            if (this.zzeq != null) {
                zzx += zzart.zzf(55, this.zzeq.longValue());
            }
            if (this.zzer != null) {
                zzx += zzart.zzah(56, this.zzer.intValue());
            }
            if (this.zzeu != null) {
                zzx += zzart.zzc(57, this.zzeu);
            }
            return this.zzfb != null ? zzx + zzart.zzc((int) VKAPIRequest.ERROR_AUDIO_ACCESS, this.zzfb) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzb extends zzaru<zzb> {
        public Long zzfo = null;
        public Integer zzfp = null;
        public Boolean zzfq = null;
        public int[] zzfr = zzasd.btR;
        public Long zzfs = null;

        public zzb() {
            this.btP = -1;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzfo != null) {
                zzartVar.zzb(1, this.zzfo.longValue());
            }
            if (this.zzfp != null) {
                zzartVar.zzaf(2, this.zzfp.intValue());
            }
            if (this.zzfq != null) {
                zzartVar.zzg(3, this.zzfq.booleanValue());
            }
            if (this.zzfr != null && this.zzfr.length > 0) {
                for (int i = 0; i < this.zzfr.length; i++) {
                    zzartVar.zzaf(4, this.zzfr[i]);
                }
            }
            if (this.zzfs != null) {
                zzartVar.zza(5, this.zzfs.longValue());
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzi */
        public zzb zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.zzfo = Long.valueOf(zzarsVar.bX());
                        break;
                    case 16:
                        this.zzfp = Integer.valueOf(zzarsVar.bY());
                        break;
                    case 24:
                        this.zzfq = Boolean.valueOf(zzarsVar.ca());
                        break;
                    case 32:
                        int zzc = zzasd.zzc(zzarsVar, 32);
                        int length = this.zzfr == null ? 0 : this.zzfr.length;
                        int[] iArr = new int[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.zzfr, 0, iArr, 0, length);
                        }
                        while (length < iArr.length - 1) {
                            iArr[length] = zzarsVar.bY();
                            zzarsVar.bU();
                            length++;
                        }
                        iArr[length] = zzarsVar.bY();
                        this.zzfr = iArr;
                        break;
                    case 34:
                        int zzagt = zzarsVar.zzagt(zzarsVar.cd());
                        int position = zzarsVar.getPosition();
                        int i = 0;
                        while (zzarsVar.ci() > 0) {
                            zzarsVar.bY();
                            i++;
                        }
                        zzarsVar.zzagv(position);
                        int length2 = this.zzfr == null ? 0 : this.zzfr.length;
                        int[] iArr2 = new int[i + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.zzfr, 0, iArr2, 0, length2);
                        }
                        while (length2 < iArr2.length) {
                            iArr2[length2] = zzarsVar.bY();
                            length2++;
                        }
                        this.zzfr = iArr2;
                        zzarsVar.zzagu(zzagt);
                        break;
                    case 40:
                        this.zzfs = Long.valueOf(zzarsVar.bW());
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

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        protected int zzx() {
            int zzx = super.zzx();
            if (this.zzfo != null) {
                zzx += zzart.zzf(1, this.zzfo.longValue());
            }
            if (this.zzfp != null) {
                zzx += zzart.zzah(2, this.zzfp.intValue());
            }
            if (this.zzfq != null) {
                zzx += zzart.zzh(3, this.zzfq.booleanValue());
            }
            if (this.zzfr != null && this.zzfr.length > 0) {
                int i = 0;
                for (int i2 = 0; i2 < this.zzfr.length; i2++) {
                    i += zzart.zzagz(this.zzfr[i2]);
                }
                zzx = zzx + i + (this.zzfr.length * 1);
            }
            return this.zzfs != null ? zzx + zzart.zze(5, this.zzfs.longValue()) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzc extends zzaru<zzc> {
        public byte[] zzft = null;
        public byte[] zzfu = null;

        public zzc() {
            this.btP = -1;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzft != null) {
                zzartVar.zzb(1, this.zzft);
            }
            if (this.zzfu != null) {
                zzartVar.zzb(2, this.zzfu);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzj */
        public zzc zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.zzft = zzarsVar.readBytes();
                        break;
                    case 18:
                        this.zzfu = zzarsVar.readBytes();
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

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        protected int zzx() {
            int zzx = super.zzx();
            if (this.zzft != null) {
                zzx += zzart.zzc(1, this.zzft);
            }
            return this.zzfu != null ? zzx + zzart.zzc(2, this.zzfu) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzd extends zzaru<zzd> {
        public byte[] data = null;
        public byte[] zzfv = null;
        public byte[] zzfw = null;
        public byte[] zzfx = null;

        public zzd() {
            this.btP = -1;
        }

        public static zzd zze(byte[] bArr) throws zzarz {
            return (zzd) zzasa.zza(new zzd(), bArr);
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.data != null) {
                zzartVar.zzb(1, this.data);
            }
            if (this.zzfv != null) {
                zzartVar.zzb(2, this.zzfv);
            }
            if (this.zzfw != null) {
                zzartVar.zzb(3, this.zzfw);
            }
            if (this.zzfx != null) {
                zzartVar.zzb(4, this.zzfx);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzk */
        public zzd zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        this.data = zzarsVar.readBytes();
                        break;
                    case 18:
                        this.zzfv = zzarsVar.readBytes();
                        break;
                    case 26:
                        this.zzfw = zzarsVar.readBytes();
                        break;
                    case 34:
                        this.zzfx = zzarsVar.readBytes();
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

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        protected int zzx() {
            int zzx = super.zzx();
            if (this.data != null) {
                zzx += zzart.zzc(1, this.data);
            }
            if (this.zzfv != null) {
                zzx += zzart.zzc(2, this.zzfv);
            }
            if (this.zzfw != null) {
                zzx += zzart.zzc(3, this.zzfw);
            }
            return this.zzfx != null ? zzx + zzart.zzc(4, this.zzfx) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zze extends zzaru<zze> {
        public Long zzfo = null;
        public String zzfy = null;
        public byte[] zzfz = null;

        public zze() {
            this.btP = -1;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzfo != null) {
                zzartVar.zzb(1, this.zzfo.longValue());
            }
            if (this.zzfy != null) {
                zzartVar.zzq(3, this.zzfy);
            }
            if (this.zzfz != null) {
                zzartVar.zzb(4, this.zzfz);
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzl */
        public zze zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 8:
                        this.zzfo = Long.valueOf(zzarsVar.bX());
                        break;
                    case 26:
                        this.zzfy = zzarsVar.readString();
                        break;
                    case 34:
                        this.zzfz = zzarsVar.readBytes();
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

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        protected int zzx() {
            int zzx = super.zzx();
            if (this.zzfo != null) {
                zzx += zzart.zzf(1, this.zzfo.longValue());
            }
            if (this.zzfy != null) {
                zzx += zzart.zzr(3, this.zzfy);
            }
            return this.zzfz != null ? zzx + zzart.zzc(4, this.zzfz) : zzx;
        }
    }

    /* loaded from: classes2.dex */
    public static final class zzf extends zzaru<zzf> {
        public byte[][] zzga = zzasd.btX;
        public byte[] zzfv = null;
        public Integer zzgb = null;
        public Integer zzgc = null;

        public zzf() {
            this.btP = -1;
        }

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        public void zza(zzart zzartVar) throws IOException {
            if (this.zzga != null && this.zzga.length > 0) {
                for (int i = 0; i < this.zzga.length; i++) {
                    byte[] bArr = this.zzga[i];
                    if (bArr != null) {
                        zzartVar.zzb(1, bArr);
                    }
                }
            }
            if (this.zzfv != null) {
                zzartVar.zzb(2, this.zzfv);
            }
            if (this.zzgb != null) {
                zzartVar.zzaf(3, this.zzgb.intValue());
            }
            if (this.zzgc != null) {
                zzartVar.zzaf(4, this.zzgc.intValue());
            }
            super.zza(zzartVar);
        }

        @Override // com.google.android.gms.internal.zzasa
        /* renamed from: zzm */
        public zzf zzb(zzars zzarsVar) throws IOException {
            while (true) {
                int bU = zzarsVar.bU();
                switch (bU) {
                    case 0:
                        break;
                    case 10:
                        int zzc = zzasd.zzc(zzarsVar, 10);
                        int length = this.zzga == null ? 0 : this.zzga.length;
                        byte[][] bArr = new byte[zzc + length];
                        if (length != 0) {
                            System.arraycopy(this.zzga, 0, bArr, 0, length);
                        }
                        while (length < bArr.length - 1) {
                            bArr[length] = zzarsVar.readBytes();
                            zzarsVar.bU();
                            length++;
                        }
                        bArr[length] = zzarsVar.readBytes();
                        this.zzga = bArr;
                        break;
                    case 18:
                        this.zzfv = zzarsVar.readBytes();
                        break;
                    case 24:
                        int bY = zzarsVar.bY();
                        switch (bY) {
                            case 0:
                            case 1:
                                this.zzgb = Integer.valueOf(bY);
                                continue;
                        }
                    case 32:
                        int bY2 = zzarsVar.bY();
                        switch (bY2) {
                            case 0:
                            case 1:
                                this.zzgc = Integer.valueOf(bY2);
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

        @Override // com.google.android.gms.internal.zzaru, com.google.android.gms.internal.zzasa
        protected int zzx() {
            int i;
            int zzx = super.zzx();
            if (this.zzga == null || this.zzga.length <= 0) {
                i = zzx;
            } else {
                int i2 = 0;
                int i3 = 0;
                for (int i4 = 0; i4 < this.zzga.length; i4++) {
                    byte[] bArr = this.zzga[i4];
                    if (bArr != null) {
                        i3++;
                        i2 += zzart.zzbg(bArr);
                    }
                }
                i = zzx + i2 + (i3 * 1);
            }
            if (this.zzfv != null) {
                i += zzart.zzc(2, this.zzfv);
            }
            if (this.zzgb != null) {
                i += zzart.zzah(3, this.zzgb.intValue());
            }
            return this.zzgc != null ? i + zzart.zzah(4, this.zzgc.intValue()) : i;
        }
    }
}
