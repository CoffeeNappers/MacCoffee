package com.google.android.gms.internal;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes2.dex */
public abstract class zzrg {
    private static final ExecutorService AF = Executors.newFixedThreadPool(2, new zzsw("GAC_Executor"));

    public static ExecutorService zzatf() {
        return AF;
    }
}
