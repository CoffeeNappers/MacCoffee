package com.google.android.gms.internal;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Type;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public final class zzaqj implements zzapl {
    private final zzaps bod;
    private final zzapt bom;
    private final zzaor boo;

    /* loaded from: classes2.dex */
    public static final class zza<T> extends zzapk<T> {
        private final zzapx<T> bpK;
        private final Map<String, zzb> bqd;

        private zza(zzapx<T> zzapxVar, Map<String, zzb> map) {
            this.bpK = zzapxVar;
            this.bqd = map;
        }

        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, T t) throws IOException {
            if (t == null) {
                zzaqrVar.bA();
                return;
            }
            zzaqrVar.by();
            try {
                for (zzb zzbVar : this.bqd.values()) {
                    if (zzbVar.zzcs(t)) {
                        zzaqrVar.zzus(zzbVar.name);
                        zzbVar.zza(zzaqrVar, t);
                    }
                }
                zzaqrVar.bz();
            } catch (IllegalAccessException e) {
                throw new AssertionError();
            }
        }

        @Override // com.google.android.gms.internal.zzapk
        public T zzb(zzaqp zzaqpVar) throws IOException {
            if (zzaqpVar.bq() == zzaqq.NULL) {
                zzaqpVar.nextNull();
                return null;
            }
            T bj = this.bpK.bj();
            try {
                zzaqpVar.beginObject();
                while (zzaqpVar.hasNext()) {
                    zzb zzbVar = this.bqd.get(zzaqpVar.nextName());
                    if (zzbVar == null || !zzbVar.bqf) {
                        zzaqpVar.skipValue();
                    } else {
                        zzbVar.zza(zzaqpVar, bj);
                    }
                }
                zzaqpVar.endObject();
                return bj;
            } catch (IllegalAccessException e) {
                throw new AssertionError(e);
            } catch (IllegalStateException e2) {
                throw new zzaph(e2);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static abstract class zzb {
        final boolean bqe;
        final boolean bqf;
        final String name;

        protected zzb(String str, boolean z, boolean z2) {
            this.name = str;
            this.bqe = z;
            this.bqf = z2;
        }

        abstract void zza(zzaqp zzaqpVar, Object obj) throws IOException, IllegalAccessException;

        abstract void zza(zzaqr zzaqrVar, Object obj) throws IOException, IllegalAccessException;

        abstract boolean zzcs(Object obj) throws IOException, IllegalAccessException;
    }

    public zzaqj(zzaps zzapsVar, zzaor zzaorVar, zzapt zzaptVar) {
        this.bod = zzapsVar;
        this.boo = zzaorVar;
        this.bom = zzaptVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public zzapk<?> zza(zzaos zzaosVar, Field field, zzaqo<?> zzaqoVar) {
        zzapk<?> zza2;
        zzapm zzapmVar = (zzapm) field.getAnnotation(zzapm.class);
        return (zzapmVar == null || (zza2 = zzaqe.zza(this.bod, zzaosVar, zzaqoVar, zzapmVar)) == null) ? zzaosVar.zza(zzaqoVar) : zza2;
    }

    private zzb zza(final zzaos zzaosVar, final Field field, String str, final zzaqo<?> zzaqoVar, boolean z, boolean z2) {
        final boolean zzk = zzapy.zzk(zzaqoVar.bB());
        return new zzb(str, z, z2) { // from class: com.google.android.gms.internal.zzaqj.1
            final zzapk<?> bpX;

            {
                this.bpX = zzaqj.this.zza(zzaosVar, field, zzaqoVar);
            }

            @Override // com.google.android.gms.internal.zzaqj.zzb
            void zza(zzaqp zzaqpVar, Object obj) throws IOException, IllegalAccessException {
                Object zzb2 = this.bpX.zzb(zzaqpVar);
                if (zzb2 != null || !zzk) {
                    field.set(obj, zzb2);
                }
            }

            @Override // com.google.android.gms.internal.zzaqj.zzb
            void zza(zzaqr zzaqrVar, Object obj) throws IOException, IllegalAccessException {
                new zzaqm(zzaosVar, this.bpX, zzaqoVar.bC()).zza(zzaqrVar, field.get(obj));
            }

            @Override // com.google.android.gms.internal.zzaqj.zzb
            public boolean zzcs(Object obj) throws IOException, IllegalAccessException {
                return this.bqe && field.get(obj) != obj;
            }
        };
    }

    static List<String> zza(zzaor zzaorVar, Field field) {
        zzapn zzapnVar = (zzapn) field.getAnnotation(zzapn.class);
        LinkedList linkedList = new LinkedList();
        if (zzapnVar == null) {
            linkedList.add(zzaorVar.zzc(field));
        } else {
            linkedList.add(zzapnVar.value());
            String[] bh = zzapnVar.bh();
            for (String str : bh) {
                linkedList.add(str);
            }
        }
        return linkedList;
    }

    private Map<String, zzb> zza(zzaos zzaosVar, zzaqo<?> zzaqoVar, Class<?> cls) {
        Field[] declaredFields;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        if (cls.isInterface()) {
            return linkedHashMap;
        }
        Type bC = zzaqoVar.bC();
        while (cls != Object.class) {
            for (Field field : cls.getDeclaredFields()) {
                boolean zza2 = zza(field, true);
                boolean zza3 = zza(field, false);
                if (zza2 || zza3) {
                    field.setAccessible(true);
                    Type zza4 = zzapr.zza(zzaqoVar.bC(), cls, field.getGenericType());
                    List<String> zzd = zzd(field);
                    zzb zzbVar = null;
                    int i = 0;
                    while (i < zzd.size()) {
                        String str = zzd.get(i);
                        if (i != 0) {
                            zza2 = false;
                        }
                        zzb zzbVar2 = (zzb) linkedHashMap.put(str, zza(zzaosVar, field, str, zzaqo.zzl(zza4), zza2, zza3));
                        if (zzbVar != null) {
                            zzbVar2 = zzbVar;
                        }
                        i++;
                        zzbVar = zzbVar2;
                    }
                    if (zzbVar != null) {
                        String valueOf = String.valueOf(bC);
                        String str2 = zzbVar.name;
                        throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 37 + String.valueOf(str2).length()).append(valueOf).append(" declares multiple JSON fields named ").append(str2).toString());
                    }
                }
            }
            zzaqoVar = zzaqo.zzl(zzapr.zza(zzaqoVar.bC(), cls, cls.getGenericSuperclass()));
            cls = zzaqoVar.bB();
        }
        return linkedHashMap;
    }

    static boolean zza(Field field, boolean z, zzapt zzaptVar) {
        return !zzaptVar.zza(field.getType(), z) && !zzaptVar.zza(field, z);
    }

    private List<String> zzd(Field field) {
        return zza(this.boo, field);
    }

    @Override // com.google.android.gms.internal.zzapl
    public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
        Class<? super T> bB = zzaqoVar.bB();
        if (!Object.class.isAssignableFrom(bB)) {
            return null;
        }
        return new zza(this.bod.zzb(zzaqoVar), zza(zzaosVar, (zzaqo<?>) zzaqoVar, (Class<?>) bB));
    }

    public boolean zza(Field field, boolean z) {
        return zza(field, z, this.bom);
    }
}
