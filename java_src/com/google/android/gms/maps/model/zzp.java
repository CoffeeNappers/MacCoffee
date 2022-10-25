package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzp implements Parcelable.Creator<TileOverlayOptions> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(TileOverlayOptions tileOverlayOptions, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, tileOverlayOptions.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, tileOverlayOptions.zzbtb(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, tileOverlayOptions.isVisible());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, tileOverlayOptions.getZIndex());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, tileOverlayOptions.getFadeIn());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, tileOverlayOptions.getTransparency());
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzpu */
    public TileOverlayOptions createFromParcel(Parcel parcel) {
        boolean z = false;
        float f = 0.0f;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        IBinder iBinder = null;
        boolean z2 = true;
        float f2 = 0.0f;
        int i = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    iBinder = com.google.android.gms.common.internal.safeparcel.zza.zzr(parcel, zzcq);
                    break;
                case 3:
                    z = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 4:
                    f2 = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 5:
                    z2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, zzcq);
                    break;
                case 6:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new TileOverlayOptions(i, iBinder, z, f2, z2, f);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwy */
    public TileOverlayOptions[] newArray(int i) {
        return new TileOverlayOptions[i];
    }
}
