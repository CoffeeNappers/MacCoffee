package com.google.android.gms.location;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzz;
/* loaded from: classes2.dex */
public final class LocationAvailability extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<LocationAvailability> CREATOR = new zzj();
    int aki;
    int akj;
    long akk;
    int akl;
    private final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationAvailability(int i, int i2, int i3, int i4, long j) {
        this.mVersionCode = i;
        this.akl = i2;
        this.aki = i3;
        this.akj = i4;
        this.akk = j;
    }

    public static LocationAvailability extractLocationAvailability(Intent intent) {
        if (!hasLocationAvailability(intent)) {
            return null;
        }
        return (LocationAvailability) intent.getExtras().getParcelable("com.google.android.gms.location.EXTRA_LOCATION_AVAILABILITY");
    }

    public static boolean hasLocationAvailability(Intent intent) {
        if (intent == null) {
            return false;
        }
        return intent.hasExtra("com.google.android.gms.location.EXTRA_LOCATION_AVAILABILITY");
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof LocationAvailability)) {
            return false;
        }
        LocationAvailability locationAvailability = (LocationAvailability) obj;
        return this.akl == locationAvailability.akl && this.aki == locationAvailability.aki && this.akj == locationAvailability.akj && this.akk == locationAvailability.akk;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.mVersionCode;
    }

    public int hashCode() {
        return zzz.hashCode(Integer.valueOf(this.akl), Integer.valueOf(this.aki), Integer.valueOf(this.akj), Long.valueOf(this.akk));
    }

    public boolean isLocationAvailable() {
        return this.akl < 1000;
    }

    public String toString() {
        return new StringBuilder(48).append("LocationAvailability[isLocationAvailable: ").append(isLocationAvailable()).append("]").toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzj.zza(this, parcel, i);
    }
}
