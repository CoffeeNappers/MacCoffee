package com.google.android.gms.internal;

import android.os.Bundle;
import android.view.View;
import com.google.android.gms.ads.formats.NativeAd;
import com.google.android.gms.ads.mediation.NativeAppInstallAdMapper;
import com.google.android.gms.internal.zzhd;
import java.util.ArrayList;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzhi extends zzhd.zza {
    private final NativeAppInstallAdMapper zzbxl;

    public zzhi(NativeAppInstallAdMapper nativeAppInstallAdMapper) {
        this.zzbxl = nativeAppInstallAdMapper;
    }

    @Override // com.google.android.gms.internal.zzhd
    public String getBody() {
        return this.zzbxl.getBody();
    }

    @Override // com.google.android.gms.internal.zzhd
    public String getCallToAction() {
        return this.zzbxl.getCallToAction();
    }

    @Override // com.google.android.gms.internal.zzhd
    public Bundle getExtras() {
        return this.zzbxl.getExtras();
    }

    @Override // com.google.android.gms.internal.zzhd
    public String getHeadline() {
        return this.zzbxl.getHeadline();
    }

    @Override // com.google.android.gms.internal.zzhd
    public List getImages() {
        List<NativeAd.Image> images = this.zzbxl.getImages();
        if (images != null) {
            ArrayList arrayList = new ArrayList();
            for (NativeAd.Image image : images) {
                arrayList.add(new com.google.android.gms.ads.internal.formats.zzc(image.getDrawable(), image.getUri(), image.getScale()));
            }
            return arrayList;
        }
        return null;
    }

    @Override // com.google.android.gms.internal.zzhd
    public boolean getOverrideClickHandling() {
        return this.zzbxl.getOverrideClickHandling();
    }

    @Override // com.google.android.gms.internal.zzhd
    public boolean getOverrideImpressionRecording() {
        return this.zzbxl.getOverrideImpressionRecording();
    }

    @Override // com.google.android.gms.internal.zzhd
    public String getPrice() {
        return this.zzbxl.getPrice();
    }

    @Override // com.google.android.gms.internal.zzhd
    public double getStarRating() {
        return this.zzbxl.getStarRating();
    }

    @Override // com.google.android.gms.internal.zzhd
    public String getStore() {
        return this.zzbxl.getStore();
    }

    @Override // com.google.android.gms.internal.zzhd
    public void recordImpression() {
        this.zzbxl.recordImpression();
    }

    @Override // com.google.android.gms.internal.zzhd
    public com.google.android.gms.ads.internal.client.zzab zzej() {
        if (this.zzbxl.getVideoController() != null) {
            return this.zzbxl.getVideoController().zzdw();
        }
        return null;
    }

    @Override // com.google.android.gms.internal.zzhd
    public void zzk(com.google.android.gms.dynamic.zzd zzdVar) {
        this.zzbxl.handleClick((View) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }

    @Override // com.google.android.gms.internal.zzhd
    public void zzl(com.google.android.gms.dynamic.zzd zzdVar) {
        this.zzbxl.trackView((View) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }

    @Override // com.google.android.gms.internal.zzhd
    public void zzm(com.google.android.gms.dynamic.zzd zzdVar) {
        this.zzbxl.untrackView((View) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }

    @Override // com.google.android.gms.internal.zzhd
    public zzeg zzmo() {
        NativeAd.Image icon = this.zzbxl.getIcon();
        if (icon != null) {
            return new com.google.android.gms.ads.internal.formats.zzc(icon.getDrawable(), icon.getUri(), icon.getScale());
        }
        return null;
    }
}
