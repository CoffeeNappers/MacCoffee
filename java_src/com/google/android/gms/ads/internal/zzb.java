package com.google.android.gms.ads.internal;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Messenger;
import android.os.RemoteException;
import android.support.annotation.Nullable;
import android.util.DisplayMetrics;
import android.webkit.CookieManager;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.purchase.GInAppPurchaseManagerInfoParcel;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.CapabilityParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzdz;
import com.google.android.gms.internal.zzfg;
import com.google.android.gms.internal.zzgr;
import com.google.android.gms.internal.zzgz;
import com.google.android.gms.internal.zzid;
import com.google.android.gms.internal.zzig;
import com.google.android.gms.internal.zzik;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzkp;
import com.google.android.gms.internal.zzkq;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
import com.google.android.gms.internal.zzmd;
import java.util.ArrayList;
import java.util.UUID;
import java.util.concurrent.Future;
@zzji
/* loaded from: classes.dex */
public abstract class zzb extends zza implements com.google.android.gms.ads.internal.overlay.zzg, com.google.android.gms.ads.internal.purchase.zzj, zzs, zzfg, zzgr {
    private final Messenger mMessenger;
    protected final zzgz zzamf;
    protected transient boolean zzamg;

    public zzb(Context context, AdSizeParcel adSizeParcel, String str, zzgz zzgzVar, VersionInfoParcel versionInfoParcel, zzd zzdVar) {
        this(new zzv(context, adSizeParcel, str, versionInfoParcel), zzgzVar, null, zzdVar);
    }

    protected zzb(zzv zzvVar, zzgz zzgzVar, @Nullable zzr zzrVar, zzd zzdVar) {
        super(zzvVar, zzrVar, zzdVar);
        this.zzamf = zzgzVar;
        this.mMessenger = new Messenger(new zzid(this.zzaly.zzahs));
        this.zzamg = false;
    }

