package com.google.firebase.database.connection.idl;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzaja;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class RangeParcelable extends AbstractSafeParcelable {
    public static final Parcelable.Creator<RangeParcelable> CREATOR = new zzk();
    final List<String> bbT;
    final List<String> bbU;
    final int versionCode;

    public RangeParcelable(int i, List<String> list, List<String> list2) {
        this.versionCode = i;
        this.bbT = list;
        this.bbU = list2;
    }

    public static zzaja zza(RangeParcelable rangeParcelable, Object obj) {
        return new zzaja(rangeParcelable.bbT, rangeParcelable.bbU, obj);
    }

    public static RangeParcelable zza(zzaja zzajaVar) {
        return new RangeParcelable(1, zzajaVar.zzctm(), zzajaVar.zzctn());
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzk.zza(this, parcel, i);
    }
}
