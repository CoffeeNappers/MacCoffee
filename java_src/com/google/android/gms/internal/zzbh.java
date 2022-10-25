package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbh extends zzby {
    private static volatile String zzaiw = null;
    private static final Object zzaix = new Object();

    public zzbh(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        this.zzajb.zzdw = "E";
        if (zzaiw == null) {
            synchronized (zzaix) {
                if (zzaiw == null) {
                    zzaiw = (String) this.zzajk.invoke(null, this.zzagd.getContext());
                }
            }
        }
        synchronized (this.zzajb) {
            this.zzajb.zzdw = zzal.zza(zzaiw.getBytes(), true);
        }
    }
}
