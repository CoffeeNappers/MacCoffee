package com.google.android.gms.analytics.internal;

import com.google.android.gms.internal.zzmx;
/* loaded from: classes2.dex */
public class zzu extends zzd {
    /* JADX INFO: Access modifiers changed from: package-private */
    public zzu(zzf zzfVar) {
        super(zzfVar);
    }

    public zzmx zzafl() {
        zzacj();
        return zzacc().zzzw();
    }

    public String zzafm() {
        zzacj();
        zzmx zzafl = zzafl();
        int zzaar = zzafl.zzaar();
        return new StringBuilder(23).append(zzaar).append("x").append(zzafl.zzaas()).toString();
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
    }
}
