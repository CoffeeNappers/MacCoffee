package com.google.android.gms.appdatasearch;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzz;
/* loaded from: classes2.dex */
public class Feature extends AbstractSafeParcelable {
    public static final Parcelable.Creator<Feature> CREATOR = new zze();
    final Bundle gs;
    public final int id;
    final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Feature(int i, int i2, Bundle bundle) {
        this.mVersionCode = i;
        this.id = i2;
        this.gs = bundle;
    }

    public boolean equals(Object obj) {
        if (obj instanceof Feature) {
            Feature feature = (Feature) obj;
            return zzz.equal(Integer.valueOf(feature.id), Integer.valueOf(this.id)) && zzz.equal(feature.gs, this.gs);
        }
        return false;
    }

    public int hashCode() {
        return zzz.hashCode(Integer.valueOf(this.id), this.gs);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zze.zza(this, parcel, i);
    }
}
