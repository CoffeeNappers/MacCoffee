package com.google.android.gms.ads.internal.purchase;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes.dex */
public class zza implements Parcelable.Creator<GInAppPurchaseManagerInfoParcel> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(GInAppPurchaseManagerInfoParcel gInAppPurchaseManagerInfoParcel, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, gInAppPurchaseManagerInfoParcel.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, gInAppPurchaseManagerInfoParcel.zzro(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, gInAppPurchaseManagerInfoParcel.zzrp(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, gInAppPurchaseManagerInfoParcel.zzrq(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, gInAppPurchaseManagerInfoParcel.zzrn(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzam */
    public GInAppPurchaseManagerInfoParcel[] newArray(int i) {
        return new GInAppPurchaseManagerInfoParcel[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzl */
    public GInAppPurchaseManagerInfoParcel createFromParcel(Parcel parcel) {
        IBinder iBinder = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        IBinder iBinder2 = null;
        IBinder iBinder3 = null;
        IBinder iBinder4 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
                case 3:
                    iBinder4 = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 4:
                    iBinder3 = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 5:
                    iBinder2 = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 6:
                    iBinder = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new GInAppPurchaseManagerInfoParcel(i, iBinder4, iBinder3, iBinder2, iBinder);
    }
}
