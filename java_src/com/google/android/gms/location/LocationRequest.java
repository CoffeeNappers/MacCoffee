package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzz;
import com.vkontakte.android.TimeUtils;
/* loaded from: classes2.dex */
public final class LocationRequest extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<LocationRequest> CREATOR = new zzk();
    public static final int PRIORITY_BALANCED_POWER_ACCURACY = 102;
    public static final int PRIORITY_HIGH_ACCURACY = 100;
    public static final int PRIORITY_LOW_POWER = 104;
    public static final int PRIORITY_NO_POWER = 105;
    boolean VT;
    long ajR;
    long akm;
    long akn;
    int ako;
    float akp;
    long akq;
    int mPriority;
    private final int mVersionCode;

    public LocationRequest() {
        this.mVersionCode = 1;
        this.mPriority = 102;
        this.akm = TimeUtils.HOUR;
        this.akn = 600000L;
        this.VT = false;
        this.ajR = Long.MAX_VALUE;
        this.ako = Integer.MAX_VALUE;
        this.akp = 0.0f;
        this.akq = 0L;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationRequest(int i, int i2, long j, long j2, boolean z, long j3, int i3, float f, long j4) {
        this.mVersionCode = i;
        this.mPriority = i2;
        this.akm = j;
        this.akn = j2;
        this.VT = z;
        this.ajR = j3;
        this.ako = i3;
        this.akp = f;
        this.akq = j4;
    }

    public static LocationRequest create() {
        return new LocationRequest();
    }

    private static void zzau(long j) {
        if (j < 0) {
            throw new IllegalArgumentException(new StringBuilder(38).append("invalid interval: ").append(j).toString());
        }
    }

    private static void zze(float f) {
        if (f < 0.0f) {
            throw new IllegalArgumentException(new StringBuilder(37).append("invalid displacement: ").append(f).toString());
        }
    }

    private static void zzuq(int i) {
        switch (i) {
            case 100:
            case 102:
            case 104:
            case 105:
                return;
            case 101:
            case 103:
            default:
                throw new IllegalArgumentException(new StringBuilder(28).append("invalid quality: ").append(i).toString());
        }
    }

    public static String zzur(int i) {
        switch (i) {
            case 100:
                return "PRIORITY_HIGH_ACCURACY";
            case 101:
            case 103:
            default:
                return "???";
            case 102:
                return "PRIORITY_BALANCED_POWER_ACCURACY";
            case 104:
                return "PRIORITY_LOW_POWER";
            case 105:
                return "PRIORITY_NO_POWER";
        }
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LocationRequest)) {
            return false;
        }
        LocationRequest locationRequest = (LocationRequest) obj;
        return this.mPriority == locationRequest.mPriority && this.akm == locationRequest.akm && this.akn == locationRequest.akn && this.VT == locationRequest.VT && this.ajR == locationRequest.ajR && this.ako == locationRequest.ako && this.akp == locationRequest.akp;
    }

    public long getExpirationTime() {
        return this.ajR;
    }

    public long getFastestInterval() {
        return this.akn;
    }

    public long getInterval() {
        return this.akm;
    }

    public long getMaxWaitTime() {
        long j = this.akq;
        return j < this.akm ? this.akm : j;
    }

    public int getNumUpdates() {
        return this.ako;
    }

    public int getPriority() {
        return this.mPriority;
    }

    public float getSmallestDisplacement() {
        return this.akp;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.mVersionCode;
    }

    public int hashCode() {
        return zzz.hashCode(Integer.valueOf(this.mPriority), Long.valueOf(this.akm), Long.valueOf(this.akn), Boolean.valueOf(this.VT), Long.valueOf(this.ajR), Integer.valueOf(this.ako), Float.valueOf(this.akp));
    }

    public LocationRequest setExpirationDuration(long j) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        if (j > Long.MAX_VALUE - elapsedRealtime) {
            this.ajR = Long.MAX_VALUE;
        } else {
            this.ajR = elapsedRealtime + j;
        }
        if (this.ajR < 0) {
            this.ajR = 0L;
        }
        return this;
    }

    public LocationRequest setExpirationTime(long j) {
        this.ajR = j;
        if (this.ajR < 0) {
            this.ajR = 0L;
        }
        return this;
    }

    public LocationRequest setFastestInterval(long j) {
        zzau(j);
        this.VT = true;
        this.akn = j;
        return this;
    }

    public LocationRequest setInterval(long j) {
        zzau(j);
        this.akm = j;
        if (!this.VT) {
            this.akn = (long) (this.akm / 6.0d);
        }
        return this;
    }

    public LocationRequest setMaxWaitTime(long j) {
        zzau(j);
        this.akq = j;
        return this;
    }

    public LocationRequest setNumUpdates(int i) {
        if (i <= 0) {
            throw new IllegalArgumentException(new StringBuilder(31).append("invalid numUpdates: ").append(i).toString());
        }
        this.ako = i;
        return this;
    }

    public LocationRequest setPriority(int i) {
        zzuq(i);
        this.mPriority = i;
        return this;
    }

    public LocationRequest setSmallestDisplacement(float f) {
        zze(f);
        this.akp = f;
        return this;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Request[").append(zzur(this.mPriority));
        if (this.mPriority != 105) {
            sb.append(" requested=");
            sb.append(this.akm).append("ms");
        }
        sb.append(" fastest=");
        sb.append(this.akn).append("ms");
        if (this.akq > this.akm) {
            sb.append(" maxWait=");
            sb.append(this.akq).append("ms");
        }
        if (this.ajR != Long.MAX_VALUE) {
            sb.append(" expireIn=");
            sb.append(this.ajR - SystemClock.elapsedRealtime()).append("ms");
        }
        if (this.ako != Integer.MAX_VALUE) {
            sb.append(" num=").append(this.ako);
        }
        sb.append(']');
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzk.zza(this, parcel, i);
    }
}
