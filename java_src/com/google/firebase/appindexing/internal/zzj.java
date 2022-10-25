package com.google.firebase.appindexing.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.firebase.appindexing.internal.Thing;
/* loaded from: classes2.dex */
public class zzj implements Parcelable.Creator<Thing> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(Thing thing, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, thing.zzahu(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) thing.zzcon(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, thing.getId(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, thing.getType(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, thing.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzafe */
    public Thing[] newArray(int i) {
        return new Thing[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwe */
    public Thing createFromParcel(Parcel parcel) {
        String str = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        String str2 = null;
        Thing.Metadata metadata = null;
        Bundle bundle = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    bundle = com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, zzcq);
                    break;
                case 2:
                    metadata = (Thing.Metadata) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, Thing.Metadata.CREATOR);
                    break;
                case 3:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 4:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 1000:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new Thing(i, bundle, metadata, str2, str);
    }
}
