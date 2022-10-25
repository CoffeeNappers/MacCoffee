package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.customtabs.CustomTabsIntent;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.overlay.AdLauncherIntentInfoParcel;
import com.google.android.gms.ads.internal.overlay.AdOverlayInfoParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialListener;
import com.google.android.gms.internal.zzef;
@zzji
/* loaded from: classes.dex */
public class zzho implements MediationInterstitialAdapter {
    private Uri mUri;
    private Activity zzbxt;
    private zzef zzbxu;
    private MediationInterstitialListener zzbxv;

    public static boolean zzo(Context context) {
        return zzef.zzn(context);
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdapter
    public void onDestroy() {
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Destroying AdMobCustomTabsAdapter adapter.");
        try {
            this.zzbxu.zzd(this.zzbxt);
        } catch (Exception e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Exception while unbinding from CustomTabsService.", e);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdapter
    public void onPause() {
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Pausing AdMobCustomTabsAdapter adapter.");
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdapter
    public void onResume() {
        com.google.android.gms.ads.internal.util.client.zzb.zzdg("Resuming AdMobCustomTabsAdapter adapter.");
    }

    @Override // com.google.android.gms.ads.mediation.MediationInterstitialAdapter
    public void requestInterstitialAd(Context context, MediationInterstitialListener mediationInterstitialListener, Bundle bundle, MediationAdRequest mediationAdRequest, Bundle bundle2) {
        this.zzbxv = mediationInterstitialListener;
        if (this.zzbxv == null) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("Listener not set for mediation. Returning.");
        } else if (!(context instanceof Activity)) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("AdMobCustomTabs can only work with Activity context. Bailing out.");
            this.zzbxv.onAdFailedToLoad(this, 0);
        } else if (!zzo(context)) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdi("Default browser does not support custom tabs. Bailing out.");
            this.zzbxv.onAdFailedToLoad(this, 0);
        } else {
            String string = bundle.getString("tab_url");
            if (TextUtils.isEmpty(string)) {
                com.google.android.gms.ads.internal.util.client.zzb.zzdi("The tab_url retrieved from mediation metadata is empty. Bailing out.");
                this.zzbxv.onAdFailedToLoad(this, 0);
                return;
            }
            this.zzbxt = (Activity) context;
            this.mUri = Uri.parse(string);
            this.zzbxu = new zzef();
            this.zzbxu.zza(new zzef.zza() { // from class: com.google.android.gms.internal.zzho.1
                @Override // com.google.android.gms.internal.zzef.zza
                public void zzmh() {
                    com.google.android.gms.ads.internal.util.client.zzb.zzdg("Hinting CustomTabsService for the load of the new url.");
                }

                @Override // com.google.android.gms.internal.zzef.zza
                public void zzmi() {
                    com.google.android.gms.ads.internal.util.client.zzb.zzdg("Disconnecting from CustomTabs service.");
                }
            });
            this.zzbxu.zze(this.zzbxt);
            this.zzbxv.onAdLoaded(this);
        }
    }

    @Override // com.google.android.gms.ads.mediation.MediationInterstitialAdapter
    public void showInterstitial() {
        CustomTabsIntent build = new CustomTabsIntent.Builder(this.zzbxu.zzmf()).build();
        build.intent.setData(this.mUri);
        final AdOverlayInfoParcel adOverlayInfoParcel = new AdOverlayInfoParcel(new AdLauncherIntentInfoParcel(build.intent), null, new com.google.android.gms.ads.internal.overlay.zzg() { // from class: com.google.android.gms.internal.zzho.2
            @Override // com.google.android.gms.ads.internal.overlay.zzg
            public void onPause() {
                com.google.android.gms.ads.internal.util.client.zzb.zzdg("AdMobCustomTabsAdapter overlay is paused.");
            }

            @Override // com.google.android.gms.ads.internal.overlay.zzg
            public void onResume() {
                com.google.android.gms.ads.internal.util.client.zzb.zzdg("AdMobCustomTabsAdapter overlay is resumed.");
            }

            @Override // com.google.android.gms.ads.internal.overlay.zzg
            public void zzeq() {
                com.google.android.gms.ads.internal.util.client.zzb.zzdg("AdMobCustomTabsAdapter overlay is closed.");
                zzho.this.zzbxv.onAdClosed(zzho.this);
                zzho.this.zzbxu.zzd(zzho.this.zzbxt);
            }

            @Override // com.google.android.gms.ads.internal.overlay.zzg
            public void zzer() {
                com.google.android.gms.ads.internal.util.client.zzb.zzdg("Opening AdMobCustomTabsAdapter overlay.");
                zzho.this.zzbxv.onAdOpened(zzho.this);
            }
        }, null, new VersionInfoParcel(0, 0, false));
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzho.3
            @Override // java.lang.Runnable
            public void run() {
                com.google.android.gms.ads.internal.zzu.zzgk().zza(zzho.this.zzbxt, adOverlayInfoParcel);
            }
        });
        com.google.android.gms.ads.internal.zzu.zzgq().zzah(false);
    }
}
