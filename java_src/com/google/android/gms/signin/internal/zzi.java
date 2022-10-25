package com.google.android.gms.signin.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.ResolveAccountResponse;
import com.google.android.gms.common.internal.safeparcel.zza;
/* loaded from: classes2.dex */
public class zzi implements Parcelable.Creator<SignInResponse> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(SignInResponse signInResponse, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, signInResponse.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) signInResponse.zzawn(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, (Parcelable) signInResponse.zzcdn(), i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzsd */
    public SignInResponse createFromParcel(Parcel parcel) {
        ResolveAccountResponse resolveAccountResponse;
        ConnectionResult connectionResult;
        int i;
        ResolveAccountResponse resolveAccountResponse2 = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i2 = 0;
        ConnectionResult connectionResult2 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    ResolveAccountResponse resolveAccountResponse3 = resolveAccountResponse2;
                    connectionResult = connectionResult2;
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    resolveAccountResponse = resolveAccountResponse3;
                    break;
                case 2:
                    ConnectionResult connectionResult3 = (ConnectionResult) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, ConnectionResult.CREATOR);
                    i = i2;
                    resolveAccountResponse = resolveAccountResponse2;
                    connectionResult = connectionResult3;
                    break;
                case 3:
                    resolveAccountResponse = (ResolveAccountResponse) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, ResolveAccountResponse.CREATOR);
                    connectionResult = connectionResult2;
                    i = i2;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    resolveAccountResponse = resolveAccountResponse2;
                    connectionResult = connectionResult2;
                    i = i2;
                    break;
            }
            i2 = i;
            connectionResult2 = connectionResult;
            resolveAccountResponse2 = resolveAccountResponse;
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new SignInResponse(i2, connectionResult2, resolveAccountResponse2);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzzy */
    public SignInResponse[] newArray(int i) {
        return new SignInResponse[i];
    }
}
