package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbj extends zzby {
    public zzbj(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        this.zzajb.zzde = -1L;
        this.zzajb.zzdf = -1L;
        int[] iArr = (int[]) this.zzajk.invoke(null, this.zzagd.getContext());
        synchronized (this.zzajb) {
            this.zzajb.zzde = Long.valueOf(iArr[0]);
            this.zzajb.zzdf = Long.valueOf(iArr[1]);
        }
    }
}
