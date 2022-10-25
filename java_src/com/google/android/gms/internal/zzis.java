package com.google.android.gms.internal;

import android.content.Context;
import android.util.DisplayMetrics;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.internal.zziu;
import com.google.android.gms.internal.zzko;
@zzji
/* loaded from: classes.dex */
public class zzis extends zziq {
    private zzir zzcgu;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzis(Context context, zzko.zza zzaVar, zzmd zzmdVar, zziu.zza zzaVar2) {
        super(context, zzaVar, zzmdVar, zzaVar2);
    }

    @Override // com.google.android.gms.internal.zziq
    protected void zzrx() {
        int i;
        int i2;
        AdSizeParcel zzeg = this.zzbnz.zzeg();
        if (zzeg.zzazr) {
            DisplayMetrics displayMetrics = this.mContext.getResources().getDisplayMetrics();
            i = displayMetrics.widthPixels;
            i2 = displayMetrics.heightPixels;
        } else {
            i = zzeg.widthPixels;
            i2 = zzeg.heightPixels;
        }
        this.zzcgu = new zzir(this, this.zzbnz, i, i2);
        this.zzbnz.zzxc().zza(this);
        this.zzcgu.zza(this.zzcgg);
    }

    @Override // com.google.android.gms.internal.zziq
    protected int zzry() {
        if (!this.zzcgu.zzsc()) {
            return !this.zzcgu.zzsd() ? 2 : -2;
        }
        zzkx.zzdg("Ad-Network indicated no fill with passback URL.");
        return 3;
    }
}
