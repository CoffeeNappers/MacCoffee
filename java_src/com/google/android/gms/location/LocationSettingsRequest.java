package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public final class LocationSettingsRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<LocationSettingsRequest> CREATOR = new zzm();
    private final List<LocationRequest> VO;
    private final boolean akt;
    private final boolean aku;
    private final int mVersionCode;

    /* loaded from: classes2.dex */
    public static final class Builder {
        private final ArrayList<LocationRequest> akv = new ArrayList<>();
        private boolean akt = false;
        private boolean aku = false;

        public Builder addAllLocationRequests(Collection<LocationRequest> collection) {
            this.akv.addAll(collection);
            return this;
        }

        public Builder addLocationRequest(LocationRequest locationRequest) {
            this.akv.add(locationRequest);
            return this;
        }

        public LocationSettingsRequest build() {
            return new LocationSettingsRequest(this.akv, this.akt, this.aku);
        }

        public Builder setAlwaysShow(boolean z) {
            this.akt = z;
            return this;
        }

        public Builder setNeedBle(boolean z) {
            this.aku = z;
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationSettingsRequest(int i, List<LocationRequest> list, boolean z, boolean z2) {
        this.mVersionCode = i;
        this.VO = list;
        this.akt = z;
        this.aku = z2;
    }

    private LocationSettingsRequest(List<LocationRequest> list, boolean z, boolean z2) {
        this(3, list, z, z2);
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzm.zza(this, parcel, i);
    }

    public List<LocationRequest> zzbgh() {
        return Collections.unmodifiableList(this.VO);
    }

    public boolean zzbqc() {
        return this.akt;
    }

    public boolean zzbqd() {
        return this.aku;
    }
}
