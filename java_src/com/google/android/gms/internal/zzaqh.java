package com.google.android.gms.internal;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Map;
/* loaded from: classes2.dex */
public final class zzaqh implements zzapl {
    private final zzaps bod;
    private final boolean bpS;

    /* loaded from: classes2.dex */
    private final class zza<K, V> extends zzapk<Map<K, V>> {
        private final zzapx<? extends Map<K, V>> bpK;
        private final zzapk<K> bpT;
        private final zzapk<V> bpU;

        public zza(zzaos zzaosVar, Type type, zzapk<K> zzapkVar, Type type2, zzapk<V> zzapkVar2, zzapx<? extends Map<K, V>> zzapxVar) {
            this.bpT = new zzaqm(zzaosVar, zzapkVar, type);
            this.bpU = new zzaqm(zzaosVar, zzapkVar2, type2);
            this.bpK = zzapxVar;
        }

        private String zze(zzaoy zzaoyVar) {
            if (!zzaoyVar.aX()) {
                if (!zzaoyVar.aY()) {
                    throw new AssertionError();
                }
                return "null";
            }
            zzape bb = zzaoyVar.bb();
            if (bb.be()) {
                return String.valueOf(bb.aT());
            }
            if (bb.bd()) {
                return Boolean.toString(bb.getAsBoolean());
            }
            if (!bb.bf()) {
                throw new AssertionError();
            }
            return bb.aU();
        }

        @Override // com.google.android.gms.internal.zzapk
        public /* bridge */ /* synthetic */ void zza(zzaqr zzaqrVar, Object obj) throws IOException {
            zza(zzaqrVar, (Map) ((Map) obj));
        }

        /* JADX WARN: Multi-variable type inference failed */
        public void zza(zzaqr zzaqrVar, Map<K, V> map) throws IOException {
            int i = 0;
            if (map == null) {
                zzaqrVar.bA();
            } else if (!zzaqh.this.bpS) {
                zzaqrVar.by();
                for (Map.Entry<K, V> entry : map.entrySet()) {
                    zzaqrVar.zzus(String.valueOf(entry.getKey()));
                    this.bpU.zza(zzaqrVar, entry.getValue());
                }
                zzaqrVar.bz();
            } else {
                ArrayList arrayList = new ArrayList(map.size());
                ArrayList arrayList2 = new ArrayList(map.size());
                boolean z = false;
                for (Map.Entry<K, V> entry2 : map.entrySet()) {
                    zzaoy zzcn = this.bpT.zzcn(entry2.getKey());
                    arrayList.add(zzcn);
                    arrayList2.add(entry2.getValue());
                    z = (zzcn.aV() || zzcn.aW()) | z;
                }
                if (!z) {
                    zzaqrVar.by();
                    while (i < arrayList.size()) {
                        zzaqrVar.zzus(zze((zzaoy) arrayList.get(i)));
                        this.bpU.zza(zzaqrVar, arrayList2.get(i));
                        i++;
                    }
                    zzaqrVar.bz();
                    return;
                }
                zzaqrVar.bw();
                while (i < arrayList.size()) {
                    zzaqrVar.bw();
                    zzapz.zzb((zzaoy) arrayList.get(i), zzaqrVar);
                    this.bpU.zza(zzaqrVar, arrayList2.get(i));
                    zzaqrVar.bx();
                    i++;
                }
                zzaqrVar.bx();
            }
        }

        @Override // com.google.android.gms.internal.zzapk
        /* renamed from: zzl */
        public Map<K, V> zzb(zzaqp zzaqpVar) throws IOException {
            zzaqq bq = zzaqpVar.bq();
            if (bq == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            Map<K, V> bj = this.bpK.bj();
            if (bq != zzaqq.BEGIN_ARRAY) {
                zzaqpVar.beginObject();
                while (zzaqpVar.hasNext()) {
                    zzapu.bph.zzi(zzaqpVar);
                    K zzb = this.bpT.zzb(zzaqpVar);
                    if (bj.put(zzb, this.bpU.zzb(zzaqpVar)) != null) {
                        String valueOf = String.valueOf(zzb);
                        throw new zzaph(new StringBuilder(String.valueOf(valueOf).length() + 15).append("duplicate key: ").append(valueOf).toString());
                    }
                }
                zzaqpVar.endObject();
                return bj;
            }
            zzaqpVar.beginArray();
            while (zzaqpVar.hasNext()) {
                zzaqpVar.beginArray();
                K zzb2 = this.bpT.zzb(zzaqpVar);
                if (bj.put(zzb2, this.bpU.zzb(zzaqpVar)) != null) {
                    String valueOf2 = String.valueOf(zzb2);
                    throw new zzaph(new StringBuilder(String.valueOf(valueOf2).length() + 15).append("duplicate key: ").append(valueOf2).toString());
                }
                zzaqpVar.endArray();
            }
            zzaqpVar.endArray();
            return bj;
        }
    }

    public zzaqh(zzaps zzapsVar, boolean z) {
        this.bod = zzapsVar;
        this.bpS = z;
    }

    private zzapk<?> zza(zzaos zzaosVar, Type type) {
        return (type == Boolean.TYPE || type == Boolean.class) ? zzaqn.bqo : zzaosVar.zza(zzaqo.zzl(type));
    }

    @Override // com.google.android.gms.internal.zzapl
    public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
        Type bC = zzaqoVar.bC();
        if (!Map.class.isAssignableFrom(zzaqoVar.bB())) {
            return null;
        }
        Type[] zzb = zzapr.zzb(bC, zzapr.zzf(bC));
        return new zza(zzaosVar, zzb[0], zza(zzaosVar, zzb[0]), zzb[1], zzaosVar.zza(zzaqo.zzl(zzb[1])), this.bod.zzb(zzaqoVar));
    }
}
