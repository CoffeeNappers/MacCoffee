package com.google.android.gms.ads.internal;

import android.content.Context;
import android.os.RemoteException;
import android.support.annotation.Nullable;
import android.support.v4.util.SimpleArrayMap;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.formats.zzi;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzdz;
import com.google.android.gms.internal.zzed;
import com.google.android.gms.internal.zzeq;
import com.google.android.gms.internal.zzer;
import com.google.android.gms.internal.zzes;
import com.google.android.gms.internal.zzet;
import com.google.android.gms.internal.zzgz;
import com.google.android.gms.internal.zzhd;
import com.google.android.gms.internal.zzhe;
import com.google.android.gms.internal.zzig;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
import com.google.android.gms.internal.zzmd;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzq extends zzb {
    private zzmd zzapd;

    public zzq(Context context, zzd zzdVar, AdSizeParcel adSizeParcel, String str, zzgz zzgzVar, VersionInfoParcel versionInfoParcel) {
        super(context, adSizeParcel, str, zzgzVar, versionInfoParcel, zzdVar);
    }

    private static com.google.android.gms.ads.internal.formats.zzd zza(zzhd zzhdVar) throws RemoteException {
        return new com.google.android.gms.ads.internal.formats.zzd(zzhdVar.getHeadline(), zzhdVar.getImages(), zzhdVar.getBody(), zzhdVar.zzmo() != null ? zzhdVar.zzmo() : null, zzhdVar.getCallToAction(), zzhdVar.getStarRating(), zzhdVar.getStore(), zzhdVar.getPrice(), null, zzhdVar.getExtras(), zzhdVar.zzej(), null);
    }

    private static com.google.android.gms.ads.internal.formats.zze zza(zzhe zzheVar) throws RemoteException {
        return new com.google.android.gms.ads.internal.formats.zze(zzheVar.getHeadline(), zzheVar.getImages(), zzheVar.getBody(), zzheVar.zzmt() != null ? zzheVar.zzmt() : null, zzheVar.getCallToAction(), zzheVar.getAdvertiser(), null, zzheVar.getExtras());
    }

    private void zza(final com.google.android.gms.ads.internal.formats.zzd zzdVar) {
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.zzq.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    if (zzq.this.zzaly.zzarw == null) {
                        return;
                    }
                    zzq.this.zzaly.zzarw.zza(zzdVar);
                } catch (RemoteException e) {
                    zzkx.zzc("Could not call OnAppInstallAdLoadedListener.onAppInstallAdLoaded().", e);
                }
            }
        });
    }

    private void zza(final com.google.android.gms.ads.internal.formats.zze zzeVar) {
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.zzq.3
            @Override // java.lang.Runnable
            public void run() {
                try {
                    if (zzq.this.zzaly.zzarx == null) {
                        return;
                    }
                    zzq.this.zzaly.zzarx.zza(zzeVar);
                } catch (RemoteException e) {
                    zzkx.zzc("Could not call OnContentAdLoadedListener.onContentAdLoaded().", e);
                }
            }
        });
    }

    private void zza(final zzko zzkoVar, final String str) {
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.zzq.4
            @Override // java.lang.Runnable
            public void run() {
                try {
                    zzq.this.zzaly.zzarz.get(str).zza((com.google.android.gms.ads.internal.formats.zzf) zzkoVar.zzcsq);
                } catch (RemoteException e) {
                    zzkx.zzc("Could not call onCustomTemplateAdLoadedListener.onCustomTemplateAdLoaded().", e);
                }
            }
        });
    }

    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void pause() {
        throw new IllegalStateException("Native Ad DOES NOT support pause().");
    }

    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void resume() {
        throw new IllegalStateException("Native Ad DOES NOT support resume().");
    }

    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.client.zzu
    public void showInterstitial() {
        throw new IllegalStateException("Interstitial is NOT supported by NativeAdManager.");
    }

    public void zza(SimpleArrayMap<String, zzet> simpleArrayMap) {
        zzaa.zzhs("setOnCustomTemplateAdLoadedListeners must be called on the main UI thread.");
        this.zzaly.zzarz = simpleArrayMap;
    }

    public void zza(com.google.android.gms.ads.internal.formats.zzg zzgVar) {
        if (this.zzapd != null) {
            this.zzapd.zzb(zzgVar);
        }
    }

    public void zza(com.google.android.gms.ads.internal.formats.zzi zziVar) {
        if (this.zzaly.zzarn.zzcsi != null) {
            zzu.zzgq().zzvg().zza(this.zzaly.zzarm, this.zzaly.zzarn, zziVar);
        }
    }

    @Override // com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void zza(zzed zzedVar) {
        throw new IllegalStateException("CustomRendering is NOT supported by NativeAdManager.");
    }

    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.zza, com.google.android.gms.ads.internal.client.zzu
    public void zza(zzig zzigVar) {
        throw new IllegalStateException("In App Purchase is NOT supported by NativeAdManager.");
    }

    @Override // com.google.android.gms.ads.internal.zza
    public void zza(final zzko.zza zzaVar, zzdz zzdzVar) {
        if (zzaVar.zzarm != null) {
            this.zzaly.zzarm = zzaVar.zzarm;
        }
        if (zzaVar.errorCode != -2) {
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.zzq.1
                @Override // java.lang.Runnable
                public void run() {
                    zzq.this.zzb(new zzko(zzaVar, null, null, null, null, null, null, null));
                }
            });
            return;
        }
        this.zzaly.zzasi = 0;
        this.zzaly.zzarl = zzu.zzgl().zza(this.zzaly.zzahs, this, zzaVar, this.zzaly.zzarh, null, this.zzamf, this, zzdzVar);
        String valueOf = String.valueOf(this.zzaly.zzarl.getClass().getName());
        zzkx.zzdg(valueOf.length() != 0 ? "AdRenderer: ".concat(valueOf) : new String("AdRenderer: "));
    }

    @Override // com.google.android.gms.ads.internal.zzb
    protected boolean zza(AdRequestParcel adRequestParcel, zzko zzkoVar, boolean z) {
        return this.zzalx.zzfy();
    }

    @Override // com.google.android.gms.ads.internal.zzb, com.google.android.gms.ads.internal.zza
    protected boolean zza(zzko zzkoVar, zzko zzkoVar2) {
        zzb((List<String>) null);
        if (!this.zzaly.zzhp()) {
            throw new IllegalStateException("Native ad DOES NOT have custom rendering mode.");
        }
        if (zzkoVar2.zzclb) {
            try {
                zzhd zzom = zzkoVar2.zzbwn != null ? zzkoVar2.zzbwn.zzom() : null;
                zzhe zzon = zzkoVar2.zzbwn != null ? zzkoVar2.zzbwn.zzon() : null;
                if (zzom != null && this.zzaly.zzarw != null) {
                    com.google.android.gms.ads.internal.formats.zzd zza = zza(zzom);
                    zza.zzb(new com.google.android.gms.ads.internal.formats.zzh(this.zzaly.zzahs, this, this.zzaly.zzarh, zzom, zza));
                    zza(zza);
                } else if (zzon == null || this.zzaly.zzarx == null) {
                    zzkx.zzdi("No matching mapper/listener for retrieved native ad template.");
                    zzh(0);
                    return false;
                } else {
                    com.google.android.gms.ads.internal.formats.zze zza2 = zza(zzon);
                    zza2.zzb(new com.google.android.gms.ads.internal.formats.zzh(this.zzaly.zzahs, this, this.zzaly.zzarh, zzon, zza2));
                    zza(zza2);
                }
            } catch (RemoteException e) {
                zzkx.zzc("Failed to get native ad mapper", e);
            }
        } else {
            zzi.zza zzaVar = zzkoVar2.zzcsq;
            if ((zzaVar instanceof com.google.android.gms.ads.internal.formats.zze) && this.zzaly.zzarx != null) {
                zza((com.google.android.gms.ads.internal.formats.zze) zzkoVar2.zzcsq);
            } else if ((zzaVar instanceof com.google.android.gms.ads.internal.formats.zzd) && this.zzaly.zzarw != null) {
                zza((com.google.android.gms.ads.internal.formats.zzd) zzkoVar2.zzcsq);
            } else if (!(zzaVar instanceof com.google.android.gms.ads.internal.formats.zzf) || this.zzaly.zzarz == null || this.zzaly.zzarz.get(((com.google.android.gms.ads.internal.formats.zzf) zzaVar).getCustomTemplateId()) == null) {
                zzkx.zzdi("No matching listener for retrieved native ad template.");
                zzh(0);
                return false;
            } else {
                zza(zzkoVar2, ((com.google.android.gms.ads.internal.formats.zzf) zzaVar).getCustomTemplateId());
            }
        }
        return super.zza(zzkoVar, zzkoVar2);
    }

    @Nullable
    public zzes zzaa(String str) {
        zzaa.zzhs("getOnCustomClickListener must be called on the main UI thread.");
        return this.zzaly.zzary.get(str);
    }

    public void zzb(SimpleArrayMap<String, zzes> simpleArrayMap) {
        zzaa.zzhs("setOnCustomClickListener must be called on the main UI thread.");
        this.zzaly.zzary = simpleArrayMap;
    }

    public void zzb(NativeAdOptionsParcel nativeAdOptionsParcel) {
        zzaa.zzhs("setNativeAdOptions must be called on the main UI thread.");
        this.zzaly.zzasa = nativeAdOptionsParcel;
    }

    public void zzb(zzeq zzeqVar) {
        zzaa.zzhs("setOnAppInstallAdLoadedListener must be called on the main UI thread.");
        this.zzaly.zzarw = zzeqVar;
    }

    public void zzb(zzer zzerVar) {
        zzaa.zzhs("setOnContentAdLoadedListener must be called on the main UI thread.");
        this.zzaly.zzarx = zzerVar;
    }

    public void zzb(@Nullable List<String> list) {
        zzaa.zzhs("setNativeTemplates must be called on the main UI thread.");
        this.zzaly.zzase = list;
    }

    public void zzc(zzmd zzmdVar) {
        this.zzapd = zzmdVar;
    }

    public void zzfu() {
        if (this.zzaly.zzarn == null || this.zzapd == null) {
            zzkx.zzdi("Request to enable ActiveView before adState is available.");
        } else {
            zzu.zzgq().zzvg().zza(this.zzaly.zzarm, this.zzaly.zzarn, this.zzapd.getView(), this.zzapd);
        }
    }

    public SimpleArrayMap<String, zzet> zzfv() {
        zzaa.zzhs("getOnCustomTemplateAdLoadedListeners must be called on the main UI thread.");
        return this.zzaly.zzarz;
    }

    public void zzfw() {
        if (this.zzapd != null) {
            this.zzapd.destroy();
            this.zzapd = null;
        }
    }

    public void zzfx() {
        if (this.zzapd == null || this.zzapd.zzxn() == null || this.zzaly.zzasa == null || this.zzaly.zzasa.zzbon == null) {
            return;
        }
        this.zzapd.zzxn().zzaq(this.zzaly.zzasa.zzbon.zzbck);
    }
}
