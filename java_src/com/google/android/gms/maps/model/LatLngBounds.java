package com.google.android.gms.maps.model;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import com.google.android.gms.R;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzz;
/* loaded from: classes2.dex */
public final class LatLngBounds extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<LatLngBounds> CREATOR = new zzd();
    private final int mVersionCode;
    public final LatLng northeast;
    public final LatLng southwest;

    /* loaded from: classes2.dex */
    public static final class Builder {
        private double apW = Double.POSITIVE_INFINITY;
        private double apX = Double.NEGATIVE_INFINITY;
        private double apY = Double.NaN;
        private double apZ = Double.NaN;

        private boolean zzi(double d) {
            boolean z = false;
            if (this.apY <= this.apZ) {
                return this.apY <= d && d <= this.apZ;
            }
            if (this.apY <= d || d <= this.apZ) {
                z = true;
            }
            return z;
        }

        public LatLngBounds build() {
            zzaa.zza(!Double.isNaN(this.apY), "no included points");
            return new LatLngBounds(new LatLng(this.apW, this.apY), new LatLng(this.apX, this.apZ));
        }

        public Builder include(LatLng latLng) {
            this.apW = Math.min(this.apW, latLng.latitude);
            this.apX = Math.max(this.apX, latLng.latitude);
            double d = latLng.longitude;
            if (Double.isNaN(this.apY)) {
                this.apY = d;
                this.apZ = d;
            } else if (!zzi(d)) {
                if (LatLngBounds.zzb(this.apY, d) < LatLngBounds.zzc(this.apZ, d)) {
                    this.apY = d;
                } else {
                    this.apZ = d;
                }
            }
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public LatLngBounds(int i, LatLng latLng, LatLng latLng2) {
        zzaa.zzb(latLng, "null southwest");
        zzaa.zzb(latLng2, "null northeast");
        zzaa.zzb(latLng2.latitude >= latLng.latitude, "southern latitude exceeds northern latitude (%s > %s)", Double.valueOf(latLng.latitude), Double.valueOf(latLng2.latitude));
        this.mVersionCode = i;
        this.southwest = latLng;
        this.northeast = latLng2;
    }

    public LatLngBounds(LatLng latLng, LatLng latLng2) {
        this(1, latLng, latLng2);
    }

    public static Builder builder() {
        return new Builder();
    }

    public static LatLngBounds createFromAttributes(Context context, AttributeSet attributeSet) {
        if (context == null || attributeSet == null) {
            return null;
        }
        TypedArray obtainAttributes = context.getResources().obtainAttributes(attributeSet, R.styleable.MapAttrs);
        Float valueOf = obtainAttributes.hasValue(R.styleable.MapAttrs_latLngBoundsSouthWestLatitude) ? Float.valueOf(obtainAttributes.getFloat(R.styleable.MapAttrs_latLngBoundsSouthWestLatitude, 0.0f)) : null;
        Float valueOf2 = obtainAttributes.hasValue(R.styleable.MapAttrs_latLngBoundsSouthWestLongitude) ? Float.valueOf(obtainAttributes.getFloat(R.styleable.MapAttrs_latLngBoundsSouthWestLongitude, 0.0f)) : null;
        Float valueOf3 = obtainAttributes.hasValue(R.styleable.MapAttrs_latLngBoundsNorthEastLatitude) ? Float.valueOf(obtainAttributes.getFloat(R.styleable.MapAttrs_latLngBoundsNorthEastLatitude, 0.0f)) : null;
        Float valueOf4 = obtainAttributes.hasValue(R.styleable.MapAttrs_latLngBoundsNorthEastLongitude) ? Float.valueOf(obtainAttributes.getFloat(R.styleable.MapAttrs_latLngBoundsNorthEastLongitude, 0.0f)) : null;
        if (valueOf != null && valueOf2 != null && valueOf3 != null && valueOf4 != null) {
            return new LatLngBounds(new LatLng(valueOf.floatValue(), valueOf2.floatValue()), new LatLng(valueOf3.floatValue(), valueOf4.floatValue()));
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static double zzb(double d, double d2) {
        return ((d - d2) + 360.0d) % 360.0d;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static double zzc(double d, double d2) {
        return ((d2 - d) + 360.0d) % 360.0d;
    }

    private boolean zzh(double d) {
        return this.southwest.latitude <= d && d <= this.northeast.latitude;
    }

    private boolean zzi(double d) {
        boolean z = false;
        if (this.southwest.longitude <= this.northeast.longitude) {
            return this.southwest.longitude <= d && d <= this.northeast.longitude;
        }
        if (this.southwest.longitude <= d || d <= this.northeast.longitude) {
            z = true;
        }
        return z;
    }

    public boolean contains(LatLng latLng) {
        return zzh(latLng.latitude) && zzi(latLng.longitude);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LatLngBounds)) {
            return false;
        }
        LatLngBounds latLngBounds = (LatLngBounds) obj;
        return this.southwest.equals(latLngBounds.southwest) && this.northeast.equals(latLngBounds.northeast);
    }

    public LatLng getCenter() {
        double d = (this.southwest.latitude + this.northeast.latitude) / 2.0d;
        double d2 = this.northeast.longitude;
        double d3 = this.southwest.longitude;
        return new LatLng(d, d3 <= d2 ? (d2 + d3) / 2.0d : ((d2 + 360.0d) + d3) / 2.0d);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.mVersionCode;
    }

    public int hashCode() {
        return zzz.hashCode(this.southwest, this.northeast);
    }

    public LatLngBounds including(LatLng latLng) {
        double d;
        double min = Math.min(this.southwest.latitude, latLng.latitude);
        double max = Math.max(this.northeast.latitude, latLng.latitude);
        double d2 = this.northeast.longitude;
        double d3 = this.southwest.longitude;
        double d4 = latLng.longitude;
        if (zzi(d4)) {
            d4 = d3;
            d = d2;
        } else if (zzb(d3, d4) < zzc(d2, d4)) {
            d = d2;
        } else {
            d = d4;
            d4 = d3;
        }
        return new LatLngBounds(new LatLng(min, d4), new LatLng(max, d));
    }

    public String toString() {
        return zzz.zzx(this).zzg("southwest", this.southwest).zzg("northeast", this.northeast).toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzd.zza(this, parcel, i);
    }
}