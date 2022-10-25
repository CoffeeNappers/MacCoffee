package com.google.android.gms.internal;

import android.os.DeadObjectException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.internal.zzrr;
import com.google.android.gms.tasks.TaskCompletionSource;
/* loaded from: classes2.dex */
public abstract class zzrw<A extends Api.zzb> {
    private final zzrr<?> Bt;

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract void zza(A a, TaskCompletionSource<Void> taskCompletionSource) throws DeadObjectException;

    public zzrr.zzb<?> zzatz() {
        return this.Bt.zzatz();
    }

    public void zzaua() {
        this.Bt.clear();
    }
}
