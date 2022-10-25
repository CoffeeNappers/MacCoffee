package com.google.android.gms.internal;

import android.os.RemoteException;
import android.view.View;
import com.google.android.gms.ads.doubleclick.CustomRenderedAd;
@zzji
/* loaded from: classes.dex */
public class zzeb implements CustomRenderedAd {
    private final zzec zzbmf;

    public zzeb(zzec zzecVar) {
        this.zzbmf = zzecVar;
    }

    @Override // com.google.android.gms.ads.doubleclick.CustomRenderedAd
    public String getBaseUrl() {
        try {
            return this.zzbmf.zzme();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not delegate getBaseURL to CustomRenderedAd", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.doubleclick.CustomRenderedAd
    public String getContent() {
        try {
            return this.zzbmf.getContent();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not delegate getContent to CustomRenderedAd", e);
            return null;
        }
    }

    @Override // com.google.android.gms.ads.doubleclick.CustomRenderedAd
    public void onAdRendered(View view) {
        try {
            this.zzbmf.zzi(view != null ? com.google.android.gms.dynamic.zze.zzac(view) : null);
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not delegate onAdRendered to CustomRenderedAd", e);
        }
    }

    @Override // com.google.android.gms.ads.doubleclick.CustomRenderedAd
    public void recordClick() {
        try {
            this.zzbmf.recordClick();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not delegate recordClick to CustomRenderedAd", e);
        }
    }

    @Override // com.google.android.gms.ads.doubleclick.CustomRenderedAd
    public void recordImpression() {
        try {
            this.zzbmf.recordImpression();
        } catch (RemoteException e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not delegate recordImpression to CustomRenderedAd", e);
        }
    }
}
