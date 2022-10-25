package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbg extends zzby {
    public zzbg(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        synchronized (this.zzajb) {
            this.zzajb.zzdc = -1L;
            this.zzajb.zzdc = (Long) this.zzajk.invoke(null, this.zzagd.getContext());
        }
    }
}
