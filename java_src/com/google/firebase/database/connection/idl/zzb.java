package com.google.firebase.database.connection.idl;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzb implements Parcelable.Creator<ConnectionConfig> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(ConnectionConfig connectionConfig, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, connectionConfig.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) connectionConfig.bcl, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 3, connectionConfig.bcm);
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 4, connectionConfig.bcn, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, connectionConfig.baS);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, connectionConfig.bco, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, connectionConfig.baU, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzafv */
    public ConnectionConfig[] newArray(int i) {
        return new ConnectionConfig[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwr */
    public ConnectionConfig createFromParcel(Parcel parcel) {
        boolean z = false;
        String str = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        String str2 = null;
        ArrayList<String> arrayList = null;
        int i = 0;
        HostInfoParcelable hostInfoParcelable = null;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    hostInfoParcelable = (HostInfoParcelable) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, HostInfoParcelable.CREATOR);
                    break;
                case 3:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 4:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 5:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 6:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 7:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new ConnectionConfig(i2, hostInfoParcelable, i, arrayList, z, str2, str);
    }
}
