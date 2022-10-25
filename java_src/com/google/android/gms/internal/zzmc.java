package com.google.android.gms.internal;

import android.content.Context;
import android.view.ViewGroup;
@zzji
/* loaded from: classes.dex */
public class zzmc {
    private final Context mContext;
    private final zzmd zzbnz;
    private com.google.android.gms.ads.internal.overlay.zzk zzcep;
    private final ViewGroup zzcyz;

    public zzmc(Context context, ViewGroup viewGroup, zzmd zzmdVar) {
        this(context, viewGroup, zzmdVar, null);
    }

    zzmc(Context context, ViewGroup viewGroup, zzmd zzmdVar, com.google.android.gms.ads.internal.overlay.zzk zzkVar) {
        this.mContext = context;
        this.zzcyz = viewGroup;
        this.zzbnz = zzmdVar;
        this.zzcep = zzkVar;
    }

    public void onDestroy() {
        com.google.android.gms.common.internal.zzaa.zzhs("onDestroy must be called from the UI thread.");
        if (this.zzcep != null) {
            this.zzcep.destroy();
            this.zzcyz.removeView(this.zzcep);
            this.zzcep = null;
        }
    }

    public void onPause() {
        com.google.android.gms.common.internal.zzaa.zzhs("onPause must be called from the UI thread.");
        if (this.zzcep != null) {
            this.zzcep.pause();
        }
    }

    public void zza(int i, int i2, int i3, int i4, int i5, boolean z) {
        if (this.zzcep != null) {
            return;
        }
        zzdv.zza(this.zzbnz.zzxm().zzly(), this.zzbnz.zzxl(), "vpr2");
        this.zzcep = new com.google.android.gms.ads.internal.overlay.zzk(this.mContext, this.zzbnz, i5, z, this.zzbnz.zzxm().zzly());
        this.zzcyz.addView(this.zzcep, 0, new ViewGroup.LayoutParams(-1, -1));
        this.zzcep.zzd(i, i2, i3, i4);
        this.zzbnz.zzxc().zzao(false);
    }

    public void zze(int i, int i2, int i3, int i4) {
        com.google.android.gms.common.internal.zzaa.zzhs("The underlay may only be modified from the UI thread.");
        if (this.zzcep != null) {
            this.zzcep.zzd(i, i2, i3, i4);
        }
    }

    public com.google.android.gms.ads.internal.overlay.zzk zzwv() {
        com.google.android.gms.common.internal.zzaa.zzhs("getAdVideoUnderlay must be called from the UI thread.");
        return this.zzcep;
    }
}
