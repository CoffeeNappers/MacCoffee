package com.google.android.gms.ads.mediation;

import com.google.android.gms.ads.formats.NativeAd;
import java.util.List;
/* loaded from: classes.dex */
public abstract class NativeContentAdMapper extends NativeAdMapper {
    private NativeAd.Image R;
    private String zzbmy;
    private List<NativeAd.Image> zzbmz;
    private String zzbna;
    private String zzbnc;
    private String zzbnl;

    public final String getAdvertiser() {
        return this.zzbnl;
    }

    public final String getBody() {
        return this.zzbna;
    }

    public final String getCallToAction() {
        return this.zzbnc;
    }

    public final String getHeadline() {
        return this.zzbmy;
    }

    public final List<NativeAd.Image> getImages() {
        return this.zzbmz;
    }

    public final NativeAd.Image getLogo() {
        return this.R;
    }

    public final void setAdvertiser(String str) {
        this.zzbnl = str;
    }

    public final void setBody(String str) {
        this.zzbna = str;
    }

    public final void setCallToAction(String str) {
        this.zzbnc = str;
    }

    public final void setHeadline(String str) {
        this.zzbmy = str;
    }

    public final void setImages(List<NativeAd.Image> list) {
        this.zzbmz = list;
    }

    public final void setLogo(NativeAd.Image image) {
        this.R = image;
    }
}
