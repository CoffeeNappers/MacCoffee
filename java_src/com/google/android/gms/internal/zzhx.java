package com.google.android.gms.internal;

import android.app.Activity;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.internal.zzhy;
import com.google.android.gms.internal.zzhz;
@zzji
/* loaded from: classes.dex */
public final class zzhx extends com.google.android.gms.dynamic.zzg<zzhz> {
    public zzhx() {
        super("com.google.android.gms.ads.AdOverlayCreatorImpl");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.dynamic.zzg
    /* renamed from: zzas */
    public zzhz zzc(IBinder iBinder) {
        return zzhz.zza.zzau(iBinder);
    }

    public zzhy zzf(Activity activity) {
        try {
            return zzhy.zza.zzat(zzcr(activity).zzo(com.google.android.gms.dynamic.zze.zzac(activity)));
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not create remote AdOverlay.", e);
            return null;
        } catch (zzg.zza e2) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not create remote AdOverlay.", e2);
            return null;
        }
    }
}
