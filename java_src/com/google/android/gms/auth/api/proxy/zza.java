package com.google.android.gms.auth.api.proxy;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zza implements Parcelable.Creator<ProxyGrpcRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(ProxyGrpcRequest proxyGrpcRequest, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 1, proxyGrpcRequest.hostname, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 2, proxyGrpcRequest.port);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, proxyGrpcRequest.timeoutMillis);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, proxyGrpcRequest.body, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, proxyGrpcRequest.method, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1000, proxyGrpcRequest.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzas */
    public ProxyGrpcRequest createFromParcel(Parcel parcel) {
        int i = 0;
        String str = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        long j = 0;
        byte[] bArr = null;
        String str2 = null;
        int i2 = 0;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 2:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 3:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 4:
                    bArr = com.google.android.gms.common.internal.safeparcel.zza.zzt(parcel, zzcq);
                    break;
                case 5:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
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
        return new ProxyGrpcRequest(i2, str2, i, j, bArr, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzdg */
    public ProxyGrpcRequest[] newArray(int i) {
        return new ProxyGrpcRequest[i];
    }
}
