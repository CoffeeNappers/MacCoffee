package com.google.android.gms.location.internal;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.location.Geofence;
import java.util.Locale;
/* loaded from: classes2.dex */
public class ParcelableGeofence extends AbstractSafeParcelable implements Geofence {
    public static final Parcelable.Creator<ParcelableGeofence> CREATOR = new zzo();
    private final int ajQ;
    private final short ajS;
    private final double ajT;
    private final double ajU;
    private final float ajV;
    private final int ajW;
    private final int ajX;
    private final long alk;
    private final int mVersionCode;
    private final String zzcec;

    public ParcelableGeofence(int i, String str, int i2, short s, double d, double d2, float f, long j, int i3, int i4) {
        zzkz(str);
        zzf(f);
        zza(d, d2);
        int zzve = zzve(i2);
        this.mVersionCode = i;
        this.ajS = s;
        this.zzcec = str;
        this.ajT = d;
        this.ajU = d2;
        this.ajV = f;
        this.alk = j;
        this.ajQ = zzve;
        this.ajW = i3;
        this.ajX = i4;
    }

    public ParcelableGeofence(String str, int i, short s, double d, double d2, float f, long j, int i2, int i3) {
        this(1, str, i, s, d, d2, f, j, i2, i3);
    }

    private static void zza(double d, double d2) {
        if (d > 90.0d || d < -90.0d) {
            throw new IllegalArgumentException(new StringBuilder(42).append("invalid latitude: ").append(d).toString());
        }
        if (d2 <= 180.0d && d2 >= -180.0d) {
            return;
        }
        throw new IllegalArgumentException(new StringBuilder(43).append("invalid longitude: ").append(d2).toString());
    }

    private static void zzf(float f) {
        if (f <= 0.0f) {
            throw new IllegalArgumentException(new StringBuilder(31).append("invalid radius: ").append(f).toString());
        }
    }

    private static void zzkz(String str) {
        if (str == null || str.length() > 100) {
            String valueOf = String.valueOf(str);
            throw new IllegalArgumentException(valueOf.length() != 0 ? "requestId is null or too long: ".concat(valueOf) : new String("requestId is null or too long: "));
        }
    }

    private static int zzve(int i) {
        int i2 = i & 7;
        if (i2 == 0) {
            throw new IllegalArgumentException(new StringBuilder(46).append("No supported transition specified: ").append(i).toString());
        }
        return i2;
    }

    @SuppressLint({"DefaultLocale"})
    private static String zzvf(int i) {
        switch (i) {
            case 1:
                return "CIRCLE";
            default:
                return null;
        }
    }

    public static ParcelableGeofence zzw(byte[] bArr) {
        Parcel obtain = Parcel.obtain();
        obtain.unmarshall(bArr, 0, bArr.length);
        obtain.setDataPosition(0);
        ParcelableGeofence createFromParcel = CREATOR.createFromParcel(obtain);
        obtain.recycle();
        return createFromParcel;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && (obj instanceof ParcelableGeofence)) {
            ParcelableGeofence parcelableGeofence = (ParcelableGeofence) obj;
            return this.ajV == parcelableGeofence.ajV && this.ajT == parcelableGeofence.ajT && this.ajU == parcelableGeofence.ajU && this.ajS == parcelableGeofence.ajS;
        }
        return false;
    }

    public long getExpirationTime() {
        return this.alk;
    }

    public double getLatitude() {
        return this.ajT;
    }

    public double getLongitude() {
        return this.ajU;
    }

    public float getRadius() {
        return this.ajV;
    }

    @Override // com.google.android.gms.location.Geofence
    public String getRequestId() {
        return this.zzcec;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    public int hashCode() {
        long doubleToLongBits = Double.doubleToLongBits(this.ajT);
        long doubleToLongBits2 = Double.doubleToLongBits(this.ajU);
        return ((((((((((int) (doubleToLongBits ^ (doubleToLongBits >>> 32))) + 31) * 31) + ((int) (doubleToLongBits2 ^ (doubleToLongBits2 >>> 32)))) * 31) + Float.floatToIntBits(this.ajV)) * 31) + this.ajS) * 31) + this.ajQ;
    }

    public String toString() {
        return String.format(Locale.US, "Geofence[%s id:%s transitions:%d %.6f, %.6f %.0fm, resp=%ds, dwell=%dms, @%d]", zzvf(this.ajS), this.zzcec, Integer.valueOf(this.ajQ), Double.valueOf(this.ajT), Double.valueOf(this.ajU), Float.valueOf(this.ajV), Integer.valueOf(this.ajW / 1000), Integer.valueOf(this.ajX), Long.valueOf(this.alk));
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzo.zza(this, parcel, i);
    }

    public short zzbql() {
        return this.ajS;
    }

    public int zzbqm() {
        return this.ajQ;
    }

    public int zzbqn() {
        return this.ajW;
    }

    public int zzbqo() {
        return this.ajX;
    }
}
