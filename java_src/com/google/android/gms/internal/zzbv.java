package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbv extends zzby {
    public zzbv(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        this.zzajb.zzek = 2;
        boolean booleanValue = ((Boolean) this.zzajk.invoke(null, this.zzagd.getApplicationContext())).booleanValue();
        synchronized (this.zzajb) {
            if (booleanValue) {
                this.zzajb.zzek = 1;
            } else {
                this.zzajb.zzek = 0;
            }
        }
    }
}
