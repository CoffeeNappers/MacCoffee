package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbt extends zzby {
    public zzbt(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        synchronized (this.zzajb) {
            zzbb zzbbVar = new zzbb((String) this.zzajk.invoke(null, new Object[0]));
            this.zzajb.zzem = zzbbVar.zzahq;
            this.zzajb.zzen = zzbbVar.zzahr;
        }
    }
}
