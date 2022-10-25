package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public class zzbn implements Callable {
    private final zzbc zzagd;
    private final zzaf.zza zzajb;

    public zzbn(zzbc zzbcVar, zzaf.zza zzaVar) {
        this.zzagd = zzbcVar;
        this.zzajb = zzaVar;
    }

    @Override // java.util.concurrent.Callable
    /* renamed from: zzdo */
    public Void call() throws Exception {
        if (this.zzagd.zzcw() != null) {
            this.zzagd.zzcw().get();
        }
        zzaf.zza zzcv = this.zzagd.zzcv();
        if (zzcv != null) {
            try {
                synchronized (this.zzajb) {
                    zzasa.zza(this.zzajb, zzasa.zzf(zzcv));
                }
                return null;
            } catch (zzarz e) {
                return null;
            }
        }
        return null;
    }
}
