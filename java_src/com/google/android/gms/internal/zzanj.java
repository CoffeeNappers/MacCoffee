package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzanj implements zzanf {
    private final zzanf bkf;
    private long bkg;

    public zzanj(zzanf zzanfVar, long j) {
        this.bkg = 0L;
        this.bkf = zzanfVar;
        this.bkg = j;
    }

    @Override // com.google.android.gms.internal.zzanf
    public long z() {
        return this.bkf.z() + this.bkg;
    }

    public void zzcn(long j) {
        this.bkg = j;
    }
}
