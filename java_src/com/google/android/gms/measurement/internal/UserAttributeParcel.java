package com.google.android.gms.measurement.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class UserAttributeParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<UserAttributeParcel> CREATOR = new zzaj();
    public final String Fe;
    public final String arK;
    public final long avT;
    public final Long avU;
    public final Float avV;
    public final Double avW;
    public final String name;
    public final int versionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public UserAttributeParcel(int i, String str, long j, Long l, Float f, String str2, String str3, Double d) {
        Double d2 = null;
        this.versionCode = i;
        this.name = str;
        this.avT = j;
        this.avU = l;
        this.avV = null;
        if (i == 1) {
            this.avW = f != null ? Double.valueOf(f.doubleValue()) : d2;
        } else {
            this.avW = d;
        }
        this.Fe = str2;
        this.arK = str3;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public UserAttributeParcel(zzak zzakVar) {
        this(zzakVar.mName, zzakVar.avX, zzakVar.zzcyd, zzakVar.zzctj);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public UserAttributeParcel(String str, long j, Object obj, String str2) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        this.versionCode = 2;
        this.name = str;
        this.avT = j;
        this.arK = str2;
        if (obj == null) {
            this.avU = null;
            this.avV = null;
            this.avW = null;
            this.Fe = null;
        } else if (obj instanceof Long) {
            this.avU = (Long) obj;
            this.avV = null;
            this.avW = null;
            this.Fe = null;
        } else if (obj instanceof String) {
            this.avU = null;
            this.avV = null;
            this.avW = null;
            this.Fe = (String) obj;
        } else if (!(obj instanceof Double)) {
            throw new IllegalArgumentException("User attribute given of un-supported type");
        } else {
            this.avU = null;
            this.avV = null;
            this.avW = (Double) obj;
            this.Fe = null;
        }
    }

    public Object getValue() {
        if (this.avU != null) {
            return this.avU;
        }
        if (this.avW != null) {
            return this.avW;
        }
        if (this.Fe == null) {
            return null;
        }
        return this.Fe;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzaj.zza(this, parcel, i);
    }
}
