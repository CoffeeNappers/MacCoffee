package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.reward.client.RewardedVideoAdRequestParcel;
import com.google.android.gms.ads.internal.reward.client.zzb;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
@zzji
/* loaded from: classes.dex */
public class zzka extends zzb.zza {
    private final Context mContext;
    private final Object zzako;
    private final VersionInfoParcel zzanu;
    private final zzkb zzcqx;

    zzka(Context context, VersionInfoParcel versionInfoParcel, zzkb zzkbVar) {
        this.zzako = new Object();
        this.mContext = context;
        this.zzanu = versionInfoParcel;
        this.zzcqx = zzkbVar;
    }

    public zzka(Context context, com.google.android.gms.ads.internal.zzd zzdVar, zzgz zzgzVar, VersionInfoParcel versionInfoParcel) {
        this(context, versionInfoParcel, new zzkb(context, zzdVar, AdSizeParcel.zzkc(), zzgzVar, versionInfoParcel));
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void destroy() {
        zzh(null);
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public boolean isLoaded() {
        boolean isLoaded;
        synchronized (this.zzako) {
            isLoaded = this.zzcqx.isLoaded();
        }
        return isLoaded;
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void pause() {
        zzf(null);
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void resume() {
        zzg(null);
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void setUserId(String str) {
        zzkx.zzdi("RewardedVideoAd.setUserId() is deprecated. Please do not call this method.");
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void show() {
        synchronized (this.zzako) {
            this.zzcqx.zztu();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void zza(RewardedVideoAdRequestParcel rewardedVideoAdRequestParcel) {
        synchronized (this.zzako) {
            this.zzcqx.zza(rewardedVideoAdRequestParcel);
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void zza(com.google.android.gms.ads.internal.reward.client.zzd zzdVar) {
        synchronized (this.zzako) {
            this.zzcqx.zza(zzdVar);
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void zzf(com.google.android.gms.dynamic.zzd zzdVar) {
        synchronized (this.zzako) {
            this.zzcqx.pause();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void zzg(com.google.android.gms.dynamic.zzd zzdVar) {
        Context context;
        synchronized (this.zzako) {
            if (zzdVar == null) {
                context = null;
            } else {
                try {
                    context = (Context) com.google.android.gms.dynamic.zze.zzae(zzdVar);
                } catch (Exception e) {
                    zzkx.zzc("Unable to extract updated context.", e);
                }
            }
            if (context != null) {
                this.zzcqx.onContextChanged(context);
            }
            this.zzcqx.resume();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.client.zzb
    public void zzh(com.google.android.gms.dynamic.zzd zzdVar) {
        synchronized (this.zzako) {
            this.zzcqx.destroy();
        }
    }
}
