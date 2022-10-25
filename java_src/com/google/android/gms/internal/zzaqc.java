package com.google.android.gms.internal;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Collection;
/* loaded from: classes2.dex */
public final class zzaqc implements zzapl {
    private final zzaps bod;

    /* loaded from: classes2.dex */
    private static final class zza<E> extends zzapk<Collection<E>> {
        private final zzapk<E> bpJ;
        private final zzapx<? extends Collection<E>> bpK;

        public zza(zzaos zzaosVar, Type type, zzapk<E> zzapkVar, zzapx<? extends Collection<E>> zzapxVar) {
            this.bpJ = new zzaqm(zzaosVar, zzapkVar, type);
            this.bpK = zzapxVar;
        }

        @Override // com.google.android.gms.internal.zzapk
        public /* bridge */ /* synthetic */ void zza(zzaqr zzaqrVar, Object obj) throws IOException {
            zza(zzaqrVar, (Collection) ((Collection) obj));
        }

        public void zza(zzaqr zzaqrVar, Collection<E> collection) throws IOException {
            if (collection == null) {
                zzaqrVar.bA();
                return;
            }
            zzaqrVar.bw();
            for (E e : collection) {
                this.bpJ.zza(zzaqrVar, e);
            }
            zzaqrVar.bx();
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzj */
        public Collection<E> zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            Collection<E> bj = this.bpK.bj();
            zzaqpVar.beginArray();
            while (zzaqpVar.hasNext()) {
                bj.add(this.bpJ.zzb(zzaqpVar));
            }
            zzaqpVar.endArray();
            return bj;
        }
    }

    public zzaqc(zzaps zzapsVar) {
        this.bod = zzapsVar;
    }

    @Override // com.google.android.gms.internal.zzapl
    public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
        Type bC = zzaqoVar.bC();
        Class<? super T> bB = zzaqoVar.bB();
        if (!Collection.class.isAssignableFrom(bB)) {
            return null;
        }
        Type zza2 = zzapr.zza(bC, (Class<?>) bB);
        return new zza(zzaosVar, zza2, zzaosVar.zza(zzaqo.zzl(zza2)), this.bod.zzb(zzaqoVar));
    }
}
