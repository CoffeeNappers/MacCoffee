package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.reward.mediation.client.RewardItemParcel;
import com.google.android.gms.ads.internal.reward.mediation.client.zza;
@zzji
/* loaded from: classes.dex */
public class zzkg extends zza.AbstractBinderC0031zza {
    private volatile zzkh zzcrf;
    private volatile zzke zzcrr;
    private volatile zzkf zzcrs;

    public zzkg(zzkf zzkfVar) {
        this.zzcrs = zzkfVar;
    }

    @Override // com.google.android.gms.ads.internal.reward.mediation.client.zza
    public void zza(com.google.android.gms.dynamic.zzd zzdVar, RewardItemParcel rewardItemParcel) {
        if (this.zzcrs != null) {
            this.zzcrs.zzc(rewardItemParcel);
        }
    }

    public void zza(zzke zzkeVar) {
        this.zzcrr = zzkeVar;
    }

    public void zza(zzkh zzkhVar) {
        this.zzcrf = zzkhVar;
    }

    @Override // com.google.android.gms.ads.internal.reward.mediation.client.zza
    public void zzb(com.google.android.gms.dynamic.zzd zzdVar, int i) {
        if (this.zzcrr != null) {
            this.zzcrr.zzbb(i);
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.mediation.client.zza
    public void zzc(com.google.android.gms.dynamic.zzd zzdVar, int i) {
        if (this.zzcrf != null) {
            this.zzcrf.zza(com.google.android.gms.dynamic.zze.zzae(zzdVar).getClass().getName(), i);
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.mediation.client.zza
    public void zzq(com.google.android.gms.dynamic.zzd zzdVar) {
        if (this.zzcrr != null) {
            this.zzcrr.zzty();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.mediation.client.zza
    public void zzr(com.google.android.gms.dynamic.zzd zzdVar) {
        if (this.zzcrf != null) {
            this.zzcrf.zzcq(com.google.android.gms.dynamic.zze.zzae(zzdVar).getClass().getName());
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.mediation.client.zza
    public void zzs(com.google.android.gms.dynamic.zzd zzdVar) {
        if (this.zzcrs != null) {
            this.zzcrs.onRewardedVideoAdOpened();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.mediation.client.zza
    public void zzt(com.google.android.gms.dynamic.zzd zzdVar) {
        if (this.zzcrs != null) {
            this.zzcrs.onRewardedVideoStarted();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.mediation.client.zza
    public void zzu(com.google.android.gms.dynamic.zzd zzdVar) {
        if (this.zzcrs != null) {
            this.zzcrs.onRewardedVideoAdClosed();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.mediation.client.zza
    public void zzv(com.google.android.gms.dynamic.zzd zzdVar) {
        if (this.zzcrs != null) {
            this.zzcrs.zztv();
        }
    }

    @Override // com.google.android.gms.ads.internal.reward.mediation.client.zza
    public void zzw(com.google.android.gms.dynamic.zzd zzdVar) {
        if (this.zzcrs != null) {
            this.zzcrs.onRewardedVideoAdLeftApplication();
        }
    }
}
