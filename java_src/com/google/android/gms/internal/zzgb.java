package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import java.util.Iterator;
import java.util.LinkedList;
/* JADX INFO: Access modifiers changed from: package-private */
@zzji
/* loaded from: classes.dex */
public class zzgb {
    private final String zzant;
    private final LinkedList<zza> zzbso;
    private AdRequestParcel zzbsp;
    private final int zzbsq;
    private boolean zzbsr;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class zza {
        com.google.android.gms.ads.internal.zzl zzbss;
        @Nullable
        AdRequestParcel zzbst;
        zzfx zzbsu;
        long zzbsv;
        boolean zzbsw;
        boolean zzbsx;

        zza(zzfw zzfwVar) {
            this.zzbss = zzfwVar.zzbk(zzgb.this.zzant);
            this.zzbsu = new zzfx();
            this.zzbsu.zzc(this.zzbss);
        }

        zza(zzgb zzgbVar, zzfw zzfwVar, AdRequestParcel adRequestParcel) {
            this(zzfwVar);
            this.zzbst = adRequestParcel;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public void zznt() {
            if (this.zzbsw) {
                return;
            }
            this.zzbsx = this.zzbss.zzb(zzfz.zzl(this.zzbst != null ? this.zzbst : zzgb.this.zzbsp));
            this.zzbsw = true;
            this.zzbsv = com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzgb(AdRequestParcel adRequestParcel, String str, int i) {
        com.google.android.gms.common.internal.zzaa.zzy(adRequestParcel);
        com.google.android.gms.common.internal.zzaa.zzy(str);
        this.zzbso = new LinkedList<>();
        this.zzbsp = adRequestParcel;
        this.zzant = str;
        this.zzbsq = i;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getAdUnitId() {
        return this.zzant;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getNetworkType() {
        return this.zzbsq;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int size() {
        return this.zzbso.size();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(zzfw zzfwVar, AdRequestParcel adRequestParcel) {
        this.zzbso.add(new zza(this, zzfwVar, adRequestParcel));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzb(zzfw zzfwVar) {
        zza zzaVar = new zza(zzfwVar);
        this.zzbso.add(zzaVar);
        zzaVar.zznt();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AdRequestParcel zzno() {
        return this.zzbsp;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zznp() {
        int i = 0;
        Iterator<zza> it = this.zzbso.iterator();
        while (true) {
            int i2 = i;
            if (it.hasNext()) {
                i = it.next().zzbsw ? i2 + 1 : i2;
            } else {
                return i2;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zznq() {
        Iterator<zza> it = this.zzbso.iterator();
        while (it.hasNext()) {
            it.next().zznt();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zznr() {
        this.zzbsr = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzns() {
        return this.zzbsr;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zza zzp(@Nullable AdRequestParcel adRequestParcel) {
        if (adRequestParcel != null) {
            this.zzbsp = adRequestParcel;
        }
        return this.zzbso.remove();
    }
}
