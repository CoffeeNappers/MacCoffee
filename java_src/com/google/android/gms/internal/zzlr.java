package com.google.android.gms.internal;

import java.util.concurrent.TimeUnit;
@zzji
/* loaded from: classes.dex */
public class zzlr<T> implements zzlt<T> {
    private final T zzcyd;
    private final zzlu zzcyg = new zzlu();

    public zzlr(T t) {
        this.zzcyd = t;
        this.zzcyg.zzwt();
    }

    @Override // java.util.concurrent.Future
    public boolean cancel(boolean z) {
        return false;
    }

    @Override // java.util.concurrent.Future
    public T get() {
        return this.zzcyd;
    }

    @Override // java.util.concurrent.Future
    public T get(long j, TimeUnit timeUnit) {
        return this.zzcyd;
    }

    @Override // java.util.concurrent.Future
    public boolean isCancelled() {
        return false;
    }

    @Override // java.util.concurrent.Future
    public boolean isDone() {
        return true;
    }

    @Override // com.google.android.gms.internal.zzlt
    public void zzc(Runnable runnable) {
        this.zzcyg.zzc(runnable);
    }
}
