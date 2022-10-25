package com.google.android.gms.ads.internal.reward.client;

import android.os.RemoteException;
import com.google.android.gms.ads.reward.RewardItem;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zze implements RewardItem {
    private final zza zzcrc;

    public zze(zza zzaVar) {
        this.zzcrc = zzaVar;
    }

    @Override // com.google.android.gms.ads.reward.RewardItem
    public int getAmount() {
        if (this.zzcrc == null) {
            return 0;
        }
        try {
            return this.zzcrc.getAmount();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward getAmount to RewardItem", e);
            return 0;
        }
    }

    @Override // com.google.android.gms.ads.reward.RewardItem
    public String getType() {
        if (this.zzcrc == null) {
            return null;
        }
        try {
            return this.zzcrc.getType();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not forward getType to RewardItem", e);
            return null;
        }
    }
}
