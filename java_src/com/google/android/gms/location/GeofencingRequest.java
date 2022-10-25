package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.location.internal.ParcelableGeofence;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class GeofencingRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<GeofencingRequest> CREATOR = new zzf();
    public static final int INITIAL_TRIGGER_DWELL = 4;
    public static final int INITIAL_TRIGGER_ENTER = 1;
    public static final int INITIAL_TRIGGER_EXIT = 2;
    private final List<ParcelableGeofence> akb;
    private final int akc;
    private final int mVersionCode;

    /* loaded from: classes2.dex */
    public static final class Builder {
        private final List<ParcelableGeofence> akb = new ArrayList();
        private int akc = 5;

        public static int zzum(int i) {
            return i & 7;
        }

        public Builder addGeofence(Geofence geofence) {
            zzaa.zzb(geofence, "geofence can't be null.");
            zzaa.zzb(geofence instanceof ParcelableGeofence, "Geofence must be created using Geofence.Builder.");
            this.akb.add((ParcelableGeofence) geofence);
            return this;
        }

        public Builder addGeofences(List<Geofence> list) {
            if (list != null && !list.isEmpty()) {
                for (Geofence geofence : list) {
                    if (geofence != null) {
                        addGeofence(geofence);
                    }
                }
            }
            return this;
        }

        public GeofencingRequest build() {
            zzaa.zzb(!this.akb.isEmpty(), "No geofence has been added to this request.");
            return new GeofencingRequest(this.akb, this.akc);
        }

        public Builder setInitialTrigger(int i) {
            this.akc = zzum(i);
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GeofencingRequest(int i, List<ParcelableGeofence> list, int i2) {
        this.mVersionCode = i;
        this.akb = list;
        this.akc = i2;
    }

    private GeofencingRequest(List<ParcelableGeofence> list, int i) {
        this(1, list, i);
    }

    public List<Geofence> getGeofences() {
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(this.akb);
        return arrayList;
    }

    public int getInitialTrigger() {
        return this.akc;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzf.zza(this, parcel, i);
    }

    public List<ParcelableGeofence> zzbqa() {
        return this.akb;
    }
}
