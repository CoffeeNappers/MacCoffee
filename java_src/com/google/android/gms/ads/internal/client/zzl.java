package com.google.android.gms.ads.internal.client;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.widget.FrameLayout;
import com.facebook.internal.NativeProtocol;
import com.google.android.gms.ads.internal.client.zzx;
import com.google.android.gms.internal.zzei;
import com.google.android.gms.internal.zzeu;
import com.google.android.gms.internal.zzgz;
import com.google.android.gms.internal.zzhx;
import com.google.android.gms.internal.zzhy;
import com.google.android.gms.internal.zzih;
import com.google.android.gms.internal.zzim;
import com.google.android.gms.internal.zzji;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.data.UserNotification;
@zzji
/* loaded from: classes.dex */
public class zzl {
    private final Object zzako = new Object();
    private zzx zzazy;
    private final zze zzazz;
    private final zzd zzbaa;
    private final zzai zzbab;
    private final zzeu zzbac;
    private final com.google.android.gms.ads.internal.reward.client.zzf zzbad;
    private final zzim zzbae;
    private final zzhx zzbaf;

    /* JADX INFO: Access modifiers changed from: package-private */
    @VisibleForTesting
    /* loaded from: classes.dex */
    public abstract class zza<T> {
        zza() {
        }

        @Nullable
        protected abstract T zzb(zzx zzxVar) throws RemoteException;

        @Nullable
        protected abstract T zzkh() throws RemoteException;

        @Nullable
        protected final T zzko() {
            zzx zzkf = zzl.this.zzkf();
            if (zzkf == null) {
                com.google.android.gms.ads.internal.util.client.zzb.zzdi("ClientApi class cannot be loaded.");
                return null;
            }
            try {
                return zzb(zzkf);
            } catch (RemoteException e) {
                com.google.android.gms.ads.internal.util.client.zzb.zzc("Cannot invoke local loader using ClientApi class", e);
                return null;
            }
        }

        @Nullable
        protected final T zzkp() {
            try {
                return zzkh();
            } catch (RemoteException e) {
                com.google.android.gms.ads.internal.util.client.zzb.zzc("Cannot invoke remote loader", e);
                return null;
            }
        }
    }

    public zzl(zze zzeVar, zzd zzdVar, zzai zzaiVar, zzeu zzeuVar, com.google.android.gms.ads.internal.reward.client.zzf zzfVar, zzim zzimVar, zzhx zzhxVar) {
        this.zzazz = zzeVar;
        this.zzbaa = zzdVar;
        this.zzbab = zzaiVar;
        this.zzbac = zzeuVar;
        this.zzbad = zzfVar;
        this.zzbae = zzimVar;
        this.zzbaf = zzhxVar;
    }

