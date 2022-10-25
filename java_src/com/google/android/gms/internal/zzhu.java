package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import com.google.android.gms.internal.zzht;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzhu extends zzhv implements zzfe {
    private final Context mContext;
    private final WindowManager zzati;
    DisplayMetrics zzaur;
    private final zzmd zzbnz;
    private final zzdj zzbzb;
    private float zzbzc;
    int zzbzd;
    int zzbze;
    private int zzbzf;
    int zzbzg;
    int zzbzh;
    int zzbzi;
    int zzbzj;

    public zzhu(zzmd zzmdVar, Context context, zzdj zzdjVar) {
        super(zzmdVar);
        this.zzbzd = -1;
        this.zzbze = -1;
        this.zzbzg = -1;
        this.zzbzh = -1;
        this.zzbzi = -1;
        this.zzbzj = -1;
        this.zzbnz = zzmdVar;
        this.mContext = context;
        this.zzbzb = zzdjVar;
        this.zzati = (WindowManager) context.getSystemService("window");
    }

    private void zzox() {
        this.zzaur = new DisplayMetrics();
        Display defaultDisplay = this.zzati.getDefaultDisplay();
        defaultDisplay.getMetrics(this.zzaur);
        this.zzbzc = this.zzaur.density;
        this.zzbzf = defaultDisplay.getRotation();
    }

    private void zzpc() {
        int[] iArr = new int[2];
        this.zzbnz.getLocationOnScreen(iArr);
        zze(com.google.android.gms.ads.internal.client.zzm.zzkr().zzc(this.mContext, iArr[0]), com.google.android.gms.ads.internal.client.zzm.zzkr().zzc(this.mContext, iArr[1]));
    }

    private zzht zzpf() {
        zzht.zza zzx = new zzht.zza().zzv(this.zzbzb.zzlj()).zzu(this.zzbzb.zzlk()).zzw(this.zzbzb.zzln()).zzx(this.zzbzb.zzll());
        zzdj zzdjVar = this.zzbzb;
        return zzx.zzy(true).zzow();
    }

    @Override // com.google.android.gms.internal.zzfe
    public void zza(zzmd zzmdVar, Map<String, String> map) {
        zzpa();
    }

    public void zze(int i, int i2) {
        int i3 = this.mContext instanceof Activity ? com.google.android.gms.ads.internal.zzu.zzgm().zzk((Activity) this.mContext)[0] : 0;
        if (this.zzbnz.zzeg() == null || !this.zzbnz.zzeg().zzazr) {
            this.zzbzi = com.google.android.gms.ads.internal.client.zzm.zzkr().zzc(this.mContext, this.zzbnz.getMeasuredWidth());
            this.zzbzj = com.google.android.gms.ads.internal.client.zzm.zzkr().zzc(this.mContext, this.zzbnz.getMeasuredHeight());
        }
        zzc(i, i2 - i3, this.zzbzi, this.zzbzj);
        this.zzbnz.zzxc().zzd(i, i2);
    }

    void zzoy() {
        this.zzbzd = com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.zzaur, this.zzaur.widthPixels);
        this.zzbze = com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.zzaur, this.zzaur.heightPixels);
        Activity zzwy = this.zzbnz.zzwy();
        if (zzwy == null || zzwy.getWindow() == null) {
            this.zzbzg = this.zzbzd;
            this.zzbzh = this.zzbze;
            return;
        }
        int[] zzh = com.google.android.gms.ads.internal.zzu.zzgm().zzh(zzwy);
        this.zzbzg = com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.zzaur, zzh[0]);
        this.zzbzh = com.google.android.gms.ads.internal.client.zzm.zzkr().zzb(this.zzaur, zzh[1]);
    }

    void zzoz() {
        if (!this.zzbnz.zzeg().zzazr) {
            this.zzbnz.measure(0, 0);
            return;
        }
        this.zzbzi = this.zzbzd;
        this.zzbzj = this.zzbze;
    }

    public void zzpa() {
        zzox();
        zzoy();
        zzoz();
        zzpd();
        zzpe();
        zzpc();
        zzpb();
    }

    void zzpb() {
        if (zzkx.zzbi(2)) {
            zzkx.zzdh("Dispatching Ready Event.");
        }
        zzcc(this.zzbnz.zzxf().zzda);
    }

    void zzpd() {
        zza(this.zzbzd, this.zzbze, this.zzbzg, this.zzbzh, this.zzbzc, this.zzbzf);
    }

    void zzpe() {
        this.zzbnz.zzb("onDeviceFeaturesReceived", zzpf().toJson());
    }
}
