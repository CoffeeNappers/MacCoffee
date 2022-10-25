package com.google.firebase.appindexing.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.firebase.appindexing.internal.ActionImpl;
/* loaded from: classes2.dex */
public class zzi implements Parcelable.Creator<ActionImpl.MetadataImpl> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(ActionImpl.MetadataImpl metadataImpl, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, metadataImpl.zzcoh());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, metadataImpl.zzcoi());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, metadataImpl.zzcoj(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, metadataImpl.getAccountName(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, metadataImpl.zzcok(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, metadataImpl.zzcol());
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, metadataImpl.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzafd */
    public ActionImpl.MetadataImpl[] newArray(int i) {
        return new ActionImpl.MetadataImpl[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwd */
    public ActionImpl.MetadataImpl createFromParcel(Parcel parcel) {
        byte[] bArr = null;
        boolean z = false;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        String str = null;
        String str2 = null;
        boolean z2 = false;
        int i = 0;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 3:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 4:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 5:
                    bArr = com.google.android.gms.common.internal.safeparcel.zza.zzt(parcel, zzcq);
                    break;
                case 6:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 1000:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new ActionImpl.MetadataImpl(i2, i, z2, str2, str, bArr, z);
    }
}
