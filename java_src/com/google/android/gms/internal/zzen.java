package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.formats.NativeAd;
import com.google.android.gms.ads.formats.NativeContentAd;
import com.google.android.gms.internal.zzeg;
import java.util.ArrayList;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzen extends NativeContentAd {
    private final List<NativeAd.Image> zzboz = new ArrayList();
    private final zzem zzbpb;
    private final zzeh zzbpc;

    public zzen(zzem zzemVar) {
        zzeh zzehVar;
        zzeg zzmt;
        this.zzbpb = zzemVar;
        try {
            List<Object> images = this.zzbpb.getImages();
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
            zzmt = this.zzbpb.zzmt();
        } catch (RemoteException e2) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get icon.", e2);
        }
        if (zzmt != null) {
            zzehVar = new zzeh(zzmt);
            this.zzbpc = zzehVar;
        }
        zzehVar = null;
        this.zzbpc = zzehVar;
    }

    @Override // com.google.android.gms.ads.formats.NativeContentAd
    public void destroy() {
        try {
            this.zzbpb.destroy();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to destroy", e);
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeContentAd
    public CharSequence getAdvertiser() {
        try {
            return this.zzbpb.getAdvertiser();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get attribution.", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeContentAd
    public CharSequence getBody() {
        try {
            return this.zzbpb.getBody();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get body.", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeContentAd
    public CharSequence getCallToAction() {
        try {
            return this.zzbpb.getCallToAction();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get call to action.", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeContentAd
    public Bundle getExtras() {
        try {
            return this.zzbpb.getExtras();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Failed to get extras", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeContentAd
    public CharSequence getHeadline() {
        try {
            return this.zzbpb.getHeadline();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get headline.", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.formats.NativeContentAd
    public List<NativeAd.Image> getImages() {
        return this.zzboz;
    }

    @Override // com.google.android.gms.ads.formats.NativeContentAd
    public NativeAd.Image getLogo() {
        return this.zzbpc;
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
            return this.zzbpb.zzmp();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to retrieve native ad engine.", e);
            return null;
        }
    }
}
