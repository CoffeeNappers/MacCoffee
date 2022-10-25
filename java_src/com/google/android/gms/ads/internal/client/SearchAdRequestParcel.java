package com.google.android.gms.ads.internal.client;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.ads.search.SearchAdRequest;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public final class SearchAdRequestParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<SearchAdRequestParcel> CREATOR = new zzao();
    public final int backgroundColor;
    public final int versionCode;
    public final int zzbbx;
    public final int zzbby;
    public final int zzbbz;
    public final int zzbca;
    public final int zzbcb;
    public final int zzbcc;
    public final int zzbcd;
    public final String zzbce;
    public final int zzbcf;
    public final String zzbcg;
    public final int zzbch;
    public final int zzbci;
    public final String zzbcj;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SearchAdRequestParcel(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, String str, int i10, String str2, int i11, int i12, String str3) {
        this.versionCode = i;
        this.zzbbx = i2;
        this.backgroundColor = i3;
        this.zzbby = i4;
        this.zzbbz = i5;
        this.zzbca = i6;
        this.zzbcb = i7;
        this.zzbcc = i8;
        this.zzbcd = i9;
        this.zzbce = str;
        this.zzbcf = i10;
        this.zzbcg = str2;
        this.zzbch = i11;
        this.zzbci = i12;
        this.zzbcj = str3;
    }

    public SearchAdRequestParcel(SearchAdRequest searchAdRequest) {
        this.versionCode = 1;
        this.zzbbx = searchAdRequest.getAnchorTextColor();
        this.backgroundColor = searchAdRequest.getBackgroundColor();
        this.zzbby = searchAdRequest.getBackgroundGradientBottom();
        this.zzbbz = searchAdRequest.getBackgroundGradientTop();
        this.zzbca = searchAdRequest.getBorderColor();
        this.zzbcb = searchAdRequest.getBorderThickness();
        this.zzbcc = searchAdRequest.getBorderType();
        this.zzbcd = searchAdRequest.getCallButtonColor();
        this.zzbce = searchAdRequest.getCustomChannels();
        this.zzbcf = searchAdRequest.getDescriptionTextColor();
        this.zzbcg = searchAdRequest.getFontFace();
        this.zzbch = searchAdRequest.getHeaderTextColor();
        this.zzbci = searchAdRequest.getHeaderTextSize();
        this.zzbcj = searchAdRequest.getQuery();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzao.zza(this, parcel, i);
    }
}
