package com.google.firebase.database.connection.idl;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzair;
import com.google.android.gms.internal.zzaiv;
import java.util.ArrayList;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class CompoundHashParcelable extends AbstractSafeParcelable {
    public static final Parcelable.Creator<CompoundHashParcelable> CREATOR = new zza();
    final List<String> baC;
    final List<String> baD;
    final int versionCode;

    public CompoundHashParcelable(int i, List<String> list, List<String> list2) {
        this.versionCode = i;
        this.baC = list;
        this.baD = list2;
    }

    public static zzair zza(CompoundHashParcelable compoundHashParcelable) {
        ArrayList arrayList = new ArrayList(compoundHashParcelable.baC.size());
        for (String str : compoundHashParcelable.baC) {
            arrayList.add(zzaiv.zzsj(str));
        }
        return new zzair(arrayList, compoundHashParcelable.baD);
    }

    public static CompoundHashParcelable zza(zzair zzairVar) {
        List<List<String>> zzcsf = zzairVar.zzcsf();
        ArrayList arrayList = new ArrayList(zzcsf.size());
        for (List<String> list : zzcsf) {
            arrayList.add(zzaiv.zzas(list));
        }
        return new CompoundHashParcelable(1, arrayList, zzairVar.zzcsg());
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zza.zza(this, parcel, i);
    }
}
