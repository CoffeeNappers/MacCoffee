package com.google.android.gms.ads.mediation;

import com.google.android.gms.ads.VideoController;
import com.google.android.gms.ads.formats.NativeAd;
import java.util.List;
/* loaded from: classes.dex */
public abstract class NativeAppInstallAdMapper extends NativeAdMapper {
    private NativeAd.Image Q;
    private VideoController zzbbc;
    private String zzbmy;
    private List<NativeAd.Image> zzbmz;
    private String zzbna;
    private String zzbnc;
    private double zzbnd;
    private String zzbne;
    private String zzbnf;

    public final String getBody() {
        return this.zzbna;
    }

    public final String getCallToAction() {
        return this.zzbnc;
    }

    public final String getHeadline() {
        return this.zzbmy;
    }

    public final NativeAd.Image getIcon() {
        return this.Q;
    }

    public final List<NativeAd.Image> getImages() {
        return this.zzbmz;
    }

    public final String getPrice() {
        return this.zzbnf;
    }

    public final double getStarRating() {
        return this.zzbnd;
    }

    public final String getStore() {
        return this.zzbne;
    }

    public final VideoController getVideoController() {
        return this.zzbbc;
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

    public final void setIcon(NativeAd.Image image) {
        this.Q = image;
    }

    public final void setImages(List<NativeAd.Image> list) {
        this.zzbmz = list;
    }

    public final void setPrice(String str) {
        this.zzbnf = str;
    }

    public final void setStarRating(double d) {
        this.zzbnd = d;
    }

    public final void setStore(String str) {
        this.zzbne = str;
    }

    public final void zza(VideoController videoController) {
        this.zzbbc = videoController;
    }
}
