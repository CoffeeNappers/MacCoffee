package com.google.android.gms.internal;

import android.view.View;
import com.google.android.gms.internal.zzaf;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzbw extends zzby {
    private final View zzajh;

    public zzbw(zzbc zzbcVar, String str, String str2, zzaf.zza zzaVar, int i, int i2, View view) {
        super(zzbcVar, str, str2, zzaVar, i, i2);
        this.zzajh = view;
    }

    @Override // com.google.android.gms.internal.zzby
    protected void zzdh() throws IllegalAccessException, InvocationTargetException {
        if (this.zzajh != null) {
            zzbf zzbfVar = new zzbf((String) this.zzajk.invoke(null, this.zzajh));
            synchronized (this.zzajb) {
                this.zzajb.zzeu = new zzaf.zza.zzb();
                this.zzajb.zzeu.zzfn = zzbfVar.zzaiv;
            }
        }
    }
}
