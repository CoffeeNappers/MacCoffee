package com.google.android.gms.analytics.internal;
/* loaded from: classes.dex */
public abstract class zzd extends zzc {
    private boolean cR;

    /* JADX INFO: Access modifiers changed from: protected */
    public zzd(zzf zzfVar) {
        super(zzfVar);
    }

    public void initialize() {
        zzzy();
        this.cR = true;
    }

    public boolean isInitialized() {
        return this.cR;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzacj() {
        if (!isInitialized()) {
            throw new IllegalStateException("Not initialized");
        }
    }

    protected abstract void zzzy();
}
