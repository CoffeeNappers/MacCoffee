package com.google.android.gms.internal;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.ConditionVariable;
import android.support.annotation.Nullable;
import java.util.concurrent.Callable;
@zzji
/* loaded from: classes.dex */
public class zzdq {
    private final Object zzako = new Object();
    private final ConditionVariable zzbcs = new ConditionVariable();
    private volatile boolean zzaoz = false;
    @Nullable
    private SharedPreferences zzbct = null;

    public void initialize(Context context) {
        if (this.zzaoz) {
            return;
        }
        synchronized (this.zzako) {
            if (!this.zzaoz) {
                Context remoteContext = com.google.android.gms.common.zze.getRemoteContext(context);
                if (remoteContext == null) {
                    this.zzbcs.open();
                } else {
                    this.zzbct = com.google.android.gms.ads.internal.zzu.zzgw().zzm(remoteContext);
                    this.zzaoz = true;
                    this.zzbcs.open();
                }
            }
        }
    }

    public <T> T zzd(final zzdn<T> zzdnVar) {
        if (!this.zzbcs.block(5000L)) {
            throw new IllegalStateException("Flags.initialize() was not called!");
        }
        if (!this.zzaoz) {
            synchronized (this.zzako) {
                if (!this.zzaoz) {
                    return zzdnVar.zzlp();
                }
            }
        }
        return (T) zzlo.zzb(new Callable<T>() { // from class: com.google.android.gms.internal.zzdq.1
            /* JADX WARN: Type inference failed for: r0v1, types: [T, java.lang.Object] */
            @Override // java.util.concurrent.Callable
            public T call() {
                return zzdnVar.zza(zzdq.this.zzbct);
            }
        });
    }
}
