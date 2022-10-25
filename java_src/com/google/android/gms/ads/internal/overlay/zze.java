package com.google.android.gms.ads.internal.overlay;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import com.google.android.gms.ads.AdActivity;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zze {
    public void zza(Context context, AdOverlayInfoParcel adOverlayInfoParcel) {
        zza(context, adOverlayInfoParcel, true);
    }

    public void zza(Context context, AdOverlayInfoParcel adOverlayInfoParcel, boolean z) {
        if (adOverlayInfoParcel.zzcbs == 4 && adOverlayInfoParcel.zzcbl == null) {
            if (adOverlayInfoParcel.zzcbk != null) {
                adOverlayInfoParcel.zzcbk.onAdClicked();
            }
            com.google.android.gms.ads.internal.zzu.zzgj().zza(context, adOverlayInfoParcel.zzcbj, adOverlayInfoParcel.zzcbr);
            return;
        }
        Intent intent = new Intent();
        intent.setClassName(context, AdActivity.CLASS_NAME);
        intent.putExtra("com.google.android.gms.ads.internal.overlay.useClientJar", adOverlayInfoParcel.zzari.zzcyc);
        intent.putExtra("shouldCallOnOverlayOpened", z);
        AdOverlayInfoParcel.zza(intent, adOverlayInfoParcel);
        if (!com.google.android.gms.common.util.zzs.zzayw()) {
            intent.addFlags(524288);
        }
        if (!(context instanceof Activity)) {
            intent.addFlags(268435456);
        }
        com.google.android.gms.ads.internal.zzu.zzgm().zzb(context, intent);
    }
}
