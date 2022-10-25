package com.google.android.gms.internal;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.zzrr;
/* loaded from: classes2.dex */
public abstract class zzqx<L> implements zzrr.zzc<L> {
    private final DataHolder zy;

    protected zzqx(DataHolder dataHolder) {
        this.zy = dataHolder;
    }

    protected abstract void zza(L l, DataHolder dataHolder);

    @Override // com.google.android.gms.internal.zzrr.zzc
    public void zzasm() {
        if (this.zy != null) {
            this.zy.close();
        }
    }

    @Override // com.google.android.gms.internal.zzrr.zzc
    public final void zzt(L l) {
        zza(l, this.zy);
    }
}
