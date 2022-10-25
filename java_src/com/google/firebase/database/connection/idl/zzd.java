package com.google.firebase.database.connection.idl;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzd implements Parcelable.Creator<HostInfoParcelable> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(HostInfoParcelable hostInfoParcelable, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, hostInfoParcelable.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, hostInfoParcelable.baV, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, hostInfoParcelable.EY, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, hostInfoParcelable.baW);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzafw */
    public HostInfoParcelable[] newArray(int i) {
        return new HostInfoParcelable[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzws */
    public HostInfoParcelable createFromParcel(Parcel parcel) {
        String str = null;
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        String str2 = null;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 4:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new HostInfoParcelable(i, str2, str, z);
    }
}
