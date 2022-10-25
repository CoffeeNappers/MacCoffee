package com.google.android.gms.internal;

import java.io.IOException;
/* loaded from: classes2.dex */
public abstract class zzapk<T> {
    public abstract void zza(zzaqr zzaqrVar, T t) throws IOException;

    public abstract T zzb(zzaqp zzaqpVar) throws IOException;

    public final zzaoy zzcn(T t) {
        try {
            zzaqg zzaqgVar = new zzaqg();
            zza(zzaqgVar, t);
            return zzaqgVar.bu();
        } catch (IOException e) {
            throw new zzaoz(e);
        }
    }
}
