package com.google.android.gms.clearcut;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.playlog.internal.PlayLoggerContext;
/* loaded from: classes2.dex */
public class zzc implements Parcelable.Creator<LogEventParcelable> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(LogEventParcelable logEventParcelable, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, logEventParcelable.versionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, (Parcelable) logEventParcelable.wv, i, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 3, logEventParcelable.ww, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, logEventParcelable.wx, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 5, logEventParcelable.wy, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 6, logEventParcelable.wz, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 7, logEventParcelable.wA, false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, logEventParcelable.wB);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzcc */
    public LogEventParcelable createFromParcel(Parcel parcel) {
        byte[][] bArr = null;
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        boolean z = true;
        int[] iArr = null;
        String[] strArr = null;
        int[] iArr2 = null;
        byte[] bArr2 = null;
        PlayLoggerContext playLoggerContext = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    playLoggerContext = (PlayLoggerContext) com.google.android.gms.common.internal.safeparcel.zza.zza(parcel, zzcq, PlayLoggerContext.CREATOR);
                    break;
                case 3:
                    bArr2 = com.google.android.gms.common.internal.safeparcel.zza.zzt(parcel, zzcq);
                    break;
                case 4:
                    iArr2 = com.google.android.gms.common.internal.safeparcel.zza.zzw(parcel, zzcq);
                    break;
                case 5:
                    strArr = com.google.android.gms.common.internal.safeparcel.zza.zzac(parcel, zzcq);
                    break;
                case 6:
                    iArr = com.google.android.gms.common.internal.safeparcel.zza.zzw(parcel, zzcq);
                    break;
                case 7:
                    bArr = com.google.android.gms.common.internal.safeparcel.zza.zzu(parcel, zzcq);
                    break;
                case 8:
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
        return new LogEventParcelable(i, playLoggerContext, bArr2, iArr2, strArr, iArr, bArr, z);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzfn */
    public LogEventParcelable[] newArray(int i) {
        return new LogEventParcelable[i];
    }
}
