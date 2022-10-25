package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
@zzji
/* loaded from: classes.dex */
public class zzlq<T> implements zzlt<T> {
    private boolean zzbww;
    private T zzcyd;
    private Throwable zzcye;
    private boolean zzcyf;
    private final Object zzako = new Object();
    private final zzlu zzcyg = new zzlu();

    private boolean zzws() {
        return this.zzcye != null || this.zzcyf;
    }

    @Override // java.util.concurrent.Future
    public boolean cancel(boolean z) {
        boolean z2 = false;
        if (z) {
            synchronized (this.zzako) {
                if (!zzws()) {
                    this.zzbww = true;
                    this.zzcyf = true;
                    this.zzako.notifyAll();
                    this.zzcyg.zzwt();
                    z2 = true;
                }
            }
        }
        return z2;
    }

    @Override // java.util.concurrent.Future
    public T get() throws CancellationException, ExecutionException, InterruptedException {
        T t;
        synchronized (this.zzako) {
            if (!zzws()) {
                try {
                    this.zzako.wait();
                } catch (InterruptedException e) {
                    throw e;
                }
            }
            if (this.zzcye != null) {
                throw new ExecutionException(this.zzcye);
            }
            if (this.zzbww) {
                throw new CancellationException("CallbackFuture was cancelled.");
            }
            t = this.zzcyd;
        }
        return t;
    }

    @Override // java.util.concurrent.Future
    public T get(long j, TimeUnit timeUnit) throws CancellationException, ExecutionException, InterruptedException, TimeoutException {
        T t;
        synchronized (this.zzako) {
            if (!zzws()) {
                try {
                    long millis = timeUnit.toMillis(j);
                    if (millis != 0) {
                        this.zzako.wait(millis);
                    }
                } catch (InterruptedException e) {
                    throw e;
                }
            }
            if (this.zzcye != null) {
                throw new ExecutionException(this.zzcye);
            }
            if (!this.zzcyf) {
                throw new TimeoutException("CallbackFuture timed out.");
            }
            if (this.zzbww) {
                throw new CancellationException("CallbackFuture was cancelled.");
            }
            t = this.zzcyd;
        }
        return t;
    }

    @Override // java.util.concurrent.Future
    public boolean isCancelled() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzbww;
        }
        return z;
    }

    @Override // java.util.concurrent.Future
    public boolean isDone() {
        boolean zzws;
        synchronized (this.zzako) {
            zzws = zzws();
        }
        return zzws;
    }

    @Override // com.google.android.gms.internal.zzlt
    public void zzc(Runnable runnable) {
        this.zzcyg.zzc(runnable);
    }

    public void zzd(Runnable runnable) {
        this.zzcyg.zzd(runnable);
    }

    public void zze(Throwable th) {
        synchronized (this.zzako) {
            if (this.zzbww) {
                return;
            }
            if (zzws()) {
                com.google.android.gms.ads.internal.zzu.zzgq().zza(new IllegalStateException("Provided CallbackFuture with multiple values."), "CallbackFuture.provideException");
                return;
            }
            this.zzcye = th;
            this.zzako.notifyAll();
            this.zzcyg.zzwt();
        }
    }

    public void zzh(@Nullable T t) {
        synchronized (this.zzako) {
            if (this.zzbww) {
                return;
            }
            if (zzws()) {
                com.google.android.gms.ads.internal.zzu.zzgq().zza(new IllegalStateException("Provided CallbackFuture with multiple values."), "CallbackFuture.provideValue");
                return;
            }
            this.zzcyf = true;
            this.zzcyd = t;
            this.zzako.notifyAll();
            this.zzcyg.zzwt();
        }
    }
}
