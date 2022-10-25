package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public final class PointOfInterest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<PointOfInterest> CREATOR = new zzh();
    public final LatLng latLng;
    private final int mVersionCode;
    public final String name;
    public final String placeId;

    /* JADX INFO: Access modifiers changed from: package-private */
    public PointOfInterest(int i, LatLng latLng, String str, String str2) {
        this.mVersionCode = i;
        this.latLng = latLng;
        this.placeId = str;
        this.name = str2;
    }

    public PointOfInterest(LatLng latLng, String str, String str2) {
        this(1, latLng, str, str2);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzh.zza(this, parcel, i);
    }
}