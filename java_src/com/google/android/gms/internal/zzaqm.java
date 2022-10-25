package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaqj;
import java.io.IOException;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class zzaqm<T> extends zzapk<T> {
    private final zzapk<T> bol;
    private final zzaos bqh;
    private final Type bqi;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzaqm(zzaos zzaosVar, zzapk<T> zzapkVar, Type type) {
        this.bqh = zzaosVar;
        this.bol = zzapkVar;
        this.bqi = type;
    }

    private Type zzb(Type type, Object obj) {
        return obj != null ? (type == Object.class || (type instanceof TypeVariable) || (type instanceof Class)) ? obj.getClass() : type : type;
    }

    @Override // com.google.android.gms.internal.zzapk
    public void zza(zzaqr zzaqrVar, T t) throws IOException {
        zzapk<T> zzapkVar = this.bol;
        Type zzb = zzb(this.bqi, t);
        if (zzb != this.bqi) {
            zzapkVar = this.bqh.zza(zzaqo.zzl(zzb));
            if ((zzapkVar instanceof zzaqj.zza) && !(this.bol instanceof zzaqj.zza)) {
                zzapkVar = this.bol;
            }
        }
        zzapkVar.zza(zzaqrVar, t);
    }

    @Override // com.google.android.gms.internal.zzapk
    public T zzb(zzaqp zzaqpVar) throws IOException {
        return this.bol.zzb(zzaqpVar);
    }
}
