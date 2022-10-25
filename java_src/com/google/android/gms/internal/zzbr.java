package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
/* loaded from: classes2.dex */
public class zzbr extends zzby {
    private List<Long> zzaje;

    public zzbr(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
        this.zzaje = null;
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        this.zzajb.zzdx = -1L;
        this.zzajb.zzdy = -1L;
        if (this.zzaje == null) {
            this.zzaje = (List) this.zzajk.invoke(null, this.zzagd.getContext());
        }
        if (this.zzaje == null || this.zzaje.size() != 2) {
            return;
        }
        synchronized (this.zzajb) {
            this.zzajb.zzdx = Long.valueOf(this.zzaje.get(0).longValue());
            this.zzajb.zzdy = Long.valueOf(this.zzaje.get(1).longValue());
        }
    }
}
