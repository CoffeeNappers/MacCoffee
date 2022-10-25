package com.google.android.gms.location;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public final class LocationSettingsStates extends AbstractSafeParcelable {
    public static final Parcelable.Creator<LocationSettingsStates> CREATOR = new zzo();
    private final boolean akA;
    private final boolean akB;
    private final boolean akC;
    private final boolean akx;
    private final boolean aky;
    private final boolean akz;
    private final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationSettingsStates(int i, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6) {
        this.mVersionCode = i;
        this.akx = z;
        this.aky = z2;
        this.akz = z3;
        this.akA = z4;
        this.akB = z5;
        this.akC = z6;
    }

    public static LocationSettingsStates fromIntent(Intent intent) {
        return (LocationSettingsStates) com.google.android.gms.common.internal.safeparcel.zzc.zza(intent, "com.google.android.gms.location.LOCATION_SETTINGS_STATES", CREATOR);
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    public boolean isBlePresent() {
        return this.akC;
    }

    public boolean isBleUsable() {
        return this.akz;
    }

    public boolean isGpsPresent() {
        return this.akA;
    }

    public boolean isGpsUsable() {
        return this.akx;
    }

    public boolean isLocationPresent() {
        return this.akA || this.akB;
    }

    public boolean isLocationUsable() {
        return this.akx || this.aky;
    }

    public boolean isNetworkLocationPresent() {
        return this.akB;
    }

    public boolean isNetworkLocationUsable() {
        return this.aky;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzo.zza(this, parcel, i);
    }
}
