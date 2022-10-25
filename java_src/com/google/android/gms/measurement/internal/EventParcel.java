package com.google.android.gms.measurement.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public final class EventParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<EventParcel> CREATOR = new zzk();
    public final EventParams arJ;
    public final String arK;
    public final long arL;
    public final String name;
    public final int versionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public EventParcel(int i, String str, EventParams eventParams, String str2, long j) {
        this.versionCode = i;
        this.name = str;
        this.arJ = eventParams;
        this.arK = str2;
        this.arL = j;
    }

    public EventParcel(String str, EventParams eventParams, String str2, long j) {
        this.versionCode = 1;
        this.name = str;
        this.arJ = eventParams;
        this.arK = str2;
        this.arL = j;
    }

    public String toString() {
        String str = this.arK;
        String str2 = this.name;
        String valueOf = String.valueOf(this.arJ);
        return new StringBuilder(String.valueOf(str).length() + 21 + String.valueOf(str2).length() + String.valueOf(valueOf).length()).append("origin=").append(str).append(",name=").append(str2).append(",params=").append(valueOf).toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzk.zza(this, parcel, i);
    }
}
