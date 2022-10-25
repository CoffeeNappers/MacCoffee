package com.google.android.gms.internal;

import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes2.dex */
public class zzsw implements ThreadFactory {
    private final String GM;
    private final AtomicInteger GN;
    private final ThreadFactory GO;
    private final int mPriority;

    public zzsw(String str) {
        this(str, 0);
    }

    public zzsw(String str, int i) {
        this.GN = new AtomicInteger();
        this.GO = Executors.defaultThreadFactory();
        this.GM = (String) com.google.android.gms.common.internal.zzaa.zzb(str, "Name must not be null");
        this.mPriority = i;
    }

    @Override // java.util.concurrent.ThreadFactory
    public Thread newThread(Runnable runnable) {
        Thread newThread = this.GO.newThread(new zzsx(runnable, this.mPriority));
        String str = this.GM;
        newThread.setName(new StringBuilder(String.valueOf(str).length() + 13).append(str).append("[").append(this.GN.getAndIncrement()).append("]").toString());
        return newThread;
    }
}
