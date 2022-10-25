package com.google.android.gms.ads.internal.formats;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.formats.NativeAdOptions;
import com.google.android.gms.ads.internal.client.VideoOptionsParcel;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class NativeAdOptionsParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<NativeAdOptionsParcel> CREATOR = new zzk();
    public final int versionCode;
    public final boolean zzboj;
    public final int zzbok;
    public final boolean zzbol;
    public final int zzbom;
    @Nullable
    public final VideoOptionsParcel zzbon;

    public NativeAdOptionsParcel(int i, boolean z, int i2, boolean z2, int i3, VideoOptionsParcel videoOptionsParcel) {
        this.versionCode = i;
        this.zzboj = z;
        this.zzbok = i2;
        this.zzbol = z2;
        this.zzbom = i3;
        this.zzbon = videoOptionsParcel;
    }

    public NativeAdOptionsParcel(NativeAdOptions nativeAdOptions) {
        this(3, nativeAdOptions.shouldReturnUrlsForImageAssets(), nativeAdOptions.getImageOrientation(), nativeAdOptions.shouldRequestMultipleImages(), nativeAdOptions.getAdChoicesPlacement(), nativeAdOptions.getVideoOptions() != null ? new VideoOptionsParcel(nativeAdOptions.getVideoOptions()) : null);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzk.zza(this, parcel, i);
    }
}
