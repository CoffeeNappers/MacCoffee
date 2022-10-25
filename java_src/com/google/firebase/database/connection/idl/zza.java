package com.google.firebase.database.connection.idl;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zza implements Parcelable.Creator<CompoundHashParcelable> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(CompoundHashParcelable compoundHashParcelable, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, compoundHashParcelable.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 2, compoundHashParcelable.baC, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 3, compoundHashParcelable.baD, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzafu */
    public CompoundHashParcelable[] newArray(int i) {
        return new CompoundHashParcelable[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwq */
    public CompoundHashParcelable createFromParcel(Parcel parcel) {
        ArrayList<String> arrayList = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        ArrayList<String> arrayList2 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    arrayList2 = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 3:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new CompoundHashParcelable(i, arrayList2, arrayList);
    }
}
