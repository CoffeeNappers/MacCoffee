package com.google.android.gms.internal;

import android.location.Location;
import android.support.annotation.Nullable;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.ads.VideoOptions;
import com.google.android.gms.ads.formats.NativeAdOptions;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.mediation.NativeMediationAdRequest;
import java.util.Date;
import java.util.List;
import java.util.Set;
@zzji
/* loaded from: classes.dex */
public final class zzhk implements NativeMediationAdRequest {
    private final NativeAdOptionsParcel zzanq;
    private final List<String> zzanr;
    private final int zzazc;
    private final boolean zzazo;
    private final int zzbxg;
    private final Date zzgr;
    private final Set<String> zzgt;
    private final boolean zzgu;
    private final Location zzgv;

    public zzhk(@Nullable Date date, int i, @Nullable Set<String> set, @Nullable Location location, boolean z, int i2, NativeAdOptionsParcel nativeAdOptionsParcel, List<String> list, boolean z2) {
        this.zzgr = date;
        this.zzazc = i;
        this.zzgt = set;
        this.zzgv = location;
        this.zzgu = z;
        this.zzbxg = i2;
        this.zzanq = nativeAdOptionsParcel;
        this.zzanr = list;
        this.zzazo = z2;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public Date getBirthday() {
        return this.zzgr;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public int getGender() {
        return this.zzazc;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public Set<String> getKeywords() {
        return this.zzgt;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public Location getLocation() {
        return this.zzgv;
    }

    @Override // com.google.android.gms.ads.mediation.NativeMediationAdRequest
    public NativeAdOptions getNativeAdOptions() {
        if (this.zzanq == null) {
            return null;
        }
        NativeAdOptions.Builder requestMultipleImages = new NativeAdOptions.Builder().setReturnUrlsForImageAssets(this.zzanq.zzboj).setImageOrientation(this.zzanq.zzbok).setRequestMultipleImages(this.zzanq.zzbol);
        if (this.zzanq.versionCode >= 2) {
            requestMultipleImages.setAdChoicesPlacement(this.zzanq.zzbom);
        }
        if (this.zzanq.versionCode >= 3 && this.zzanq.zzbon != null) {
            requestMultipleImages.setVideoOptions(new VideoOptions.Builder().setStartMuted(this.zzanq.zzbon.zzbck).build());
        }
        return requestMultipleImages.build();
    }

    @Override // com.google.android.gms.ads.mediation.NativeMediationAdRequest
    public boolean isAppInstallAdRequested() {
        return this.zzanr != null && this.zzanr.contains("2");
    }

    @Override // com.google.android.gms.ads.mediation.NativeMediationAdRequest
    public boolean isContentAdRequested() {
        return this.zzanr != null && this.zzanr.contains(AppEventsConstants.EVENT_PARAM_VALUE_YES);
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public boolean isDesignedForFamilies() {
        return this.zzazo;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public boolean isTesting() {
        return this.zzgu;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public int taggedForChildDirectedTreatment() {
        return this.zzbxg;
    }
}
