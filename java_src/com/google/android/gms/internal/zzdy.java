package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import java.util.HashMap;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzdy {
    @Nullable
    private final zzdz zzalt;
    private final Map<String, zzdx> zzblw = new HashMap();

    public zzdy(@Nullable zzdz zzdzVar) {
        this.zzalt = zzdzVar;
    }

    public void zza(String str, zzdx zzdxVar) {
        this.zzblw.put(str, zzdxVar);
    }

    public void zza(String str, String str2, long j) {
        zzdv.zza(this.zzalt, this.zzblw.get(str2), j, str);
        this.zzblw.put(str, zzdv.zza(this.zzalt, j));
    }

    @Nullable
    public zzdz zzly() {
        return this.zzalt;
    }
}
