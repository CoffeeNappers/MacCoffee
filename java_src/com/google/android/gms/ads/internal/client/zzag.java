package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.ads.reward.RewardedVideoAd;
import com.google.android.gms.internal.zzgy;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzag {
    private static final Object zzaox = new Object();
    private static zzag zzbbp;
    private zzz zzbbq;
    private RewardedVideoAd zzbbr;

    private zzag() {
    }

    public static zzag zzli() {
        zzag zzagVar;
        synchronized (zzaox) {
            if (zzbbp == null) {
                zzbbp = new zzag();
            }
            zzagVar = zzbbp;
        }
        return zzagVar;
    }

    public RewardedVideoAd getRewardedVideoAdInstance(Context context) {
        RewardedVideoAd rewardedVideoAd;
        synchronized (zzaox) {
            if (this.zzbbr != null) {
                rewardedVideoAd = this.zzbbr;
            } else {
                this.zzbbr = new com.google.android.gms.ads.internal.reward.client.zzi(context, zzm.zzks().zza(context, new zzgy()));
                rewardedVideoAd = this.zzbbr;
            }
        }
        return rewardedVideoAd;
    }

    public void openDebugMenu(Context context, String str) {
        com.google.android.gms.common.internal.zzaa.zza(this.zzbbq != null, "MobileAds.initialize() must be called prior to opening debug menu.");
        try {
            this.zzbbq.zzb(com.google.android.gms.dynamic.zze.zzac(context), str);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Unable to open debug menu.", e);
        }
    }

    public void setAppMuted(boolean z) {
        com.google.android.gms.common.internal.zzaa.zza(this.zzbbq != null, "MobileAds.initialize() must be called prior to setting the app volume.");
        try {
            this.zzbbq.setAppMuted(z);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Unable to set app mute state.", e);
        }
    }

    public void setAppVolume(float f) {
        boolean z = true;
        com.google.android.gms.common.internal.zzaa.zzb(0.0f <= f && f <= 1.0f, "The app volume must be a value between 0 and 1 inclusive.");
        if (this.zzbbq == null) {
            z = false;
        }
        com.google.android.gms.common.internal.zzaa.zza(z, "MobileAds.initialize() must be called prior to setting the app volume.");
        try {
            this.zzbbq.setAppVolume(f);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Unable to set app volume.", e);
        }
    }

    public void zza(Context context, String str, zzah zzahVar) {
        synchronized (zzaox) {
            if (this.zzbbq != null) {
                return;
            }
            if (context == null) {
                throw new IllegalArgumentException("Context cannot be null.");
            }
            try {
                this.zzbbq = zzm.zzks().zzk(context);
                this.zzbbq.initialize();
                if (str != null) {
                    this.zzbbq.zzz(str);
                }
            } catch (RemoteException e) {
                com.google.android.gms.ads.internal.util.client.zzb.zzc("Fail to initialize or set applicationCode on mobile ads setting manager", e);
            }
        }
    }
}
