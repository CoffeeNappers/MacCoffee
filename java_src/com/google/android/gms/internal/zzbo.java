package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbo extends zzby {
    private static volatile Long zzajc = null;
    private static final Object zzaix = new Object();

    public zzbo(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        if (zzajc == null) {
            synchronized (zzaix) {
                if (zzajc == null) {
                    zzajc = (Long) this.zzajk.invoke(null, new Object[0]);
                }
            }
        }
        synchronized (this.zzajb) {
            this.zzajb.zzdu = zzajc;
        }
    }
}
