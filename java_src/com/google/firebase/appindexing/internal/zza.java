package com.google.firebase.appindexing.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.firebase.appindexing.internal.ActionImpl;
/* loaded from: classes2.dex */
public class zza implements Parcelable.Creator<ActionImpl> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(ActionImpl actionImpl, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, actionImpl.zzcob(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, actionImpl.zzcoc(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, actionImpl.zzcod(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, actionImpl.zzcoe(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, (Parcelable) actionImpl.zzcof(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, actionImpl.zzcog(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, actionImpl.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzaez */
    public ActionImpl[] newArray(int i) {
        return new ActionImpl[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwb */
    public ActionImpl createFromParcel(Parcel parcel) {
        String str = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        ActionImpl.MetadataImpl metadataImpl = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    str5 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 2:
                    str4 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 3:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 4:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 5:
                    metadataImpl = (ActionImpl.MetadataImpl) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, ActionImpl.MetadataImpl.CREATOR);
                    break;
                case 6:
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
        return new ActionImpl(i, str5, str4, str3, str2, metadataImpl, str);
    }
}
