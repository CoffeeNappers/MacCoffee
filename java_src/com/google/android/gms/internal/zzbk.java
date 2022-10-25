package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbk extends zzby {
    private static volatile Long zzei = null;
    private static final Object zzaix = new Object();

    public zzbk(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        if (zzei == null) {
            synchronized (zzaix) {
                if (zzei == null) {
                    zzei = (Long) this.zzajk.invoke(null, new Object[0]);
                }
            }
        }
        synchronized (this.zzajb) {
            this.zzajb.zzei = zzei;
        }
    }
}
