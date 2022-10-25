package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbq extends zzby {
    private static volatile String zzdb = null;
    private static final Object zzaix = new Object();

    public zzbq(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        this.zzajb.zzdb = "E";
        if (zzdb == null) {
            synchronized (zzaix) {
                if (zzdb == null) {
                    zzdb = (String) this.zzajk.invoke(null, new Object[0]);
                }
            }
        }
        synchronized (this.zzajb) {
            this.zzajb.zzdb = zzdb;
        }
    }
}
