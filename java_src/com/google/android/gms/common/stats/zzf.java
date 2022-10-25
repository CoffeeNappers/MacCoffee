package com.google.android.gms.common.stats;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class zzf implements Parcelable.Creator<WakeLockEvent> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(WakeLockEvent wakeLockEvent, Parcel parcel, int i) {
        int zzcs = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(parcel);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 1, wakeLockEvent.mVersionCode);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 2, wakeLockEvent.getTimeMillis());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 4, wakeLockEvent.zzaxv(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 5, wakeLockEvent.zzaxy());
        com.google.android.gms.common.internal.safeparcel.zzb.zzb(parcel, 6, wakeLockEvent.zzaxz(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 8, wakeLockEvent.zzayb());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 10, wakeLockEvent.zzaxw(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 11, wakeLockEvent.getEventType());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 12, wakeLockEvent.zzaya(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 13, wakeLockEvent.zzayd(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzc(parcel, 14, wakeLockEvent.zzayc());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 15, wakeLockEvent.zzaye());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 16, wakeLockEvent.zzayf());
        com.google.android.gms.common.internal.safeparcel.zzb.zza(parcel, 17, wakeLockEvent.zzaxx(), false);
        com.google.android.gms.common.internal.safeparcel.zzb.zzaj(parcel, zzcs);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzdc */
    public WakeLockEvent createFromParcel(Parcel parcel) {
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        int i = 0;
        long j = 0;
        int i2 = 0;
        String str = null;
        int i3 = 0;
        ArrayList<String> arrayList = null;
        String str2 = null;
        long j2 = 0;
        int i4 = 0;
        String str3 = null;
        String str4 = null;
        float f = 0.0f;
        long j3 = 0;
        String str5 = null;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 2:
                    j = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 3:
                case 7:
                case 9:
                default:
                    com.google.android.gms.common.internal.safeparcel.zza.zzb(parcel, zzcq);
                    break;
                case 4:
                    str = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 5:
                    i3 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 6:
                    arrayList = com.google.android.gms.common.internal.safeparcel.zza.zzae(parcel, zzcq);
                    break;
                case 8:
                    j2 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 10:
                    str3 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 11:
                    i2 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 12:
                    str2 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 13:
                    str4 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
                case 14:
                    i4 = com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, zzcq);
                    break;
                case 15:
                    f = com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, zzcq);
                    break;
                case 16:
                    j3 = com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, zzcq);
                    break;
                case 17:
                    str5 = com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, zzcq);
                    break;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        return new WakeLockEvent(i, j, i2, str, i3, arrayList, str2, j2, i4, str3, str4, f, j3, str5);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: zzhf */
    public WakeLockEvent[] newArray(int i) {
        return new WakeLockEvent[i];
    }
}
