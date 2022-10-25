package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public final class LocationSettingsResult extends AbstractSafeParcelable implements Result {
    public static final Parcelable.Creator<LocationSettingsResult> CREATOR = new zzn();
    private final LocationSettingsStates akw;
    private final Status hv;
    private final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationSettingsResult(int i, Status status, LocationSettingsStates locationSettingsStates) {
        this.mVersionCode = i;
        this.hv = status;
        this.akw = locationSettingsStates;
    }

    public LocationSettingsResult(Status status) {
        this(1, status, null);
    }

    public LocationSettingsStates getLocationSettingsStates() {
        return this.akw;
    }

    @Override // com.google.android.gms.common.api.Result
    public Status getStatus() {
        return this.hv;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzn.zza(this, parcel, i);
    }
}
