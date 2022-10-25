package com.google.android.gms.ads.internal;

import android.content.Context;
import android.graphics.Rect;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewTreeObserver;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzab;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzcu;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzgz;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
import com.google.android.gms.internal.zzmd;
import com.google.android.gms.internal.zzme;
import com.google.android.gms.internal.zzmi;
@zzji
/* loaded from: classes.dex */
public class zzf extends zzc implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener {
    private boolean zzamv;

    /* loaded from: classes.dex */
    public class zza {
        public zza() {
        }

        public void onClick() {
            zzf.this.onAdClicked();
        }
    }

    public zzf(Context context, AdSizeParcel adSizeParcel, String str, zzgz zzgzVar, VersionInfoParcel versionInfoParcel, zzd zzdVar) {
        super(context, adSizeParcel, str, zzgzVar, versionInfoParcel, zzdVar);
    }

    private AdSizeParcel zzb(zzko.zza zzaVar) {
        AdSize zzkd;
        if (zzaVar.zzcsu.zzazu) {
            return this.zzaly.zzarm;
        }
        String str = zzaVar.zzcsu.zzcle;
        if (str != null) {
            String[] split = str.split("[xX]");
            split[0] = split[0].trim();
            split[1] = split[1].trim();
            zzkd = new AdSize(Integer.parseInt(split[0]), Integer.parseInt(split[1]));
        } else {
            zzkd = this.zzaly.zzarm.zzkd();
        }
        return new AdSizeParcel(this.zzaly.zzahs, zzkd);
    }

    private boolean zzb(@Nullable zzko zzkoVar, zzko zzkoVar2) {
        if (zzkoVar2.zzclb) {
            View zzg = zzn.zzg(zzkoVar2);
            if (zzg == null) {
                zzkx.zzdi("Could not get mediation view");
                return false;
            }
            View nextView = this.zzaly.zzarj.getNextView();
            if (nextView != null) {
                if (nextView instanceof zzmd) {
                    ((zzmd) nextView).destroy();
                }
                this.zzaly.zzarj.removeView(nextView);
            }
            if (!zzn.zzh(zzkoVar2)) {
                try {
                    zzb(zzg);
                } catch (Throwable th) {
                    zzkx.zzc("Could not add mediation view to view hierarchy.", th);
                    return false;
                }
            }
        } else if (zzkoVar2.zzcsm != null && zzkoVar2.zzcbm != null) {
            zzkoVar2.zzcbm.zza(zzkoVar2.zzcsm);
            this.zzaly.zzarj.removeAllViews();
            this.zzaly.zzarj.setMinimumWidth(zzkoVar2.zzcsm.widthPixels);
            this.zzaly.zzarj.setMinimumHeight(zzkoVar2.zzcsm.heightPixels);
            zzb(zzkoVar2.zzcbm.getView());
        }
        if (this.zzaly.zzarj.getChildCount() > 1) {
            this.zzaly.zzarj.showNext();
        }
        if (zzkoVar != null) {
            View nextView2 = this.zzaly.zzarj.getNextView();
            if (nextView2 instanceof zzmd) {
                ((zzmd) nextView2).zza(this.zzaly.zzahs, this.zzaly.zzarm, this.zzalt);
            } else if (nextView2 != null) {
                this.zzaly.zzarj.removeView(nextView2);
            }
            this.zzaly.zzho();
        }
        this.zzaly.zzarj.setVisibility(0);
        return true;
    }

