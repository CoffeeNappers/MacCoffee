package com.google.android.gms.ads;

import android.content.Context;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresPermission;
import com.google.android.gms.ads.doubleclick.PublisherAdRequest;
import com.google.android.gms.ads.formats.NativeAdOptions;
import com.google.android.gms.ads.formats.NativeAppInstallAd;
import com.google.android.gms.ads.formats.NativeContentAd;
import com.google.android.gms.ads.formats.NativeCustomTemplateAd;
import com.google.android.gms.ads.internal.client.zzad;
import com.google.android.gms.ads.internal.client.zzc;
import com.google.android.gms.ads.internal.client.zzh;
import com.google.android.gms.ads.internal.client.zzm;
import com.google.android.gms.ads.internal.client.zzr;
import com.google.android.gms.ads.internal.client.zzs;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzev;
import com.google.android.gms.internal.zzew;
import com.google.android.gms.internal.zzex;
import com.google.android.gms.internal.zzey;
import com.google.android.gms.internal.zzgy;
/* loaded from: classes.dex */
public class AdLoader {
    private final Context mContext;
    private final zzh zzakc;
    private final zzr zzakd;

    /* loaded from: classes.dex */
    public static class Builder {
        private final Context mContext;
        private final zzs zzake;

        Builder(Context context, zzs zzsVar) {
            this.mContext = context;
            this.zzake = zzsVar;
        }

        public Builder(Context context, String str) {
            this((Context) zzaa.zzb(context, "context cannot be null"), zzm.zzks().zzb(context, str, new zzgy()));
        }

        public AdLoader build() {
            try {
                return new AdLoader(this.mContext, this.zzake.zzfl());
            } catch (RemoteException e) {
                zzb.zzb("Failed to build AdLoader.", e);
                return null;
            }
        }

        public Builder forAppInstallAd(NativeAppInstallAd.OnAppInstallAdLoadedListener onAppInstallAdLoadedListener) {
            try {
                this.zzake.zza(new zzev(onAppInstallAdLoadedListener));
            } catch (RemoteException e) {
                zzb.zzc("Failed to add app install ad listener", e);
            }
            return this;
        }

        public Builder forContentAd(NativeContentAd.OnContentAdLoadedListener onContentAdLoadedListener) {
            try {
                this.zzake.zza(new zzew(onContentAdLoadedListener));
            } catch (RemoteException e) {
                zzb.zzc("Failed to add content ad listener", e);
            }
            return this;
        }

        public Builder forCustomTemplateAd(String str, NativeCustomTemplateAd.OnCustomTemplateAdLoadedListener onCustomTemplateAdLoadedListener, NativeCustomTemplateAd.OnCustomClickListener onCustomClickListener) {
            try {
                this.zzake.zza(str, new zzey(onCustomTemplateAdLoadedListener), onCustomClickListener == null ? null : new zzex(onCustomClickListener));
            } catch (RemoteException e) {
                zzb.zzc("Failed to add custom template ad listener", e);
            }
            return this;
        }

        public Builder withAdListener(AdListener adListener) {
            try {
                this.zzake.zzb(new zzc(adListener));
            } catch (RemoteException e) {
                zzb.zzc("Failed to set AdListener.", e);
            }
            return this;
        }

        public Builder withCorrelator(@NonNull Correlator correlator) {
            zzaa.zzy(correlator);
            try {
                this.zzake.zzb(correlator.zzdu());
            } catch (RemoteException e) {
                zzb.zzc("Failed to set correlator.", e);
            }
            return this;
        }

        public Builder withNativeAdOptions(NativeAdOptions nativeAdOptions) {
            try {
                this.zzake.zza(new NativeAdOptionsParcel(nativeAdOptions));
            } catch (RemoteException e) {
                zzb.zzc("Failed to specify native ad options", e);
            }
            return this;
        }
    }

    AdLoader(Context context, zzr zzrVar) {
        this(context, zzrVar, zzh.zzkb());
    }

    AdLoader(Context context, zzr zzrVar, zzh zzhVar) {
        this.mContext = context;
        this.zzakd = zzrVar;
        this.zzakc = zzhVar;
    }

    private void zza(zzad zzadVar) {
        try {
            this.zzakd.zzf(this.zzakc.zza(this.mContext, zzadVar));
        } catch (RemoteException e) {
            zzb.zzb("Failed to load ad.", e);
        }
    }

    public String getMediationAdapterClassName() {
        try {
            return this.zzakd.getMediationAdapterClassName();
        } catch (RemoteException e) {
            zzb.zzc("Failed to get the mediation adapter class name.", e);
            return null;
        }
    }

    public boolean isLoading() {
        try {
            return this.zzakd.isLoading();
        } catch (RemoteException e) {
            zzb.zzc("Failed to check if ad is loading.", e);
            return false;
        }
    }

    @RequiresPermission("android.permission.INTERNET")
    public void loadAd(AdRequest adRequest) {
        zza(adRequest.zzdt());
    }

    public void loadAd(PublisherAdRequest publisherAdRequest) {
        zza(publisherAdRequest.zzdt());
    }
}
