package com.google.android.gms.ads.internal.reward.client;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.reward.RewardedVideoAd;
import com.google.android.gms.ads.reward.RewardedVideoAdListener;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzi implements RewardedVideoAd {
    private final Context mContext;
    private final Object zzako = new Object();
    private final zzb zzcrd;
    private RewardedVideoAdListener zzgj;

    public zzi(Context context, zzb zzbVar) {
        this.zzcrd = zzbVar;
        this.mContext = context;
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public void destroy() {
        destroy(null);
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public void destroy(Context context) {
        synchronized (this.zzako) {
            if (this.zzcrd == null) {
                return;
            }
            try {
                this.zzcrd.zzh(com.google.android.gms.dynamic.zze.zzac(context));
            } catch (RemoteException e) {
                com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward destroy to RewardedVideoAd", e);
            }
        }
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public RewardedVideoAdListener getRewardedVideoAdListener() {
        RewardedVideoAdListener rewardedVideoAdListener;
        synchronized (this.zzako) {
            rewardedVideoAdListener = this.zzgj;
        }
        return rewardedVideoAdListener;
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public String getUserId() {
        com.google.android.gms.ads.internal.util.client.zzb.zzdi("RewardedVideoAd.getUserId() is deprecated. Please do not call this method.");
        return null;
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public boolean isLoaded() {
        boolean z = false;
        synchronized (this.zzako) {
            if (this.zzcrd != null) {
                try {
                    z = this.zzcrd.isLoaded();
                } catch (RemoteException e) {
                    com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward isLoaded to RewardedVideoAd", e);
                }
            }
        }
        return z;
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public void loadAd(String str, AdRequest adRequest) {
        synchronized (this.zzako) {
            if (this.zzcrd == null) {
                return;
            }
            try {
                this.zzcrd.zza(com.google.android.gms.ads.internal.client.zzh.zzkb().zza(this.mContext, adRequest.zzdt(), str));
            } catch (RemoteException e) {
                com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward loadAd to RewardedVideoAd", e);
            }
        }
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public void pause() {
        pause(null);
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public void pause(Context context) {
        synchronized (this.zzako) {
            if (this.zzcrd == null) {
                return;
            }
            try {
                this.zzcrd.zzf(com.google.android.gms.dynamic.zze.zzac(context));
            } catch (RemoteException e) {
                com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward pause to RewardedVideoAd", e);
            }
        }
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public void resume() {
        resume(null);
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public void resume(Context context) {
        synchronized (this.zzako) {
            if (this.zzcrd == null) {
                return;
            }
            try {
                this.zzcrd.zzg(com.google.android.gms.dynamic.zze.zzac(context));
            } catch (RemoteException e) {
                com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward resume to RewardedVideoAd", e);
            }
        }
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public void setRewardedVideoAdListener(RewardedVideoAdListener rewardedVideoAdListener) {
        synchronized (this.zzako) {
            this.zzgj = rewardedVideoAdListener;
            if (this.zzcrd != null) {
                try {
                    this.zzcrd.zza(new zzg(rewardedVideoAdListener));
                } catch (RemoteException e) {
                    com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward setRewardedVideoAdListener to RewardedVideoAd", e);
                }
            }
        }
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public void setUserId(String str) {
        com.google.android.gms.ads.internal.util.client.zzb.zzdi("RewardedVideoAd.setUserId() is deprecated. Please do not call this method.");
    }

    @Override // com.google.android.gms.ads.reward.RewardedVideoAd
    public void show() {
        synchronized (this.zzako) {
            if (this.zzcrd == null) {
                return;
            }
            try {
                this.zzcrd.show();
            } catch (RemoteException e) {
                com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward show to RewardedVideoAd", e);
            }
        }
    }
}
