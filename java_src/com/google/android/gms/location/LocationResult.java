package com.google.android.gms.location;

import android.content.Intent;
import android.location.Location;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public final class LocationResult extends AbstractSafeParcelable implements ReflectedParcelable {
    private final List<Location> aks;
    private final int mVersionCode;
    static final List<Location> akr = Collections.emptyList();
    public static final Parcelable.Creator<LocationResult> CREATOR = new zzl();

    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationResult(int i, List<Location> list) {
        this.mVersionCode = i;
        this.aks = list;
    }

    public static LocationResult create(List<Location> list) {
        if (list == null) {
            list = akr;
        }
        return new LocationResult(2, list);
    }

    public static LocationResult extractResult(Intent intent) {
        if (!hasResult(intent)) {
            return null;
        }
        return (LocationResult) intent.getExtras().getParcelable("com.google.android.gms.location.EXTRA_LOCATION_RESULT");
    }

    public static boolean hasResult(Intent intent) {
        if (intent == null) {
            return false;
        }
        return intent.hasExtra("com.google.android.gms.location.EXTRA_LOCATION_RESULT");
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof LocationResult)) {
            return false;
        }
        LocationResult locationResult = (LocationResult) obj;
        if (locationResult.aks.size() != this.aks.size()) {
            return false;
        }
        Iterator<Location> it = locationResult.aks.iterator();
        Iterator<Location> it2 = this.aks.iterator();
        while (it.hasNext()) {
            if (it2.next().getTime() != it.next().getTime()) {
                return false;
            }
        }
        return true;
    }

    public Location getLastLocation() {
        int size = this.aks.size();
        if (size == 0) {
            return null;
        }
        return this.aks.get(size - 1);
    }

    @NonNull
    public List<Location> getLocations() {
        return this.aks;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.mVersionCode;
    }

    public int hashCode() {
        int i = 17;
        Iterator<Location> it = this.aks.iterator();
        while (true) {
            int i2 = i;
            if (it.hasNext()) {
                long time = it.next().getTime();
                i = ((int) (time ^ (time >>> 32))) + (i2 * 31);
            } else {
                return i2;
            }
        }
    }

    public String toString() {
        String valueOf = String.valueOf(this.aks);
        return new StringBuilder(String.valueOf(valueOf).length() + 27).append("LocationResult[locations: ").append(valueOf).append("]").toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzl.zza(this, parcel, i);
    }
}
