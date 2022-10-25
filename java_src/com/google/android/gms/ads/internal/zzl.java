package com.google.android.gms.ads.internal;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.RemoteException;
import android.support.annotation.Nullable;
import android.view.Window;
import com.facebook.internal.NativeProtocol;
import com.google.ads.mediation.AbstractAdViewAdapter;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.overlay.AdOverlayInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.reward.mediation.client.RewardItemParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzcu;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzdz;
import com.google.android.gms.internal.zzfi;
import com.google.android.gms.internal.zzfn;
import com.google.android.gms.internal.zzgp;
import com.google.android.gms.internal.zzgq;
import com.google.android.gms.internal.zzgz;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzjm;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzkw;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
import com.google.android.gms.internal.zzmd;
import com.google.android.gms.internal.zzme;
import java.util.Collections;
import java.util.concurrent.Future;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzl extends zzc implements zzfi, zzfn.zza {
    protected transient boolean zzaoc;
    private int zzaod;
    private boolean zzaoe;
    private float zzaof;

    @zzji
    /* loaded from: classes.dex */
    private class zza extends zzkw {
        private final int zzaoh;

        public zza(int i) {
            this.zzaoh = i;
        }

        @Override // com.google.android.gms.internal.zzkw
        public void onStop() {
        }

        @Override // com.google.android.gms.internal.zzkw
        public void zzfp() {
            InterstitialAdParameterParcel interstitialAdParameterParcel = new InterstitialAdParameterParcel(zzl.this.zzaly.zzaok, zzl.this.zzfm(), zzl.this.zzaoe, zzl.this.zzaof, zzl.this.zzaly.zzaok ? this.zzaoh : -1);
            int requestedOrientation = zzl.this.zzaly.zzarn.zzcbm.getRequestedOrientation();
            final AdOverlayInfoParcel adOverlayInfoParcel = new AdOverlayInfoParcel(zzl.this, zzl.this, zzl.this, zzl.this.zzaly.zzarn.zzcbm, requestedOrientation == -1 ? zzl.this.zzaly.zzarn.orientation : requestedOrientation, zzl.this.zzaly.zzari, zzl.this.zzaly.zzarn.zzclg, interstitialAdParameterParcel);
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.zzl.zza.1
                @Override // java.lang.Runnable
                public void run() {
                    zzu.zzgk().zza(zzl.this.zzaly.zzahs, adOverlayInfoParcel);
                }
            });
        }
    }

    public zzl(Context context, AdSizeParcel adSizeParcel, String str, zzgz zzgzVar, VersionInfoParcel versionInfoParcel, zzd zzdVar) {
        super(context, adSizeParcel, str, zzgzVar, versionInfoParcel, zzdVar);
        this.zzaod = -1;
        this.zzaoc = false;
    }

    private void zzb(Bundle bundle) {
        zzu.zzgm().zzb(this.zzaly.zzahs, this.zzaly.zzari.zzda, "gmob-apps", bundle, false);
    }

    static zzko.zza zzc(zzko.zza zzaVar) {
        try {
            String jSONObject = zzjm.zzc(zzaVar.zzcsu).toString();
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put(AbstractAdViewAdapter.AD_UNIT_ID_PARAMETER, zzaVar.zzcmx.zzarg);
            zzgp zzgpVar = new zzgp(jSONObject, null, Collections.singletonList("com.google.ads.mediation.admob.AdMobAdapter"), null, null, Collections.emptyList(), Collections.emptyList(), jSONObject2.toString(), null, Collections.emptyList(), Collections.emptyList(), null, null, null, null, null, Collections.emptyList());
            AdResponseParcel adResponseParcel = zzaVar.zzcsu;
            zzgq zzgqVar = new zzgq(Collections.singletonList(zzgpVar), -1L, Collections.emptyList(), Collections.emptyList(), Collections.emptyList(), adResponseParcel.zzbvn, adResponseParcel.zzbvo, "", -1L, 0, 1, null, 0, -1, -1L, false);
            return new zzko.zza(zzaVar.zzcmx, new AdResponseParcel(zzaVar.zzcmx, adResponseParcel.zzcbo, adResponseParcel.body, Collections.emptyList(), Collections.emptyList(), adResponseParcel.zzcla, true, adResponseParcel.zzclc, Collections.emptyList(), adResponseParcel.zzbvq, adResponseParcel.orientation, adResponseParcel.zzcle, adResponseParcel.zzclf, adResponseParcel.zzclg, adResponseParcel.zzclh, adResponseParcel.zzcli, null, adResponseParcel.zzclk, adResponseParcel.zzazt, adResponseParcel.zzckc, adResponseParcel.zzcll, adResponseParcel.zzclm, adResponseParcel.zzclp, adResponseParcel.zzazu, adResponseParcel.zzazv, null, Collections.emptyList(), Collections.emptyList(), adResponseParcel.zzclt, adResponseParcel.zzclu, adResponseParcel.zzcks, adResponseParcel.zzckt, adResponseParcel.zzbvn, adResponseParcel.zzbvo, adResponseParcel.zzclv, null, adResponseParcel.zzclx, adResponseParcel.zzcly), zzgqVar, zzaVar.zzarm, zzaVar.errorCode, zzaVar.zzcso, zzaVar.zzcsp, null);
        } catch (JSONException e) {
            zzkx.zzb("Unable to generate ad state for an interstitial ad with pooling.", e);
            return zzaVar;
        }
    }

    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.client.zzu
    public void showInterstitial() {
        zzaa.zzhs("showInterstitial must be called on the main UI thread.");
        if (this.zzaly.zzarn == null) {
            zzkx.zzdi("The interstitial has not loaded.");
            return;
        }
        if (zzdr.zzbgx.get().booleanValue()) {
            String packageName = this.zzaly.zzahs.getApplicationContext() != null ? this.zzaly.zzahs.getApplicationContext().getPackageName() : this.zzaly.zzahs.getPackageName();
            if (!this.zzaoc) {
                zzkx.zzdi("It is not recommended to show an interstitial before onAdLoaded completes.");
                Bundle bundle = new Bundle();
                bundle.putString("appid", packageName);
                bundle.putString(NativeProtocol.WEB_DIALOG_ACTION, "show_interstitial_before_load_finish");
                zzb(bundle);
            }
            if (!zzu.zzgm().zzae(this.zzaly.zzahs)) {
                zzkx.zzdi("It is not recommended to show an interstitial when app is not in foreground.");
                Bundle bundle2 = new Bundle();
                bundle2.putString("appid", packageName);
                bundle2.putString(NativeProtocol.WEB_DIALOG_ACTION, "show_interstitial_app_not_in_foreground");
                zzb(bundle2);
            }
        }
        if (this.zzaly.zzhq()) {
            return;
        }
        if (this.zzaly.zzarn.zzclb && this.zzaly.zzarn.zzbwn != null) {
            try {
                this.zzaly.zzarn.zzbwn.showInterstitial();
            } catch (RemoteException e) {
                zzkx.zzc("Could not show interstitial.", e);
                zzfn();
            }
        } else if (this.zzaly.zzarn.zzcbm == null) {
            zzkx.zzdi("The interstitial failed to load.");
        } else if (this.zzaly.zzarn.zzcbm.zzxg()) {
            zzkx.zzdi("The interstitial is already showing.");
        } else {
            this.zzaly.zzarn.zzcbm.zzak(true);
            if (this.zzaly.zzarn.zzcsi != null) {
                this.zzama.zza(this.zzaly.zzarm, this.zzaly.zzarn);
            }
            if (com.google.android.gms.common.util.zzs.zzayq()) {
                final zzko zzkoVar = this.zzaly.zzarn;
                if (zzkoVar.zzic()) {
                    new zzcu(this.zzaly.zzahs, zzkoVar.zzcbm.getView()).zza(zzkoVar.zzcbm);
                } else {
                    zzkoVar.zzcbm.zzxc().zza(new zzme.zzc() { // from class: com.google.android.gms.ads.internal.zzl.1
                        @Override // com.google.android.gms.internal.zzme.zzc
                        public void zzfg() {
                            new zzcu(zzl.this.zzaly.zzahs, zzkoVar.zzcbm.getView()).zza(zzkoVar.zzcbm);
                        }
                    });
                }
            }
            Bitmap zzaf = this.zzaly.zzaok ? zzu.zzgm().zzaf(this.zzaly.zzahs) : null;
            this.zzaod = zzu.zzhh().zzb(zzaf);
            if (zzdr.zzbip.get().booleanValue() && zzaf != null) {
                Future future = (Future) new zza(this.zzaod).zzrz();
                return;
            }
            InterstitialAdParameterParcel interstitialAdParameterParcel = new InterstitialAdParameterParcel(this.zzaly.zzaok, zzfm(), false, 0.0f, -1);
            int requestedOrientation = this.zzaly.zzarn.zzcbm.getRequestedOrientation();
            if (requestedOrientation == -1) {
                requestedOrientation = this.zzaly.zzarn.orientation;
            }
            zzu.zzgk().zza(this.zzaly.zzahs, new AdOverlayInfoParcel(this, this, this, this.zzaly.zzarn.zzcbm, requestedOrientation, this.zzaly.zzari, this.zzaly.zzarn.zzclg, interstitialAdParameterParcel));
        }
    }

    @Override // com.google.android.gms.ads.internal.zzc
    protected zzmd zza(zzko.zza zzaVar, @Nullable zze zzeVar, @Nullable com.google.android.gms.ads.internal.safebrowsing.zzc zzcVar) {
        zzmd zza2 = zzu.zzgn().zza(this.zzaly.zzahs, this.zzaly.zzarm, false, false, this.zzaly.zzarh, this.zzaly.zzari, this.zzalt, this, this.zzamb);
        zza2.zzxc().zza(this, null, this, this, zzdr.zzbfn.get().booleanValue(), this, this, zzeVar, null, zzcVar);
        zza(zza2);
        zza2.zzdk(zzaVar.zzcmx.zzcki);
        zzfn.zza(zza2, this);
        return zza2;
    }

    @Override // com.google.android.gms.ads.internal.zzc, com.google.android.gms.ads.internal.zza
    public void zza(zzko.zza zzaVar, zzdz zzdzVar) {
        boolean z = true;
        if (!zzdr.zzbgg.get().booleanValue()) {
            super.zza(zzaVar, zzdzVar);
        } else if (zzaVar.errorCode != -2) {
            super.zza(zzaVar, zzdzVar);
        } else {
            Bundle bundle = zzaVar.zzcmx.zzcju.zzayv.getBundle("com.google.ads.mediation.admob.AdMobAdapter");
            boolean z2 = bundle == null || !bundle.containsKey("gw");
            if (zzaVar.zzcsu.zzclb) {
                z = false;
            }
            if (z2 && z) {
                this.zzaly.zzaro = zzc(zzaVar);
            }
            super.zza(this.zzaly.zzaro, zzdzVar);
        }
    }

    @Override // com.google.android.gms.internal.zzfi
    public void zza(boolean z, float f) {
        this.zzaoe = z;
        this.zzaof = f;
    }

    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.zza
    public boolean zza(AdRequestParcel adRequestParcel, zzdz zzdzVar) {
        if (this.zzaly.zzarn != null) {
            zzkx.zzdi("An interstitial is already loading. Aborting.");
            return false;
        }
        return super.zza(adRequestParcel, zzdzVar);
    }

    @Override // com.google.android.gms.ads.internal.zzb
    protected boolean zza(AdRequestParcel adRequestParcel, zzko zzkoVar, boolean z) {
        if (this.zzaly.zzhp() && zzkoVar.zzcbm != null) {
            zzu.zzgo().zzl(zzkoVar.zzcbm);
        }
        return this.zzalx.zzfy();
    }

    @Override // com.google.android.gms.ads.internal.zzc, com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.zza
    public boolean zza(@Nullable zzko zzkoVar, zzko zzkoVar2) {
        if (!super.zza(zzkoVar, zzkoVar2)) {
            return false;
        }
        if (!this.zzaly.zzhp() && this.zzaly.zzash != null && zzkoVar2.zzcsi != null) {
            this.zzama.zza(this.zzaly.zzarm, zzkoVar2, this.zzaly.zzash);
        }
        return true;
    }

    @Override // com.google.android.gms.internal.zzfn.zza
    public void zzb(RewardItemParcel rewardItemParcel) {
        if (this.zzaly.zzarn != null) {
            if (this.zzaly.zzarn.zzcls != null) {
                zzu.zzgm().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, this.zzaly.zzarn.zzcls);
            }
            if (this.zzaly.zzarn.zzclq != null) {
                rewardItemParcel = this.zzaly.zzarn.zzclq;
            }
        }
        zza(rewardItemParcel);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.ads.internal.zza
    public void zzek() {
        zzfn();
        super.zzek();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.ads.internal.zza
    public void zzen() {
        super.zzen();
        this.zzaoc = true;
    }

    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.overlay.zzg
    public void zzer() {
        zzme zzxc;
        recordImpression();
        super.zzer();
        if (this.zzaly.zzarn == null || this.zzaly.zzarn.zzcbm == null || (zzxc = this.zzaly.zzarn.zzcbm.zzxc()) == null) {
            return;
        }
        zzxc.zzya();
    }

    protected boolean zzfm() {
        Window window;
        if (!(this.zzaly.zzahs instanceof Activity) || (window = ((Activity) this.zzaly.zzahs).getWindow()) == null || window.getDecorView() == null) {
            return false;
        }
        Rect rect = new Rect();
        Rect rect2 = new Rect();
        window.getDecorView().getGlobalVisibleRect(rect, null);
        window.getDecorView().getWindowVisibleDisplayFrame(rect2);
        return (rect.bottom == 0 || rect2.bottom == 0 || rect.top != rect2.top) ? false : true;
    }

    public void zzfn() {
        zzu.zzhh().zzb(Integer.valueOf(this.zzaod));
        if (this.zzaly.zzhp()) {
            this.zzaly.zzhm();
            this.zzaly.zzarn = null;
            this.zzaly.zzaok = false;
            this.zzaoc = false;
        }
    }

    @Override // com.google.android.gms.internal.zzfn.zza
    public void zzfo() {
        if (this.zzaly.zzarn != null && this.zzaly.zzarn.zzcsn != null) {
            zzu.zzgm().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, this.zzaly.zzarn.zzcsn);
        }
        zzeo();
    }

    @Override // com.google.android.gms.internal.zzfi
    public void zzg(boolean z) {
        this.zzaly.zzaok = z;
    }
}
