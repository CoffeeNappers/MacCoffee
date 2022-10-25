package com.google.android.gms.internal;

import android.os.Bundle;
import android.view.View;
import com.google.android.gms.ads.formats.NativeAd;
import com.google.android.gms.ads.mediation.NativeContentAdMapper;
import com.google.android.gms.internal.zzhe;
import java.util.ArrayList;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzhj extends zzhe.zza {
    private final NativeContentAdMapper zzbxm;

    public zzhj(NativeContentAdMapper nativeContentAdMapper) {
        this.zzbxm = nativeContentAdMapper;
    }

    @Override // com.google.android.gms.internal.zzhe
    public String getAdvertiser() {
        return this.zzbxm.getAdvertiser();
    }

    @Override // com.google.android.gms.internal.zzhe
    public String getBody() {
        return this.zzbxm.getBody();
    }

    @Override // com.google.android.gms.internal.zzhe
    public String getCallToAction() {
        return this.zzbxm.getCallToAction();
    }

    @Override // com.google.android.gms.internal.zzhe
    public Bundle getExtras() {
        return this.zzbxm.getExtras();
    }

    @Override // com.google.android.gms.internal.zzhe
    public String getHeadline() {
        return this.zzbxm.getHeadline();
    }

    @Override // com.google.android.gms.internal.zzhe
    public List getImages() {
        List<NativeAd.Image> images = this.zzbxm.getImages();
        if (images != null) {
            ArrayList arrayList = new ArrayList();
            for (NativeAd.Image image : images) {
                arrayList.add(new com.google.android.gms.ads.internal.formats.zzc(image.getDrawable(), image.getUri(), image.getScale()));
            }
            return arrayList;
        }
        return null;
    }

    @Override // com.google.android.gms.internal.zzhe
    public boolean getOverrideClickHandling() {
        return this.zzbxm.getOverrideClickHandling();
    }

    @Override // com.google.android.gms.internal.zzhe
    public boolean getOverrideImpressionRecording() {
        return this.zzbxm.getOverrideImpressionRecording();
    }

    @Override // com.google.android.gms.internal.zzhe
    public void recordImpression() {
        this.zzbxm.recordImpression();
    }

    @Override // com.google.android.gms.internal.zzhe
    public void zzk(com.google.android.gms.dynamic.zzd zzdVar) {
        this.zzbxm.handleClick((View) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }

    @Override // com.google.android.gms.internal.zzhe
    public void zzl(com.google.android.gms.dynamic.zzd zzdVar) {
        this.zzbxm.trackView((View) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }

    @Override // com.google.android.gms.internal.zzhe
    public void zzm(com.google.android.gms.dynamic.zzd zzdVar) {
        this.zzbxm.untrackView((View) com.google.android.gms.dynamic.zze.zzae(zzdVar));
    }

    @Override // com.google.android.gms.internal.zzhe
    public zzeg zzmt() {
        NativeAd.Image logo = this.zzbxm.getLogo();
        if (logo != null) {
            return new com.google.android.gms.ads.internal.formats.zzc(logo.getDrawable(), logo.getUri(), logo.getScale());
        }
        return null;
    }
}
