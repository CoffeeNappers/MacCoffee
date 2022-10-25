package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.client.zzaa;
import com.google.android.gms.ads.internal.client.zzz;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzai extends com.google.android.gms.dynamic.zzg<zzaa> {
    public zzai() {
        super("com.google.android.gms.ads.MobileAdsSettingManagerCreatorImpl");
    }

    public zzz zzl(Context context) {
        try {
            return zzz.zza.zzu(zzcr(context).zza(com.google.android.gms.dynamic.zze.zzac(context), 9877000));
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not get remote MobileAdsSettingManager.", e);
            return null;
        } catch (zzg.zza e2) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not get remote MobileAdsSettingManager.", e2);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.dynamic.zzg
    /* renamed from: zzy */
    public zzaa zzc(IBinder iBinder) {
        return zzaa.zza.zzv(iBinder);
    }
}
