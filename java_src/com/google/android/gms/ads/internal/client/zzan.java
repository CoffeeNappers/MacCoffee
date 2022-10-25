package com.google.android.gms.ads.internal.client;

import android.os.RemoteException;
import com.google.android.gms.ads.internal.reward.client.RewardedVideoAdRequestParcel;
import com.google.android.gms.ads.internal.reward.client.zzb;
/* loaded from: classes.dex */
public class zzan extends zzb.zza {
    private com.google.android.gms.ads.internal.reward.client.zzd zzbbv;

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void destroy() throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public boolean isLoaded() throws RemoteException {
        return false;
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void pause() throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void resume() throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void setUserId(String str) throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void show() throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void zza(RewardedVideoAdRequestParcel rewardedVideoAdRequestParcel) throws RemoteException {
        com.google.android.gms.ads.internal.util.client.zzb.e("This app is using a lightweight version of the Google Mobile Ads SDK that requires the latest Google Play services to be installed, but Google Play services is either missing or out of date.");
        com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.ads.internal.client.zzan.1
            @Override // java.lang.Runnable
            public void run() {
                if (zzan.this.zzbbv != null) {
                    try {
                        zzan.this.zzbbv.onRewardedVideoAdFailedToLoad(1);
                    } catch (RemoteException e) {
                        com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not notify onRewardedVideoAdFailedToLoad event.", e);
                    }
                }
            }
        });
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void zza(com.google.android.gms.ads.internal.reward.client.zzd zzdVar) throws RemoteException {
        this.zzbbv = zzdVar;
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void zzf(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void zzg(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void zzh(com.google.android.gms.dynamic.zzd zzdVar) throws RemoteException {
    }
}
