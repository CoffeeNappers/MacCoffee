package com.google.android.gms.measurement.internal;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public abstract class zzaa extends zzz {
    private boolean cR;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzaa(zzx zzxVar) {
        super(zzxVar);
        this.aqw.zzb(this);
    }

    public final void initialize() {
        if (this.cR) {
            throw new IllegalStateException("Can't initialize twice");
        }
        zzzy();
        this.aqw.zzbyi();
        this.cR = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isInitialized() {
        return this.cR;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzacj() {
        if (!isInitialized()) {
            throw new IllegalStateException("Not initialized");
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzbyn() {
        return false;
    }

    protected abstract void zzzy();
}
