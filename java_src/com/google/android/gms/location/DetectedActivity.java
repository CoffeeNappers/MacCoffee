package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzz;
import java.util.Comparator;
/* loaded from: classes2.dex */
public class DetectedActivity extends AbstractSafeParcelable {
    public static final int IN_VEHICLE = 0;
    public static final int ON_BICYCLE = 1;
    public static final int ON_FOOT = 2;
    public static final int RUNNING = 8;
    public static final int STILL = 3;
    public static final int TILTING = 5;
    public static final int UNKNOWN = 4;
    public static final int WALKING = 7;
    int ajO;
    int ajP;
    private final int mVersionCode;
    public static final Comparator<DetectedActivity> ajL = new Comparator<DetectedActivity>() { // from class: com.google.android.gms.location.DetectedActivity.1
        @Override // java.util.Comparator
        /* renamed from: zza */
        public int compare(DetectedActivity detectedActivity, DetectedActivity detectedActivity2) {
            int compareTo = Integer.valueOf(detectedActivity2.getConfidence()).compareTo(Integer.valueOf(detectedActivity.getConfidence()));
            return compareTo == 0 ? Integer.valueOf(detectedActivity.getType()).compareTo(Integer.valueOf(detectedActivity2.getType())) : compareTo;
        }
    };
    public static final int[] ajM = {9, 10};
    public static final int[] ajN = {0, 1, 2, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14};
    public static final Parcelable.Creator<DetectedActivity> CREATOR = new zze();

    public DetectedActivity(int i, int i2) {
        this.mVersionCode = 1;
        this.ajO = i;
        this.ajP = i2;
    }

    public DetectedActivity(int i, int i2, int i3) {
        this.mVersionCode = i;
        this.ajO = i2;
        this.ajP = i3;
    }

    private int zzuj(int i) {
        if (i > 15) {
            return 4;
        }
        return i;
    }

    public static String zzuk(int i) {
        switch (i) {
            case 0:
                return "IN_VEHICLE";
            case 1:
                return "ON_BICYCLE";
            case 2:
                return "ON_FOOT";
            case 3:
                return "STILL";
            case 4:
                return "UNKNOWN";
            case 5:
                return "TILTING";
            case 6:
            default:
                return Integer.toString(i);
            case 7:
                return "WALKING";
            case 8:
                return "RUNNING";
        }
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        DetectedActivity detectedActivity = (DetectedActivity) obj;
        return this.ajO == detectedActivity.ajO && this.ajP == detectedActivity.ajP;
    }

    public int getConfidence() {
        return this.ajP;
    }

    public int getType() {
        return zzuj(this.ajO);
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    public int hashCode() {
        return zzz.hashCode(Integer.valueOf(this.ajO), Integer.valueOf(this.ajP));
    }

    public String toString() {
        String valueOf = String.valueOf(zzuk(getType()));
        return new StringBuilder(String.valueOf(valueOf).length() + 48).append("DetectedActivity [type=").append(valueOf).append(", confidence=").append(this.ajP).append("]").toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zze.zza(this, parcel, i);
    }
}