    private AdRequestInfoParcel.zza zza(AdRequestParcel adRequestParcel, Bundle bundle, zzkq zzkqVar) {
        PackageInfo packageInfo;
        ApplicationInfo applicationInfo = this.zzaly.zzahs.getApplicationInfo();
        try {
            packageInfo = this.zzaly.zzahs.getPackageManager().getPackageInfo(applicationInfo.packageName, 0);
        } catch (PackageManager.NameNotFoundException e) {
            packageInfo = null;
        }
        DisplayMetrics displayMetrics = this.zzaly.zzahs.getResources().getDisplayMetrics();
        Bundle bundle2 = null;
        if (this.zzaly.zzarj != null && this.zzaly.zzarj.getParent() != null) {
            int[] iArr = new int[2];
            this.zzaly.zzarj.getLocationOnScreen(iArr);
            int i = iArr[0];
            int i2 = iArr[1];
            int width = this.zzaly.zzarj.getWidth();
            int height = this.zzaly.zzarj.getHeight();
            int i3 = 0;
            if (this.zzaly.zzarj.isShown() && i + width > 0 && i2 + height > 0 && i <= displayMetrics.widthPixels && i2 <= displayMetrics.heightPixels) {
                i3 = 1;
            }
            bundle2 = new Bundle(5);
            bundle2.putInt("x", i);
            bundle2.putInt("y", i2);
            bundle2.putInt("width", width);
            bundle2.putInt("height", height);
            bundle2.putInt("visible", i3);
        }
        String zzus = zzu.zzgq().zzus();
        this.zzaly.zzarp = new zzkp(zzus, this.zzaly.zzarg);
        this.zzaly.zzarp.zzt(adRequestParcel);
        String zza = zzu.zzgm().zza(this.zzaly.zzahs, this.zzaly.zzarj, this.zzaly.zzarm);
        long j = 0;
        if (this.zzaly.zzart != null) {
            try {
                j = this.zzaly.zzart.getValue();
            } catch (RemoteException e2) {
                zzkx.zzdi("Cannot get correlation id, default to 0.");
            }
        }
        String uuid = UUID.randomUUID().toString();
        Bundle zza2 = zzu.zzgq().zza(this.zzaly.zzahs, this, zzus);
        ArrayList arrayList = new ArrayList();
        int i4 = 0;
        while (true) {
            int i5 = i4;
            if (i5 >= this.zzaly.zzarz.size()) {
                break;
            }
            arrayList.add(this.zzaly.zzarz.keyAt(i5));
            i4 = i5 + 1;
        }
        boolean z = this.zzaly.zzaru != null;
        boolean z2 = this.zzaly.zzarv != null && zzu.zzgq().zzvi();
        com.google.android.gms.ads.internal.overlay.zzm zzmVar = this.zzamb.zzamr;
        Context context = this.zzaly.zzahs;
        String str = "";
        if (zzdr.zzbkn.get().booleanValue()) {
            zzkx.zzdg("Getting webview cookie from CookieManager.");
            CookieManager zzal = zzu.zzgo().zzal(this.zzaly.zzahs);
            if (zzal != null) {
                str = zzal.getCookie("googleads.g.doubleclick.net");
            }
        }
        String str2 = null;
        if (zzkqVar != null) {
            str2 = zzkqVar.zzuo();
        }
        return new AdRequestInfoParcel.zza(bundle2, adRequestParcel, this.zzaly.zzarm, this.zzaly.zzarg, applicationInfo, packageInfo, zzus, zzu.zzgq().getSessionId(), this.zzaly.zzari, zza2, this.zzaly.zzase, arrayList, bundle, zzu.zzgq().zzuw(), this.mMessenger, displayMetrics.widthPixels, displayMetrics.heightPixels, displayMetrics.density, zza, j, uuid, zzdr.zzlq(), this.zzaly.zzarf, this.zzaly.zzasa, new CapabilityParcel(z, z2, false), this.zzaly.zzht(), zzu.zzgm().zzfr(), zzu.zzgm().zzft(), zzu.zzgm().zzai(this.zzaly.zzahs), zzu.zzgm().zzt(this.zzaly.zzarj), this.zzaly.zzahs instanceof Activity, zzu.zzgq().zzvb(), str, str2, zzu.zzgq().zzve(), zzu.zzhj().zzni(), zzu.zzgm().zzvv(), zzu.zzgu().zzwf());
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public String getMediationAdapterClassName() {
        if (this.zzaly.zzarn == null) {
            return null;
        }
        return this.zzaly.zzarn.zzbwo;
    }

    @Override // com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zza
    public void onAdClicked() {
        if (this.zzaly.zzarn == null) {
            zzkx.zzdi("Ad state was null when trying to ping click URLs.");
            return;
        }
        if (this.zzaly.zzarn.zzcsk != null && this.zzaly.zzarn.zzcsk.zzbvk != null) {
            zzu.zzhf().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, this.zzaly.zzarn, this.zzaly.zzarg, false, this.zzaly.zzarn.zzcsk.zzbvk);
        }
        if (this.zzaly.zzarn.zzbwm != null && this.zzaly.zzarn.zzbwm.zzbux != null) {
            zzu.zzhf().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, this.zzaly.zzarn, this.zzaly.zzarg, false, this.zzaly.zzarn.zzbwm.zzbux);
        }
        super.onAdClicked();
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzg
    public void onPause() {
        this.zzama.zzl(this.zzaly.zzarn);
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzg
    public void onResume() {
        this.zzama.zzm(this.zzaly.zzarn);
    }

    @Override // com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void pause() {
        zzaa.zzhs("pause must be called on the main UI thread.");
        if (this.zzaly.zzarn != null && this.zzaly.zzarn.zzcbm != null && this.zzaly.zzhp()) {
            zzu.zzgo().zzl(this.zzaly.zzarn.zzcbm);
        }
        if (this.zzaly.zzarn != null && this.zzaly.zzarn.zzbwn != null) {
            try {
                this.zzaly.zzarn.zzbwn.pause();
            } catch (RemoteException e) {
                zzkx.zzdi("Could not pause mediation adapter.");
            }
        }
        this.zzama.zzl(this.zzaly.zzarn);
        this.zzalx.pause();
    }

    public void recordImpression() {
        zza(this.zzaly.zzarn, false);
    }

