package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzm implements Parcelable.Creator<StreetViewPanoramaLocation> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(StreetViewPanoramaLocation streetViewPanoramaLocation, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, streetViewPanoramaLocation.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable[]) streetViewPanoramaLocation.links, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, (Parcelable) streetViewPanoramaLocation.position, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, streetViewPanoramaLocation.panoId, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzpr */
    public StreetViewPanoramaLocation createFromParcel(Parcel parcel) {
        String zzq;
        LatLng latLng;
        StreetViewPanoramaLink[] streetViewPanoramaLinkArr;
        int i;
        String str = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i2 = 0;
        LatLng latLng2 = null;
        StreetViewPanoramaLink[] streetViewPanoramaLinkArr2 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    String str2 = str;
                    latLng = latLng2;
                    streetViewPanoramaLinkArr = streetViewPanoramaLinkArr2;
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    zzq = str2;
                    break;
                case 2:
                    i = i2;
                    LatLng latLng3 = latLng2;
                    streetViewPanoramaLinkArr = (StreetViewPanoramaLink[]) com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq, StreetViewPanoramaLink.CREATOR);
                    zzq = str;
                    latLng = latLng3;
                    break;
                case 3:
                    streetViewPanoramaLinkArr = streetViewPanoramaLinkArr2;
                    i = i2;
                    String str3 = str;
                    latLng = (LatLng) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, LatLng.CREATOR);
                    zzq = str3;
                    break;
                case 4:
                    zzq = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    latLng = latLng2;
                    streetViewPanoramaLinkArr = streetViewPanoramaLinkArr2;
                    i = i2;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    zzq = str;
                    latLng = latLng2;
                    streetViewPanoramaLinkArr = streetViewPanoramaLinkArr2;
                    i = i2;
                    break;
            }
            i2 = i;
            streetViewPanoramaLinkArr2 = streetViewPanoramaLinkArr;
            latLng2 = latLng;
            str = zzq;
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new StreetViewPanoramaLocation(i2, streetViewPanoramaLinkArr2, latLng2, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzwv */
    public StreetViewPanoramaLocation[] newArray(int i) {
        return new StreetViewPanoramaLocation[i];
    }
}
