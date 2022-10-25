package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbp extends zzby {
    private long zzajd;

    public zzbp(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
        this.zzajd = -1L;
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        this.zzajb.zzdl = -1L;
        if (this.zzajd == -1) {
            this.zzajd = ((Integer) this.zzajk.invoke(null, this.zzagd.getContext())).intValue();
        }
        synchronized (this.zzajb) {
            this.zzajb.zzdl = Long.valueOf(this.zzajd);
        }
    }
}
