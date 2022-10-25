package com.google.android.gms.internal;

import android.os.Handler;
import android.os.Looper;
/* loaded from: classes2.dex */
public class zzaid implements zzajn {
    private final Handler handler = new Handler(Looper.getMainLooper());

    @Override // com.google.android.gms.internal.zzajn
    public void restart() {
    }

    @Override // com.google.android.gms.internal.zzajn
    public void shutdown() {
    }

    @Override // com.google.android.gms.internal.zzajn
    public void zzq(Runnable runnable) {
        this.handler.post(runnable);
    }
}
