package com.google.android.gms.ads.internal.reward.client;

import com.google.android.gms.ads.internal.reward.client.zzd;
import com.google.android.gms.ads.reward.RewardedVideoAdListener;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzg extends zzd.zza {
    private final RewardedVideoAdListener zzgj;

    public zzg(RewardedVideoAdListener rewardedVideoAdListener) {
        this.zzgj = rewardedVideoAdListener;
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzd
    public void onRewardedVideoAdClosed() {
        if (this.zzgj != null) {
            this.zzgj.onRewardedVideoAdClosed();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzd
    public void onRewardedVideoAdFailedToLoad(int i) {
        if (this.zzgj != null) {
            this.zzgj.onRewardedVideoAdFailedToLoad(i);
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzd
    public void onRewardedVideoAdLeftApplication() {
        if (this.zzgj != null) {
            this.zzgj.onRewardedVideoAdLeftApplication();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzd
    public void onRewardedVideoAdLoaded() {
        if (this.zzgj != null) {
            this.zzgj.onRewardedVideoAdLoaded();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzd
    public void onRewardedVideoAdOpened() {
        if (this.zzgj != null) {
            this.zzgj.onRewardedVideoAdOpened();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzd
    public void onRewardedVideoStarted() {
        if (this.zzgj != null) {
            this.zzgj.onRewardedVideoStarted();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzd
    public void zza(zza zzaVar) {
        if (this.zzgj != null) {
            this.zzgj.onRewarded(new zze(zzaVar));
        }
    }
}
