package com.google.android.gms.common.api;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
/* loaded from: classes.dex */
public final class Scope extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<Scope> CREATOR = new zzf();
    final int mVersionCode;
    private final String xY;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Scope(int i, String str) {
        zzaa.zzh(str, "scopeUri must not be null or empty");
        this.mVersionCode = i;
        this.xY = str;
    }

    public Scope(String str) {
        this(1, str);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof Scope) {
            return this.xY.equals(((Scope) obj).xY);
        }
        return false;
    }

    public int hashCode() {
        return this.xY.hashCode();
    }

    public String toString() {
        return this.xY;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzf.zza(this, parcel, i);
    }

    public String zzari() {
        return this.xY;
    }
}
