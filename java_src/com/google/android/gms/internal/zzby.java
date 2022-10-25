package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public abstract class zzby implements Callable {
    protected final String TAG = getClass().getSimpleName();
    protected final String className;
    protected final zzbc zzagd;
    protected final zzaf.zza zzajb;
    protected final String zzaji;
    protected Method zzajk;
    protected final int zzajo;
    protected final int zzajp;

    public zzby(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2) {
        this.zzagd = zzbcVar;
        this.className = str;
        this.zzaji = str2;
        this.zzajb = zzaVar;
        this.zzajo = i;
        this.zzajp = i2;
    }

    protected abstract void zzdh() throws IllegalAccessException, InvocationTargetException;

    @Override // java.util.concurrent.Callable
    /* renamed from: zzdo */
    public Void call() throws Exception {
        try {
            long nanoTime = System.nanoTime();
            this.zzajk = this.zzagd.zzc(this.className, this.zzaji);
            if (this.zzajk != null) {
                zzdh();
                zzap zzct = this.zzagd.zzct();
                if (zzct != null && this.zzajo != Integer.MIN_VALUE) {
                    zzct.zza(this.zzajp, this.zzajo, (System.nanoTime() - nanoTime) / 1000);
                }
            }
        } catch (IllegalAccessException e) {
        } catch (InvocationTargetException e2) {
        }
        return null;
    }
}
