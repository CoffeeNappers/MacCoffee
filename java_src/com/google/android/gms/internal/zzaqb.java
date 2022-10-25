package com.google.android.gms.internal;

import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public final class zzaqb<E> extends zzapk<Object> {
    public static final zzapl bpG = new zzapl() { // from class: com.google.android.gms.internal.zzaqb.1
        @Override // com.google.android.gms.internal.zzapl
        public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
            Type bC = zzaqoVar.bC();
            if ((bC instanceof GenericArrayType) || ((bC instanceof Class) && ((Class) bC).isArray())) {
                Type zzh = zzapr.zzh(bC);
                return new zzaqb(zzaosVar, zzaosVar.zza(zzaqo.zzl(zzh)), zzapr.zzf(zzh));
            }
            return null;
        }
    };
    private final Class<E> bpH;
    private final zzapk<E> bpI;

    public zzaqb(zzaos zzaosVar, zzapk<E> zzapkVar, Class<E> cls) {
        this.bpI = new zzaqm(zzaosVar, zzapkVar, cls);
        this.bpH = cls;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.android.gms.internal.zzapk
    public void zza(zzaqr zzaqrVar, Object obj) throws IOException {
        if (obj == null) {
            zzaqrVar.bA();
            return;
        }
        zzaqrVar.bw();
        int length = Array.getLength(obj);
        for (int i = 0; i < length; i++) {
            this.bpI.zza(zzaqrVar, Array.get(obj, i));
        }
        zzaqrVar.bx();
    }

    @Override // com.google.android.gms.internal.zzapk
    public Object zzb(zzaqp zzaqpVar) throws IOException {
        if (zzaqpVar.bq() == zzaqq.NULL) {
            zzaqpVar.nextNull();
            return null;
        }
        ArrayList arrayList = new ArrayList();
        zzaqpVar.beginArray();
        while (zzaqpVar.hasNext()) {
            arrayList.add(this.bpI.zzb(zzaqpVar));
        }
        zzaqpVar.endArray();
        Object newInstance = Array.newInstance((Class<?>) this.bpH, arrayList.size());
        for (int i = 0; i < arrayList.size(); i++) {
            Array.set(newInstance, i, arrayList.get(i));
        }
        return newInstance;
    }
}
