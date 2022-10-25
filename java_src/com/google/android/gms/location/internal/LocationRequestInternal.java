package com.google.android.gms.location.internal;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzz;
import com.google.android.gms.location.LocationRequest;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public class LocationRequestInternal extends AbstractSafeParcelable {
    LocationRequest VR;
    List<ClientIdentity> ajK;
    boolean ajy;
    boolean ald;
    boolean ale;
    @Nullable
    String mTag;
    private final int mVersionCode;
    static final List<ClientIdentity> alc = Collections.emptyList();
    public static final Parcelable.Creator<LocationRequestInternal> CREATOR = new zzm();

    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationRequestInternal(int i, LocationRequest locationRequest, boolean z, List<ClientIdentity> list, @Nullable String str, boolean z2, boolean z3) {
        this.mVersionCode = i;
        this.VR = locationRequest;
        this.ajy = z;
        this.ajK = list;
        this.mTag = str;
        this.ald = z2;
        this.ale = z3;
    }

    public static LocationRequestInternal zza(@Nullable String str, LocationRequest locationRequest) {
        return new LocationRequestInternal(1, locationRequest, true, alc, str, false, false);
    }

    @Deprecated
    public static LocationRequestInternal zzb(LocationRequest locationRequest) {
        return zza(null, locationRequest);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof LocationRequestInternal)) {
            return false;
        }
        LocationRequestInternal locationRequestInternal = (LocationRequestInternal) obj;
        return zzz.equal(this.VR, locationRequestInternal.VR) && this.ajy == locationRequestInternal.ajy && this.ald == locationRequestInternal.ald && zzz.equal(this.ajK, locationRequestInternal.ajK) && this.ale == locationRequestInternal.ale;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.mVersionCode;
    }

    public int hashCode() {
        return this.VR.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.VR.toString());
        if (this.mTag != null) {
            sb.append(" tag=").append(this.mTag);
        }
        sb.append(" trigger=").append(this.ajy);
        sb.append(" hideAppOps=").append(this.ald);
        sb.append(" clients=").append(this.ajK);
        sb.append(" forceCoarseLocation=").append(this.ale);
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzm.zza(this, parcel, i);
    }
}
