package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.VideoController;
import com.google.android.gms.ads.formats.NativeAd;
import com.google.android.gms.ads.formats.NativeAppInstallAd;
import com.google.android.gms.internal.zzeg;
import java.util.ArrayList;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzel extends NativeAppInstallAd {
    private final zzek zzboy;
    private final zzeh zzbpa;
    private final List<NativeAd.Image> zzboz = new ArrayList();
    private VideoController zzbbc = new VideoController();

    public zzel(zzek zzekVar) {
        zzeh zzehVar;
        zzeg zzmo;
        this.zzboy = zzekVar;
        try {
            List<Object> images = this.zzboy.getImages();
            if (images != null) {
                for (Object obj : images) {
                    zzeg zze = zze(obj);
                    if (zze != null) {
                        this.zzboz.add(new zzeh(zze));
                    }
                }
            }
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get image.", e);
        }
        try {
            zzmo = this.zzboy.zzmo();
        } catch (RemoteException e2) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get icon.", e2);
        }
        if (zzmo != null) {
            zzehVar = new zzeh(zzmo);
            this.zzbpa = zzehVar;
        }
        zzehVar = null;
        this.zzbpa = zzehVar;
    }

    @Override // com.google.android.gms.ads.formats.NativeAppInstallAd
    public void destroy() {
        try {
            this.zzboy.destroy();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to destroy", e);
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeAppInstallAd
    public CharSequence getBody() {
        try {
            return this.zzboy.getBody();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get body.", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeAppInstallAd
    public CharSequence getCallToAction() {
        try {
            return this.zzboy.getCallToAction();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get call to action.", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeAppInstallAd
    public Bundle getExtras() {
        try {
            return this.zzboy.getExtras();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get extras", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeAppInstallAd
    public CharSequence getHeadline() {
        try {
            return this.zzboy.getHeadline();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get headline.", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeAppInstallAd
    public NativeAd.Image getIcon() {
        return this.zzbpa;
    }

    @Override // com.google.android.gms.ads.formats.NativeAppInstallAd
    public List<NativeAd.Image> getImages() {
        return this.zzboz;
    }

    @Override // com.google.android.gms.ads.formats.NativeAppInstallAd
    public CharSequence getPrice() {
        try {
            return this.zzboy.getPrice();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get price.", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeAppInstallAd
    public Double getStarRating() {
        try {
            double starRating = this.zzboy.getStarRating();
            if (starRating != -1.0d) {
                return Double.valueOf(starRating);
            }
            return null;
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get star rating.", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeAppInstallAd
    public CharSequence getStore() {
        try {
            return this.zzboy.getStore();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get store", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeAppInstallAd
    public VideoController getVideoController() {
        try {
            if (this.zzboy.zzej() != null) {
                this.zzbbc.zza(this.zzboy.zzej());
            }
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Exception occurred while getting video controller", e);
        }
        return this.zzbbc;
    }

    zzeg zze(Object obj) {
        if (obj instanceof IBinder) {
            return zzeg.zza.zzab((IBinder) obj);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.ads.formats.NativeAd
    /* renamed from: zzmp */
    public com.google.android.gms.dynamic.zzd zzdy() {
        try {
            return this.zzboy.zzmp();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to retrieve native ad engine.", e);
            return null;
        }
    }
}
