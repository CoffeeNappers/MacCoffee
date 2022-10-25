package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbs extends zzby {
    private final StackTraceElement[] zzajf;

    public zzbs(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2, StackTraceElement[] stackTraceElementArr) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
        this.zzajf = stackTraceElementArr;
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        if (this.zzajf != null) {
            zzba zzbaVar = new zzba((String) this.zzajk.invoke(null, this.zzajf));
            synchronized (this.zzajb) {
                this.zzajb.zzej = zzbaVar.zzahn;
                if (zzbaVar.zzaho.booleanValue()) {
                    this.zzajb.zzer = Integer.valueOf(zzbaVar.zzahp.booleanValue() ? 0 : 1);
                }
            }
        }
    }
}
