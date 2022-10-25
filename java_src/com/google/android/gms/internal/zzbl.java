package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbl extends zzby {
    private long startTime;

    public zzbl(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, long j, int i, int i2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
        this.startTime = j;
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        long longValue = ((Long) this.zzajk.invoke(null, new Object[0])).longValue();
        synchronized (this.zzajb) {
            this.zzajb.zzfa = Long.valueOf(longValue);
            if (this.startTime != 0) {
                this.zzajb.zzdq = Long.valueOf(longValue - this.startTime);
                this.zzajb.zzdv = Long.valueOf(this.startTime);
            }
        }
    }
}
