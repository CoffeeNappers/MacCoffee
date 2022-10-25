package com.google.android.gms.location.places;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
/* loaded from: classes2.dex */
public class zzi implements Parcelable.Creator<PlaceReport> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(PlaceReport placeReport, Parcel parcel, int i) {
        int zzcs = zzb.zzcs(parcel);
        zzb.zzc(parcel, 1, placeReport.mVersionCode);
        zzb.zza(parcel, 2, placeReport.getPlaceId(), false);
        zzb.zza(parcel, 3, placeReport.getTag(), false);
        zzb.zza(parcel, 4, placeReport.getSource(), false);
        zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzon */
    public PlaceReport createFromParcel(Parcel parcel) {
        String str = null;
        int zzcr = zza.zzcr(parcel);
        int i = 0;
        String str2 = null;
        String str3 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = zza.zzcq(parcel);
            switch (zza.zzgu(zzcq)) {
                case 1:
                    i = zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str3 = zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    str2 = zza.zzq(parcel, zzcq);
                    break;
                case 4:
                    str = zza.zzq(parcel, zzcq);
                    break;
                default:
                    zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new PlaceReport(i, str3, str2, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzvp */
    public PlaceReport[] newArray(int i) {
        return new PlaceReport[i];
    }
}
