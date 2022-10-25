package com.google.android.gms.internal;

import android.support.annotation.Nullable;
@zzji
/* loaded from: classes.dex */
public class zzdx {
    private final long zzblt;
    @Nullable
    private final String zzblu;
    @Nullable
    private final zzdx zzblv;

    public zzdx(long j, @Nullable String str, @Nullable zzdx zzdxVar) {
        this.zzblt = j;
        this.zzblu = str;
        this.zzblv = zzdxVar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getTime() {
        return this.zzblt;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzlw() {
        return this.zzblu;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Nullable
    public zzdx zzlx() {
        return this.zzblv;
    }
}
