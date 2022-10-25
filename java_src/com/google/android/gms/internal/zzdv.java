package com.google.android.gms.internal;

import android.support.annotation.Nullable;
@zzji
/* loaded from: classes.dex */
public class zzdv {
    @Nullable
    public static zzdx zza(@Nullable zzdz zzdzVar, long j) {
        if (zzdzVar == null) {
            return null;
        }
        return zzdzVar.zzc(j);
    }

    public static boolean zza(@Nullable zzdz zzdzVar, @Nullable zzdx zzdxVar, long j, String... strArr) {
        if (zzdzVar == null || zzdxVar == null) {
            return false;
        }
        return zzdzVar.zza(zzdxVar, j, strArr);
    }

    public static boolean zza(@Nullable zzdz zzdzVar, @Nullable zzdx zzdxVar, String... strArr) {
        if (zzdzVar == null || zzdxVar == null) {
            return false;
        }
        return zzdzVar.zza(zzdxVar, strArr);
    }

    @Nullable
    public static zzdx zzb(@Nullable zzdz zzdzVar) {
        if (zzdzVar == null) {
            return null;
        }
        return zzdzVar.zzlz();
    }
}
