package com.google.android.gms.internal;

import android.app.Activity;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.internal.zzih;
import com.google.android.gms.internal.zzii;
@zzji
/* loaded from: classes.dex */
public final class zzim extends com.google.android.gms.dynamic.zzg<zzii> {
    public zzim() {
        super("com.google.android.gms.ads.InAppPurchaseManagerCreatorImpl");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.dynamic.zzg
    /* renamed from: zzbc */
    public zzii zzc(IBinder iBinder) {
        return zzii.zza.zzaz(iBinder);
    }

    public zzih zzg(Activity activity) {
        try {
            return zzih.zza.zzay(zzcr(activity).zzp(com.google.android.gms.dynamic.zze.zzac(activity)));
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not create remote InAppPurchaseManager.", e);
            return null;
        } catch (zzg.zza e2) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not create remote InAppPurchaseManager.", e2);
            return null;
        }
    }
}