    private void zze(final zzko zzkoVar) {
        if (!com.google.android.gms.common.util.zzs.zzayq()) {
            return;
        }
        if (!this.zzaly.zzhp()) {
            if (this.zzaly.zzash == null || zzkoVar.zzcsi == null) {
                return;
            }
            this.zzama.zza(this.zzaly.zzarm, zzkoVar, this.zzaly.zzash);
        } else if (zzkoVar.zzcbm == null) {
        } else {
            if (zzkoVar.zzcsi != null) {
                this.zzama.zza(this.zzaly.zzarm, zzkoVar);
            }
            if (zzkoVar.zzic()) {
                new zzcu(this.zzaly.zzahs, zzkoVar.zzcbm.getView()).zza(zzkoVar.zzcbm);
            } else {
                zzkoVar.zzcbm.zzxc().zza(new zzme.zzc() { // from class: com.google.android.gms.ads.internal.zzf.3
                    @Override // com.google.android.gms.internal.zzme.zzc
                    public void zzfg() {
                        new zzcu(zzf.this.zzaly.zzahs, zzkoVar.zzcbm.getView()).zza(zzkoVar.zzcbm);
                    }
                });
            }
        }
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public void onGlobalLayout() {
        zzf(this.zzaly.zzarn);
    }

    @Override // android.view.ViewTreeObserver.OnScrollChangedListener
    public void onScrollChanged() {
        zzf(this.zzaly.zzarn);
    }

    @Override // com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void setManualImpressionsEnabled(boolean z) {
        zzaa.zzhs("setManualImpressionsEnabled must be called from the main thread.");
        this.zzamv = z;
    }

    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.client.zzu
    public void showInterstitial() {
        throw new IllegalStateException("Interstitial is NOT supported by BannerAdManager.");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.ads.internal.zzc
    public zzmd zza(zzko.zza zzaVar, @Nullable zze zzeVar, @Nullable com.google.android.gms.ads.internal.safebrowsing.zzc zzcVar) {
        if (this.zzaly.zzarm.zzazs == null && this.zzaly.zzarm.zzazu) {
            this.zzaly.zzarm = zzb(zzaVar);
        }
        return super.zza(zzaVar, zzeVar, zzcVar);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.ads.internal.zzb
    public void zza(@Nullable zzko zzkoVar, boolean z) {
        super.zza(zzkoVar, z);
        if (zzn.zzh(zzkoVar)) {
            zzn.zza(zzkoVar, new zza());
        }
    }

    @Override // com.google.android.gms.ads.internal.zzc, com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.zza
    public boolean zza(@Nullable zzko zzkoVar, final zzko zzkoVar2) {
        zzmi zzmiVar;
        if (!super.zza(zzkoVar, zzkoVar2)) {
            return false;
        }
        if (this.zzaly.zzhp() && !zzb(zzkoVar, zzkoVar2)) {
            zzh(0);
            return false;
        }
        if (zzkoVar2.zzclt) {
            zzf(zzkoVar2);
            zzu.zzhk().zza((View) this.zzaly.zzarj, (ViewTreeObserver.OnGlobalLayoutListener) this);
            zzu.zzhk().zza((View) this.zzaly.zzarj, (ViewTreeObserver.OnScrollChangedListener) this);
            if (!zzkoVar2.zzcsj) {
                final Runnable runnable = new Runnable() { // from class: com.google.android.gms.ads.internal.zzf.1
                    @Override // java.lang.Runnable
                    public void run() {
                        zzf.this.zzf(zzf.this.zzaly.zzarn);
                    }
                };
                zzme zzxc = zzkoVar2.zzcbm != null ? zzkoVar2.zzcbm.zzxc() : null;
                if (zzxc != null) {
                    zzxc.zza(new zzme.zze() { // from class: com.google.android.gms.ads.internal.zzf.2
                        @Override // com.google.android.gms.internal.zzme.zze
                        public void zzff() {
                            if (!zzkoVar2.zzcsj) {
                                zzu.zzgm();
                                zzlb.zzb(runnable);
                            }
                        }
                    });
                }
            }
        } else if (!this.zzaly.zzhq() || zzdr.zzbiw.get().booleanValue()) {
            zza(zzkoVar2, false);
        }
        if (zzkoVar2.zzcbm != null) {
            zzmiVar = zzkoVar2.zzcbm.zzxn();
            zzme zzxc2 = zzkoVar2.zzcbm.zzxc();
            if (zzxc2 != null) {
                zzxc2.zzya();
            }
        } else {
            zzmiVar = null;
        }
        if (this.zzaly.zzasb != null && zzmiVar != null) {
            zzmiVar.zzaq(this.zzaly.zzasb.zzbck);
        }
        zze(zzkoVar2);
        return true;
    }

    @Override // com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public boolean zzb(AdRequestParcel adRequestParcel) {
        return super.zzb(zze(adRequestParcel));
    }

    AdRequestParcel zze(AdRequestParcel adRequestParcel) {
        if (adRequestParcel.zzayq == this.zzamv) {
            return adRequestParcel;
        }
        return new AdRequestParcel(adRequestParcel.versionCode, adRequestParcel.zzayl, adRequestParcel.extras, adRequestParcel.zzaym, adRequestParcel.zzayn, adRequestParcel.zzayo, adRequestParcel.zzayp, adRequestParcel.zzayq || this.zzamv, adRequestParcel.zzayr, adRequestParcel.zzays, adRequestParcel.zzayt, adRequestParcel.zzayu, adRequestParcel.zzayv, adRequestParcel.zzayw, adRequestParcel.zzayx, adRequestParcel.zzayy, adRequestParcel.zzayz, adRequestParcel.zzaza);
    }

    @Override // com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    @Nullable
    public zzab zzej() {
        zzaa.zzhs("getVideoController must be called from the main thread.");
        if (this.zzaly.zzarn == null || this.zzaly.zzarn.zzcbm == null) {
            return null;
        }
        return this.zzaly.zzarn.zzcbm.zzxn();
    }

    @Override // com.google.android.gms.ads.internal.zzb
    protected boolean zzep() {
        boolean z = true;
        if (!zzu.zzgm().zza(this.zzaly.zzahs.getPackageManager(), this.zzaly.zzahs.getPackageName(), "android.permission.INTERNET")) {
            com.google.android.gms.ads.internal.client.zzm.zzkr().zza(this.zzaly.zzarj, this.zzaly.zzarm, "Missing internet permission in AndroidManifest.xml.", "Missing internet permission in AndroidManifest.xml. You must have the following declaration: <uses-permission android:name=\"android.permission.INTERNET\" />");
            z = false;
        }
        if (!zzu.zzgm().zzy(this.zzaly.zzahs)) {
            com.google.android.gms.ads.internal.client.zzm.zzkr().zza(this.zzaly.zzarj, this.zzaly.zzarm, "Missing AdActivity with android:configChanges in AndroidManifest.xml.", "Missing AdActivity with android:configChanges in AndroidManifest.xml. You must have the following declaration within the <application> element: <activity android:name=\"com.google.android.gms.ads.AdActivity\" android:configChanges=\"keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize\" />");
            z = false;
        }
        if (!z && this.zzaly.zzarj != null) {
            this.zzaly.zzarj.setVisibility(0);
        }
        return z;
    }

    void zzf(@Nullable zzko zzkoVar) {
        if (zzkoVar != null && !zzkoVar.zzcsj && this.zzaly.zzarj != null && zzu.zzgm().zza(this.zzaly.zzarj, this.zzaly.zzahs) && this.zzaly.zzarj.getGlobalVisibleRect(new Rect(), null)) {
            if (zzkoVar != null && zzkoVar.zzcbm != null && zzkoVar.zzcbm.zzxc() != null) {
                zzkoVar.zzcbm.zzxc().zza((zzme.zze) null);
            }
            zza(zzkoVar, false);
            zzkoVar.zzcsj = true;
        }
    }
}