    private static boolean zza(Activity activity, String str) {
        Intent intent = activity.getIntent();
        if (!intent.hasExtra(str)) {
            com.google.android.gms.ads.internal.util.client.zzb.e("useClientJar flag not found in activity intent extras.");
            return false;
        }
        return intent.getBooleanExtra(str, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzc(Context context, String str) {
        Bundle bundle = new Bundle();
        bundle.putString(NativeProtocol.WEB_DIALOG_ACTION, "no_ads_fallback");
        bundle.putString("flow", str);
        zzm.zzkr().zza(context, (String) null, "gmob-apps", bundle, true);
    }

    @Nullable
    private static zzx zzke() {
        zzx asInterface;
        try {
            Object newInstance = zzl.class.getClassLoader().loadClass("com.google.android.gms.ads.internal.ClientApi").newInstance();
            if (!(newInstance instanceof IBinder)) {
                com.google.android.gms.ads.internal.util.client.zzb.zzdi("ClientApi class is not an instance of IBinder");
                asInterface = null;
            } else {
                asInterface = zzx.zza.asInterface((IBinder) newInstance);
            }
            return asInterface;
        } catch (Exception e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to instantiate ClientApi class.", e);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Nullable
    public zzx zzkf() {
        zzx zzxVar;
        synchronized (this.zzako) {
            if (this.zzazy == null) {
                this.zzazy = zzke();
            }
            zzxVar = this.zzazy;
        }
        return zzxVar;
    }

    public zzu zza(final Context context, final AdSizeParcel adSizeParcel, final String str) {
        return (zzu) zza(context, false, (zza<Object>) new zza<zzu>() { // from class: com.google.android.gms.ads.internal.client.zzl.2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zza */
            public zzu zzb(zzx zzxVar) throws RemoteException {
                return zzxVar.createSearchAdManager(com.google.android.gms.dynamic.zze.zzac(context), adSizeParcel, str, 9877000);
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzkg */
            public zzu zzkh() {
                zzu zza2 = zzl.this.zzazz.zza(context, adSizeParcel, str, null, 3);
                if (zza2 != null) {
                    return zza2;
                }
                zzl.this.zzc(context, FirebaseAnalytics.Event.SEARCH);
                return new zzak();
            }
        });
    }

    public zzu zza(final Context context, final AdSizeParcel adSizeParcel, final String str, final zzgz zzgzVar) {
        return (zzu) zza(context, false, (zza<Object>) new zza<zzu>() { // from class: com.google.android.gms.ads.internal.client.zzl.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zza */
            public zzu zzb(zzx zzxVar) throws RemoteException {
                return zzxVar.createBannerAdManager(com.google.android.gms.dynamic.zze.zzac(context), adSizeParcel, str, zzgzVar, 9877000);
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzkg */
            public zzu zzkh() {
                zzu zza2 = zzl.this.zzazz.zza(context, adSizeParcel, str, zzgzVar, 1);
                if (zza2 != null) {
                    return zza2;
                }
                zzl.this.zzc(context, UserNotification.LAYOUT_NEWSFEED_BANNER);
                return new zzak();
            }
        });
    }

    public com.google.android.gms.ads.internal.reward.client.zzb zza(final Context context, final zzgz zzgzVar) {
        return (com.google.android.gms.ads.internal.reward.client.zzb) zza(context, false, (zza<Object>) new zza<com.google.android.gms.ads.internal.reward.client.zzb>() { // from class: com.google.android.gms.ads.internal.client.zzl.7
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzf */
            public com.google.android.gms.ads.internal.reward.client.zzb zzb(zzx zzxVar) throws RemoteException {
                return zzxVar.createRewardedVideoAd(com.google.android.gms.dynamic.zze.zzac(context), zzgzVar, 9877000);
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzkl */
            public com.google.android.gms.ads.internal.reward.client.zzb zzkh() {
                com.google.android.gms.ads.internal.reward.client.zzb zzb = zzl.this.zzbad.zzb(context, zzgzVar);
                if (zzb != null) {
                    return zzb;
                }
                zzl.this.zzc(context, "rewarded_video");
                return new zzan();
            }
        });
    }

    public zzei zza(final Context context, final FrameLayout frameLayout, final FrameLayout frameLayout2) {
        return (zzei) zza(context, false, (zza<Object>) new zza<zzei>() { // from class: com.google.android.gms.ads.internal.client.zzl.6
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zze */
            public zzei zzb(zzx zzxVar) throws RemoteException {
                return zzxVar.createNativeAdViewDelegate(com.google.android.gms.dynamic.zze.zzac(frameLayout), com.google.android.gms.dynamic.zze.zzac(frameLayout2));
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzkk */
            public zzei zzkh() {
                zzei zzb = zzl.this.zzbac.zzb(context, frameLayout, frameLayout2);
                if (zzb != null) {
                    return zzb;
                }
                zzl.this.zzc(context, "native_ad_view_delegate");
                return new zzam();
            }
        });
    }

    @VisibleForTesting
    <T> T zza(Context context, boolean z, zza<T> zzaVar) {
        if (!z && !zzm.zzkr().zzap(context)) {
            com.google.android.gms.ads.internal.util.client.zzb.zzdg("Google Play Services is not available");
            z = true;
        }
        if (z) {
            T zzko = zzaVar.zzko();
            return zzko == null ? zzaVar.zzkp() : zzko;
        }
        T zzkp = zzaVar.zzkp();
        return zzkp == null ? zzaVar.zzko() : zzkp;
    }

    public zzs zzb(final Context context, final String str, final zzgz zzgzVar) {
        return (zzs) zza(context, false, (zza<Object>) new zza<zzs>() { // from class: com.google.android.gms.ads.internal.client.zzl.4
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzc */
            public zzs zzb(zzx zzxVar) throws RemoteException {
                return zzxVar.createAdLoaderBuilder(com.google.android.gms.dynamic.zze.zzac(context), str, zzgzVar, 9877000);
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzki */
            public zzs zzkh() {
                zzs zza2 = zzl.this.zzbaa.zza(context, str, zzgzVar);
                if (zza2 != null) {
                    return zza2;
                }
                zzl.this.zzc(context, "native_ad");
                return new zzaj();
            }
        });
    }

    public zzu zzb(final Context context, final AdSizeParcel adSizeParcel, final String str, final zzgz zzgzVar) {
        return (zzu) zza(context, false, (zza<Object>) new zza<zzu>() { // from class: com.google.android.gms.ads.internal.client.zzl.3
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zza */
            public zzu zzb(zzx zzxVar) throws RemoteException {
                return zzxVar.createInterstitialAdManager(com.google.android.gms.dynamic.zze.zzac(context), adSizeParcel, str, zzgzVar, 9877000);
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzkg */
            public zzu zzkh() {
                zzu zza2 = zzl.this.zzazz.zza(context, adSizeParcel, str, zzgzVar, 2);
                if (zza2 != null) {
                    return zza2;
                }
                zzl.this.zzc(context, "interstitial");
                return new zzak();
            }
        });
    }

    @Nullable
    public zzih zzb(final Activity activity) {
        return (zzih) zza(activity, zza(activity, "com.google.android.gms.ads.internal.purchase.useClientJar"), new zza<zzih>() { // from class: com.google.android.gms.ads.internal.client.zzl.8
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzg */
            public zzih zzb(zzx zzxVar) throws RemoteException {
                return zzxVar.createInAppPurchaseManager(com.google.android.gms.dynamic.zze.zzac(activity));
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzkm */
            public zzih zzkh() {
                zzih zzg = zzl.this.zzbae.zzg(activity);
                if (zzg != null) {
                    return zzg;
                }
                zzl.this.zzc(activity, "iap");
                return null;
            }
        });
    }

    @Nullable
    public zzhy zzc(final Activity activity) {
        return (zzhy) zza(activity, zza(activity, "com.google.android.gms.ads.internal.overlay.useClientJar"), new zza<zzhy>() { // from class: com.google.android.gms.ads.internal.client.zzl.9
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzh */
            public zzhy zzb(zzx zzxVar) throws RemoteException {
                return zzxVar.createAdOverlay(com.google.android.gms.dynamic.zze.zzac(activity));
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzkn */
            public zzhy zzkh() {
                zzhy zzf = zzl.this.zzbaf.zzf(activity);
                if (zzf != null) {
                    return zzf;
                }
                zzl.this.zzc(activity, "ad_overlay");
                return null;
            }
        });
    }

    public zzz zzk(final Context context) {
        return (zzz) zza(context, false, (zza<Object>) new zza<zzz>() { // from class: com.google.android.gms.ads.internal.client.zzl.5
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzd */
            public zzz zzb(zzx zzxVar) throws RemoteException {
                return zzxVar.getMobileAdsSettingsManagerWithClientJarVersion(com.google.android.gms.dynamic.zze.zzac(context), 9877000);
            }

            @Override // com.google.android.gms.ads.internal.client.zzl.zza
            /* renamed from: zzkj */
            public zzz zzkh() {
                zzz zzl = zzl.this.zzbab.zzl(context);
                if (zzl != null) {
                    return zzl;
                }
                zzl.this.zzc(context, "mobile_ads_settings");
                return new zzal();
            }
        });
    }
}
