package com.google.firebase.database.connection.idl;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzaiw;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class HostInfoParcelable extends AbstractSafeParcelable {
    public static final Parcelable.Creator<HostInfoParcelable> CREATOR = new zzd();
    final String EY;
    final String baV;
    final boolean baW;
    final int versionCode;

    public HostInfoParcelable(int i, String str, String str2, boolean z) {
        this.versionCode = i;
        this.baV = str;
        this.EY = str2;
        this.baW = z;
    }

    public static zzaiw zza(HostInfoParcelable hostInfoParcelable) {
        return new zzaiw(hostInfoParcelable.baV, hostInfoParcelable.EY, hostInfoParcelable.baW);
    }

    public static HostInfoParcelable zza(zzaiw zzaiwVar) {
        return new HostInfoParcelable(1, zzaiwVar.getHost(), zzaiwVar.getNamespace(), zzaiwVar.isSecure());
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzd.zza(this, parcel, i);
    }
}
