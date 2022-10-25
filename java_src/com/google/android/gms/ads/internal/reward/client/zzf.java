package com.google.android.gms.ads.internal.reward.client;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.reward.client.zzb;
import com.google.android.gms.ads.internal.reward.client.zzc;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.internal.zzgz;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzf extends com.google.android.gms.dynamic.zzg<zzc> {
    public zzf() {
        super("com.google.android.gms.ads.reward.RewardedVideoAdCreatorImpl");
    }

    public zzb zzb(Context context, zzgz zzgzVar) {
        try {
            return zzb.zza.zzbh(zzcr(context).zza(com.google.android.gms.dynamic.zze.zzac(context), zzgzVar, 9877000));
        } catch (RemoteException | zzg.zza e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not get remote RewardedVideoAd.", e);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.dynamic.zzg
    /* renamed from: zzbk */
    public zzc zzc(IBinder iBinder) {
        return zzc.zza.zzbi(iBinder);
    }
}
