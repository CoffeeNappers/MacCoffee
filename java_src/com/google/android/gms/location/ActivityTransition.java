package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzz;
/* loaded from: classes2.dex */
public class ActivityTransition extends AbstractSafeParcelable {
    public static final Parcelable.Creator<ActivityTransition> CREATOR = new zzc();
    private final int QM;
    private final int ajH;
    private final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ActivityTransition(int i, int i2, int i3) {
        this.mVersionCode = i;
        this.QM = i2;
        this.ajH = i3;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ActivityTransition)) {
            return false;
        }
        ActivityTransition activityTransition = (ActivityTransition) obj;
        return this.QM == activityTransition.QM && this.ajH == activityTransition.ajH;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    public int hashCode() {
        return zzz.hashCode(Integer.valueOf(this.QM), Integer.valueOf(this.ajH));
    }

    public String toString() {
        int i = this.QM;
        return new StringBuilder(75).append("ActivityTransition [mActivityType=").append(i).append(", mTransitionType=").append(this.ajH).append("]").toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzc.zza(this, parcel, i);
    }

    public int zzbdw() {
        return this.QM;
    }

    public int zzbpx() {
        return this.ajH;
    }
}
