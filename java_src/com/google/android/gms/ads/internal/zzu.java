package com.google.android.gms.ads.internal;

import android.os.Build;
import com.google.android.gms.internal.zzcz;
import com.google.android.gms.internal.zzdo;
import com.google.android.gms.internal.zzdp;
import com.google.android.gms.internal.zzdq;
import com.google.android.gms.internal.zzdu;
import com.google.android.gms.internal.zzfr;
import com.google.android.gms.internal.zzfz;
import com.google.android.gms.internal.zzgl;
import com.google.android.gms.internal.zzgv;
import com.google.android.gms.internal.zziu;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzjs;
import com.google.android.gms.internal.zzkr;
import com.google.android.gms.internal.zzlb;
import com.google.android.gms.internal.zzlc;
import com.google.android.gms.internal.zzlf;
import com.google.android.gms.internal.zzlj;
import com.google.android.gms.internal.zzlk;
import com.google.android.gms.internal.zzlv;
import com.google.android.gms.internal.zzly;
import com.google.android.gms.internal.zzmf;
@zzji
/* loaded from: classes.dex */
public class zzu {
    private static final Object zzaox = new Object();
    private static zzu zzaqa;
    private final com.google.android.gms.ads.internal.overlay.zza zzaqb = new com.google.android.gms.ads.internal.overlay.zza();
    private final com.google.android.gms.ads.internal.request.zza zzaqc = new com.google.android.gms.ads.internal.request.zza();
    private final com.google.android.gms.ads.internal.overlay.zze zzaqd = new com.google.android.gms.ads.internal.overlay.zze();
    private final zziu zzaqe = new zziu();
    private final zzlb zzaqf = new zzlb();
    private final zzmf zzaqg = new zzmf();
    private final zzlc zzaqh = zzlc.zzbh(Build.VERSION.SDK_INT);
    private final zzcz zzaqi = new zzcz();
    private final zzkr zzaqj = new zzkr(this.zzaqf);
    private final com.google.android.gms.ads.internal.cache.zza zzaqk = new com.google.android.gms.ads.internal.cache.zza();
    private final com.google.android.gms.common.util.zze zzaql = com.google.android.gms.common.util.zzh.zzayl();
    private final zzg zzaqm = new zzg();
    private final zzdu zzaqn = new zzdu();
    private final zzlf zzaqo = new zzlf();
    private final zzjs zzaqp = new zzjs();
    private final zzdo zzaqq = new zzdo();
    private final zzdp zzaqr = new zzdp();
    private final zzdq zzaqs = new zzdq();
    private final zzlv zzaqt = new zzlv();
    private final com.google.android.gms.ads.internal.purchase.zzi zzaqu = new com.google.android.gms.ads.internal.purchase.zzi();
    private final zzfz zzaqv = new zzfz();
    private final zzgl zzaqw = new zzgl();
    private final zzlj zzaqx = new zzlj();
    private final com.google.android.gms.ads.internal.overlay.zzq zzaqy = new com.google.android.gms.ads.internal.overlay.zzq();
    private final com.google.android.gms.ads.internal.overlay.zzr zzaqz = new com.google.android.gms.ads.internal.overlay.zzr();
    private final zzgv zzara = new zzgv();
    private final zzlk zzarb = new zzlk();
    private final zzp zzarc = new zzp();
    private final zzfr zzard = new zzfr();
    private final zzly zzare = new zzly();

    static {
        zza(new zzu());
    }

    protected zzu() {
    }

    protected static void zza(zzu zzuVar) {
        synchronized (zzaox) {
            zzaqa = zzuVar;
        }
    }

    private static zzu zzgh() {
        zzu zzuVar;
        synchronized (zzaox) {
            zzuVar = zzaqa;
        }
        return zzuVar;
    }

    public static com.google.android.gms.ads.internal.request.zza zzgi() {
        return zzgh().zzaqc;
    }

    public static com.google.android.gms.ads.internal.overlay.zza zzgj() {
        return zzgh().zzaqb;
    }

    public static com.google.android.gms.ads.internal.overlay.zze zzgk() {
        return zzgh().zzaqd;
    }

    public static zziu zzgl() {
        return zzgh().zzaqe;
    }

    public static zzlb zzgm() {
        return zzgh().zzaqf;
    }

    public static zzmf zzgn() {
        return zzgh().zzaqg;
    }

    public static zzlc zzgo() {
        return zzgh().zzaqh;
    }

    public static zzcz zzgp() {
        return zzgh().zzaqi;
    }

    public static zzkr zzgq() {
        return zzgh().zzaqj;
    }

    public static com.google.android.gms.ads.internal.cache.zza zzgr() {
        return zzgh().zzaqk;
    }

    public static com.google.android.gms.common.util.zze zzgs() {
        return zzgh().zzaql;
    }

    public static zzdu zzgt() {
        return zzgh().zzaqn;
    }

    public static zzlf zzgu() {
        return zzgh().zzaqo;
    }

    public static zzjs zzgv() {
        return zzgh().zzaqp;
    }

    public static zzdp zzgw() {
        return zzgh().zzaqr;
    }

    public static zzdo zzgx() {
        return zzgh().zzaqq;
    }

    public static zzdq zzgy() {
        return zzgh().zzaqs;
    }

    public static zzlv zzgz() {
        return zzgh().zzaqt;
    }

    public static com.google.android.gms.ads.internal.purchase.zzi zzha() {
        return zzgh().zzaqu;
    }

    public static zzfz zzhb() {
        return zzgh().zzaqv;
    }

    public static zzlj zzhc() {
        return zzgh().zzaqx;
    }

    public static com.google.android.gms.ads.internal.overlay.zzq zzhd() {
        return zzgh().zzaqy;
    }

    public static com.google.android.gms.ads.internal.overlay.zzr zzhe() {
        return zzgh().zzaqz;
    }

    public static zzgv zzhf() {
        return zzgh().zzara;
    }

    public static zzp zzhg() {
        return zzgh().zzarc;
    }

    public static zzlk zzhh() {
        return zzgh().zzarb;
    }

    public static zzg zzhi() {
        return zzgh().zzaqm;
    }

    public static zzfr zzhj() {
        return zzgh().zzard;
    }

    public static zzly zzhk() {
        return zzgh().zzare;
    }
}
