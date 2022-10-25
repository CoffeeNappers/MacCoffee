package com.google.android.gms.analytics.internal;

import com.google.android.gms.internal.zzms;
/* loaded from: classes.dex */
public class zzk extends zzd {
    private final zzms bn;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzk(zzf zzfVar) {
        super(zzfVar);
        this.bn = new zzms();
    }

    public zzms zzadg() {
        zzacj();
        return this.bn;
    }

    public void zzzc() {
        zzap zzzh = zzzh();
        String zzaae = zzzh.zzaae();
        if (zzaae != null) {
            this.bn.setAppName(zzaae);
        }
        String zzaaf = zzzh.zzaaf();
        if (zzaaf != null) {
            this.bn.setAppVersion(zzaaf);
        }
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
        zzacc().zzzv().zzb(this.bn);
        zzzc();
    }
}