    @Override // com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void resume() {
        zzaa.zzhs("resume must be called on the main UI thread.");
        zzmd zzmdVar = null;
        if (this.zzaly.zzarn != null && this.zzaly.zzarn.zzcbm != null) {
            zzmdVar = this.zzaly.zzarn.zzcbm;
        }
        if (zzmdVar != null && this.zzaly.zzhp()) {
            zzu.zzgo().zzm(this.zzaly.zzarn.zzcbm);
        }
        if (this.zzaly.zzarn != null && this.zzaly.zzarn.zzbwn != null) {
            try {
                this.zzaly.zzarn.zzbwn.resume();
            } catch (RemoteException e) {
                zzkx.zzdi("Could not resume mediation adapter.");
            }
        }
        if (zzmdVar == null || !zzmdVar.zzxj()) {
            this.zzalx.resume();
        }
        this.zzama.zzm(this.zzaly.zzarn);
    }

    @Override // com.google.android.gms.ads.internal.client.zzu
    public void showInterstitial() {
        throw new IllegalStateException("showInterstitial is not supported for current ad type");
    }

    @Override // com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void zza(zzig zzigVar) {
        zzaa.zzhs("setInAppPurchaseListener must be called on the main UI thread.");
        this.zzaly.zzaru = zzigVar;
    }

    @Override // com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void zza(zzik zzikVar, @Nullable String str) {
        zzaa.zzhs("setPlayStorePurchaseParams must be called on the main UI thread.");
        this.zzaly.zzasf = new com.google.android.gms.ads.internal.purchase.zzk(str);
        this.zzaly.zzarv = zzikVar;
        if (zzu.zzgq().zzuv() || zzikVar == null) {
            return;
        }
        Future future = (Future) new com.google.android.gms.ads.internal.purchase.zzc(this.zzaly.zzahs, this.zzaly.zzarv, this.zzaly.zzasf).zzrz();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zza(@Nullable zzko zzkoVar, boolean z) {
        if (zzkoVar == null) {
            zzkx.zzdi("Ad state was null when trying to ping impression URLs.");
            return;
        }
        super.zzc(zzkoVar);
        if (zzkoVar.zzcsk != null && zzkoVar.zzcsk.zzbvl != null) {
            zzu.zzhf().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, zzkoVar, this.zzaly.zzarg, z, zzkoVar.zzcsk.zzbvl);
        }
        if (zzkoVar.zzbwm == null || zzkoVar.zzbwm.zzbuy == null) {
            return;
        }
        zzu.zzhf().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, zzkoVar, this.zzaly.zzarg, z, zzkoVar.zzbwm.zzbuy);
    }

    @Override // com.google.android.gms.internal.zzfg
    public void zza(String str, ArrayList<String> arrayList) {
        com.google.android.gms.ads.internal.purchase.zzd zzdVar = new com.google.android.gms.ads.internal.purchase.zzd(str, arrayList, this.zzaly.zzahs, this.zzaly.zzari.zzda);
        if (this.zzaly.zzaru != null) {
            try {
                this.zzaly.zzaru.zza(zzdVar);
                return;
            } catch (RemoteException e) {
                zzkx.zzdi("Could not start In-App purchase.");
                return;
            }
        }
        zzkx.zzdi("InAppPurchaseListener is not set. Try to launch default purchase flow.");
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzap(this.zzaly.zzahs)) {
            zzkx.zzdi("Google Play Service unavailable, cannot launch default purchase flow.");
        } else if (this.zzaly.zzarv == null) {
            zzkx.zzdi("PlayStorePurchaseListener is not set.");
        } else if (this.zzaly.zzasf == null) {
            zzkx.zzdi("PlayStorePurchaseVerifier is not initialized.");
        } else if (this.zzaly.zzasj) {
            zzkx.zzdi("An in-app purchase request is already in progress, abort");
        } else {
            this.zzaly.zzasj = true;
            try {
                if (!this.zzaly.zzarv.isValidPurchase(str)) {
                    this.zzaly.zzasj = false;
                } else {
                    zzu.zzha().zza(this.zzaly.zzahs, this.zzaly.zzari.zzcyc, new GInAppPurchaseManagerInfoParcel(this.zzaly.zzahs, this.zzaly.zzasf, zzdVar, this));
                }
            } catch (RemoteException e2) {
                zzkx.zzdi("Could not start In-App purchase.");
                this.zzaly.zzasj = false;
            }
        }
    }

    @Override // com.google.android.gms.ads.internal.purchase.zzj
    public void zza(String str, boolean z, int i, final Intent intent, com.google.android.gms.ads.internal.purchase.zzf zzfVar) {
        try {
            if (this.zzaly.zzarv != null) {
                this.zzaly.zzarv.zza(new com.google.android.gms.ads.internal.purchase.zzg(this.zzaly.zzahs, str, z, i, intent, zzfVar));
            }
        } catch (RemoteException e) {
            zzkx.zzdi("Fail to invoke PlayStorePurchaseListener.");
        }
        zzlb.zzcvl.postDelayed(new Runnable() { // from class: com.google.android.gms.ads.internal.zzb.1
            @Override // java.lang.Runnable
            public void run() {
                int zzd = zzu.zzha().zzd(intent);
                zzu.zzha();
                if (zzd == 0 && zzb.this.zzaly.zzarn != null && zzb.this.zzaly.zzarn.zzcbm != null && zzb.this.zzaly.zzarn.zzcbm.zzxa() != null) {
                    zzb.this.zzaly.zzarn.zzcbm.zzxa().close();
                }
                zzb.this.zzaly.zzasj = false;
            }
        }, 500L);
    }

    @Override // com.google.android.gms.ads.internal.zza
    public boolean zza(AdRequestParcel adRequestParcel, zzdz zzdzVar) {
        if (!zzep()) {
            return false;
        }
        Bundle zzak = zzu.zzgm().zzak(this.zzaly.zzahs);
        this.zzalx.cancel();
        this.zzaly.zzasi = 0;
        zzkq zzkqVar = null;
        if (zzdr.zzbjv.get().booleanValue()) {
            zzkqVar = zzu.zzgq().zzvf();
            zzu.zzhi().zza(this.zzaly.zzahs, this.zzaly.zzari, false, zzkqVar, zzkqVar.zzup(), this.zzaly.zzarg);
        }
        AdRequestInfoParcel.zza zza = zza(adRequestParcel, zzak, zzkqVar);
        zzdzVar.zzg("seq_num", zza.zzcjx);
        zzdzVar.zzg("request_id", zza.zzcki);
        zzdzVar.zzg("session_id", zza.zzcjy);
        if (zza.zzcjv != null) {
            zzdzVar.zzg("app_version", String.valueOf(zza.zzcjv.versionCode));
        }
        this.zzaly.zzark = zzu.zzgi().zza(this.zzaly.zzahs, zza, this.zzaly.zzarh, this);
        return true;
    }

    protected boolean zza(AdRequestParcel adRequestParcel, zzko zzkoVar, boolean z) {
        if (!z && this.zzaly.zzhp()) {
            if (zzkoVar.zzbvq > 0) {
                this.zzalx.zza(adRequestParcel, zzkoVar.zzbvq);
            } else if (zzkoVar.zzcsk != null && zzkoVar.zzcsk.zzbvq > 0) {
                this.zzalx.zza(adRequestParcel, zzkoVar.zzcsk.zzbvq);
            } else if (!zzkoVar.zzclb && zzkoVar.errorCode == 2) {
                this.zzalx.zzh(adRequestParcel);
            }
        }
        return this.zzalx.zzfy();
    }

    @Override // com.google.android.gms.ads.internal.zza
    boolean zza(zzko zzkoVar) {
        AdRequestParcel adRequestParcel;
        boolean z = false;
        if (this.zzalz != null) {
            adRequestParcel = this.zzalz;
            this.zzalz = null;
        } else {
            adRequestParcel = zzkoVar.zzcju;
            if (adRequestParcel.extras != null) {
                z = adRequestParcel.extras.getBoolean("_noRefresh", false);
            }
        }
        return zza(adRequestParcel, zzkoVar, z);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.ads.internal.zza
    public boolean zza(@Nullable zzko zzkoVar, zzko zzkoVar2) {
        int i;
        int i2 = 0;
        if (zzkoVar != null && zzkoVar.zzbwp != null) {
            zzkoVar.zzbwp.zza((zzgr) null);
        }
        if (zzkoVar2.zzbwp != null) {
            zzkoVar2.zzbwp.zza(this);
        }
        if (zzkoVar2.zzcsk != null) {
            i = zzkoVar2.zzcsk.zzbvw;
            i2 = zzkoVar2.zzcsk.zzbvx;
        } else {
            i = 0;
        }
        this.zzaly.zzasg.zzj(i, i2);
        return true;
    }

    @Override // com.google.android.gms.ads.internal.zza, com.google.android.gms.internal.zziu.zza
    public void zzb(zzko zzkoVar) {
        super.zzb(zzkoVar);
        if (zzkoVar.zzbwm != null) {
            zzkx.zzdg("Disable the debug gesture detector on the mediation ad frame.");
            if (this.zzaly.zzarj != null) {
                this.zzaly.zzarj.zzhx();
            }
            zzkx.zzdg("Pinging network fill URLs.");
            zzu.zzhf().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, zzkoVar, this.zzaly.zzarg, false, zzkoVar.zzbwm.zzbuz);
            if (zzkoVar.zzcsk != null && zzkoVar.zzcsk.zzbvn != null && zzkoVar.zzcsk.zzbvn.size() > 0) {
                zzkx.zzdg("Pinging urls remotely");
                zzu.zzgm().zza(this.zzaly.zzahs, zzkoVar.zzcsk.zzbvn);
            }
        } else {
            zzkx.zzdg("Enable the debug gesture detector on the admob ad frame.");
            if (this.zzaly.zzarj != null) {
                this.zzaly.zzarj.zzhw();
            }
        }
        if (zzkoVar.errorCode != 3 || zzkoVar.zzcsk == null || zzkoVar.zzcsk.zzbvm == null) {
            return;
        }
        zzkx.zzdg("Pinging no fill URLs.");
        zzu.zzhf().zza(this.zzaly.zzahs, this.zzaly.zzari.zzda, zzkoVar, this.zzaly.zzarg, false, zzkoVar.zzcsk.zzbvm);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.ads.internal.zza
    public boolean zzc(AdRequestParcel adRequestParcel) {
        return super.zzc(adRequestParcel) && !this.zzamg;
    }

    protected boolean zzep() {
        return zzu.zzgm().zza(this.zzaly.zzahs.getPackageManager(), this.zzaly.zzahs.getPackageName(), "android.permission.INTERNET") && zzu.zzgm().zzy(this.zzaly.zzahs);
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzg
    public void zzeq() {
        this.zzama.zzj(this.zzaly.zzarn);
        this.zzamg = false;
        zzek();
        this.zzaly.zzarp.zzui();
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzg
    public void zzer() {
        this.zzamg = true;
        zzem();
    }

    @Override // com.google.android.gms.internal.zzgr
    public void zzes() {
        onAdClicked();
    }

    @Override // com.google.android.gms.internal.zzgr
    public void zzet() {
        zzeq();
    }

    @Override // com.google.android.gms.internal.zzgr
    public void zzeu() {
        zzeh();
    }

    @Override // com.google.android.gms.internal.zzgr
    public void zzev() {
        zzer();
    }

    @Override // com.google.android.gms.internal.zzgr
    public void zzew() {
        if (this.zzaly.zzarn != null) {
            String str = this.zzaly.zzarn.zzbwo;
            zzkx.zzdi(new StringBuilder(String.valueOf(str).length() + 74).append("Mediation adapter ").append(str).append(" refreshed, but mediation adapters should never refresh.").toString());
        }
        zza(this.zzaly.zzarn, true);
        zzen();
    }

    @Override // com.google.android.gms.internal.zzgr
    public void zzex() {
        recordImpression();
    }

    @Override // com.google.android.gms.ads.internal.zzs
    public void zzey() {
        zzu.zzgm().runOnUiThread(new Runnable() { // from class: com.google.android.gms.ads.internal.zzb.2
            @Override // java.lang.Runnable
            public void run() {
                zzb.this.zzalx.pause();
            }
        });
    }

    @Override // com.google.android.gms.ads.internal.zzs
    public void zzez() {
        zzu.zzgm().runOnUiThread(new Runnable() { // from class: com.google.android.gms.ads.internal.zzb.3
            @Override // java.lang.Runnable
            public void run() {
                zzb.this.zzalx.resume();
            }
        });
    }
}
