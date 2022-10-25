package com.google.android.gms.internal;

import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
class zzakd implements zzajn {
    private final ThreadPoolExecutor bfI;

    public zzakd(final ThreadFactory threadFactory, final zzakc zzakcVar) {
        this.bfI = new ThreadPoolExecutor(1, 1, 3L, TimeUnit.SECONDS, new LinkedBlockingQueue(), new ThreadFactory() { // from class: com.google.android.gms.internal.zzakd.1
            @Override // java.util.concurrent.ThreadFactory
            public Thread newThread(Runnable runnable) {
                Thread newThread = threadFactory.newThread(runnable);
                zzakcVar.zza(newThread, "FirebaseDatabaseEventTarget");
                zzakcVar.zza(newThread, true);
                return newThread;
            }
        });
    }

    @Override // com.google.android.gms.internal.zzajn
    public void restart() {
        this.bfI.setCorePoolSize(1);
    }

    @Override // com.google.android.gms.internal.zzajn
    public void shutdown() {
        this.bfI.setCorePoolSize(0);
    }

    @Override // com.google.android.gms.internal.zzajn
    public void zzq(Runnable runnable) {
        this.bfI.execute(runnable);
    }
}
