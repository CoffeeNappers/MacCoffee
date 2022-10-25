package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.google.ads.mediation.AbstractAdViewAdapter;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.reward.client.RewardedVideoAdRequestParcel;
import com.google.android.gms.ads.internal.reward.mediation.client.RewardItemParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzko;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzkb extends com.google.android.gms.ads.internal.zzb implements zzkf {
    private static final zzgy zzcqy = new zzgy();
    private final Map<String, zzkj> zzcqz;
    private boolean zzcra;

    public zzkb(Context context, com.google.android.gms.ads.internal.zzd zzdVar, AdSizeParcel adSizeParcel, zzgz zzgzVar, VersionInfoParcel versionInfoParcel) {
        super(context, adSizeParcel, null, zzgzVar, versionInfoParcel, zzdVar);
        this.zzcqz = new HashMap();
    }

    private zzko.zza zzd(zzko.zza zzaVar) {
        zzkx.v("Creating mediation ad response for non-mediated rewarded ad.");
        try {
            String jSONObject = zzjm.zzc(zzaVar.zzcsu).toString();
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put(AbstractAdViewAdapter.AD_UNIT_ID_PARAMETER, zzaVar.zzcmx.zzarg);
            return new zzko.zza(zzaVar.zzcmx, zzaVar.zzcsu, new zzgq(Arrays.asList(new zzgp(jSONObject, null, Arrays.asList("com.google.ads.mediation.admob.AdMobAdapter"), null, null, Collections.emptyList(), Collections.emptyList(), jSONObject2.toString(), null, Collections.emptyList(), Collections.emptyList(), null, null, null, null, null, Collections.emptyList())), -1L, Collections.emptyList(), Collections.emptyList(), Collections.emptyList(), Collections.emptyList(), false, "", -1L, 0, 1, null, 0, -1, -1L, false), zzaVar.zzarm, zzaVar.errorCode, zzaVar.zzcso, zzaVar.zzcsp, zzaVar.zzcsi);
        } catch (JSONException e) {
            zzkx.zzb("Unable to generate ad state for non-mediated rewarded video.", e);
            return zze(zzaVar);
        }
    }

    private zzko.zza zze(zzko.zza zzaVar) {
        return new zzko.zza(zzaVar.zzcmx, zzaVar.zzcsu, null, zzaVar.zzarm, 0, zzaVar.zzcso, zzaVar.zzcsp, zzaVar.zzcsi);
    }

    @Override // com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void destroy() {
        com.google.android.gms.common.internal.zzaa.zzhs("destroy must be called on the main UI thread.");
        for (String str : this.zzcqz.keySet()) {
            try {
                zzkj zzkjVar = this.zzcqz.get(str);
                if (zzkjVar != null && zzkjVar.zzuc() != null) {
                    zzkjVar.zzuc().destroy();
                }
            } catch (RemoteException e) {
                String valueOf = String.valueOf(str);
                zzkx.zzdi(valueOf.length() != 0 ? "Fail to destroy adapter: ".concat(valueOf) : new String("Fail to destroy adapter: "));
            }
        }
    }

    public boolean isLoaded() {
        com.google.android.gms.common.internal.zzaa.zzhs("isLoaded must be called on the main UI thread.");
        return this.zzaly.zzark == null && this.zzaly.zzarl == null && this.zzaly.zzarn != null && !this.zzcra;
    }

    public void onContextChanged(@NonNull Context context) {
        for (zzkj zzkjVar : this.zzcqz.values()) {
            try {
                zzkjVar.zzuc().zzj(com.google.android.gms.dynamic.zze.zzac(context));
            } catch (RemoteException e) {
                zzkx.zzb("Unable to call Adapter.onContextChanged.", e);
            }
        }
    }

    @Override // com.google.android.gms.internal.zzkf
    public void onRewardedVideoAdClosed() {
        zzek();
    }

    @Override // com.google.android.gms.internal.zzkf
    public void onRewardedVideoAdLeftApplication() {
        zzel();
    }

    @Override // com.google.android.gms.internal.zzkf
    public void onRewardedVideoAdOpened() {
        zza(this.zzaly.zzarn, false);
        zzem();
    }

    @Override // com.google.android.gms.internal.zzkf
    public void onRewardedVideoStarted() {
        if (this.zzaly.zzarn != null && this.zzaly.zzarn.zzbwm != null) {
            com.google.android.gms.ads.internal.zzu.zzhf().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, this.zzaly.zzarn, this.zzaly.zzarg, false, this.zzaly.zzarn.zzbwm.zzbvb);
        }
        zzeo();
    }

    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void pause() {
        com.google.android.gms.common.internal.zzaa.zzhs("pause must be called on the main UI thread.");
        for (String str : this.zzcqz.keySet()) {
            try {
                zzkj zzkjVar = this.zzcqz.get(str);
                if (zzkjVar != null && zzkjVar.zzuc() != null) {
                    zzkjVar.zzuc().pause();
                }
            } catch (RemoteException e) {
                String valueOf = String.valueOf(str);
                zzkx.zzdi(valueOf.length() != 0 ? "Fail to pause adapter: ".concat(valueOf) : new String("Fail to pause adapter: "));
            }
        }
    }

    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void resume() {
        com.google.android.gms.common.internal.zzaa.zzhs("resume must be called on the main UI thread.");
        for (String str : this.zzcqz.keySet()) {
            try {
                zzkj zzkjVar = this.zzcqz.get(str);
                if (zzkjVar != null && zzkjVar.zzuc() != null) {
                    zzkjVar.zzuc().resume();
                }
            } catch (RemoteException e) {
                String valueOf = String.valueOf(str);
                zzkx.zzdi(valueOf.length() != 0 ? "Fail to resume adapter: ".concat(valueOf) : new String("Fail to resume adapter: "));
            }
        }
    }

    public void zza(RewardedVideoAdRequestParcel rewardedVideoAdRequestParcel) {
        com.google.android.gms.common.internal.zzaa.zzhs("loadAd must be called on the main UI thread.");
        if (TextUtils.isEmpty(rewardedVideoAdRequestParcel.zzarg)) {
            zzkx.zzdi("Invalid ad unit id. Aborting.");
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzkb.1
                @Override // java.lang.Runnable
                public void run() {
                    zzkb.this.zzh(1);
                }
            });
            return;
        }
        this.zzcra = false;
        this.zzaly.zzarg = rewardedVideoAdRequestParcel.zzarg;
        super.zzb(rewardedVideoAdRequestParcel.zzcju);
    }

    @Override // com.google.android.gms.ads.internal.zza
    public void zza(final zzko.zza zzaVar, zzdz zzdzVar) {
        if (zzaVar.errorCode != -2) {
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzkb.2
                @Override // java.lang.Runnable
                public void run() {
                    zzkb.this.zzb(new zzko(zzaVar, null, null, null, null, null, null, null));
                }
            });
            return;
        }
        this.zzaly.zzaro = zzaVar;
        if (zzaVar.zzcsk == null) {
            this.zzaly.zzaro = zzd(zzaVar);
        }
        this.zzaly.zzasi = 0;
        this.zzaly.zzarl = com.google.android.gms.ads.internal.zzu.zzgl().zza(this.zzaly.zzahs, this.zzaly.zzaro, this);
    }

    @Override // com.google.android.gms.ads.internal.zzb
    protected boolean zza(AdRequestParcel adRequestParcel, zzko zzkoVar, boolean z) {
        return false;
    }

    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.zza
    public boolean zza(zzko zzkoVar, zzko zzkoVar2) {
        return true;
    }

    @Override // com.google.android.gms.internal.zzkf
    public void zzc(@Nullable RewardItemParcel rewardItemParcel) {
        if (this.zzaly.zzarn != null && this.zzaly.zzarn.zzbwm != null) {
            com.google.android.gms.ads.internal.zzu.zzhf().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, this.zzaly.zzarn, this.zzaly.zzarg, false, this.zzaly.zzarn.zzbwm.zzbvc);
        }
        if (this.zzaly.zzarn != null && this.zzaly.zzarn.zzcsk != null && !TextUtils.isEmpty(this.zzaly.zzarn.zzcsk.zzbvr)) {
            rewardItemParcel = new RewardItemParcel(this.zzaly.zzarn.zzcsk.zzbvr, this.zzaly.zzarn.zzcsk.zzbvs);
        }
        zza(rewardItemParcel);
    }

    @Nullable
    public zzkj zzcp(String str) {
        Exception exc;
        zzkj zzkjVar;
        zzkj zzkjVar2 = this.zzcqz.get(str);
        if (zzkjVar2 == null) {
            try {
                zzkjVar = new zzkj(("com.google.ads.mediation.admob.AdMobAdapter".equals(str) ? zzcqy : this.zzamf).zzbu(str), this);
            } catch (Exception e) {
                exc = e;
                zzkjVar = zzkjVar2;
            }
            try {
                this.zzcqz.put(str, zzkjVar);
                return zzkjVar;
            } catch (Exception e2) {
                exc = e2;
                String valueOf = String.valueOf(str);
                zzkx.zzc(valueOf.length() != 0 ? "Fail to instantiate adapter ".concat(valueOf) : new String("Fail to instantiate adapter "), exc);
                return zzkjVar;
            }
        }
        return zzkjVar2;
    }

    public void zztu() {
        com.google.android.gms.common.internal.zzaa.zzhs("showAd must be called on the main UI thread.");
        if (!isLoaded()) {
            zzkx.zzdi("The reward video has not loaded.");
            return;
        }
        this.zzcra = true;
        zzkj zzcp = zzcp(this.zzaly.zzarn.zzbwo);
        if (zzcp == null || zzcp.zzuc() == null) {
            return;
        }
        try {
            zzcp.zzuc().showVideo();
        } catch (RemoteException e) {
            zzkx.zzc("Could not call showVideo.", e);
        }
    }

    @Override // com.google.android.gms.internal.zzkf
    public void zztv() {
        onAdClicked();
    }
}
