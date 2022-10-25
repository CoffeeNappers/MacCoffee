package com.google.android.gms.internal;

import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public final class zzaos {
    private final ThreadLocal<Map<zzaqo<?>, zza<?>>> boa;
    private final Map<zzaqo<?>, zzapk<?>> bob;
    private final List<zzapl> boc;
    private final zzaps bod;
    private final boolean boe;
    private final boolean bof;
    private final boolean bog;
    private final boolean boh;
    final zzaow boi;
    final zzapf boj;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zza<T> extends zzapk<T> {
        private zzapk<T> bol;

        zza() {
        }

        public void zza(zzapk<T> zzapkVar) {
            if (this.bol != null) {
                throw new AssertionError();
            }
            this.bol = zzapkVar;
        }

        @Override // com.google.android.gms.internal.zzapk
        public void zza(zzaqr zzaqrVar, T t) throws IOException {
            if (this.bol == null) {
                throw new IllegalStateException();
            }
            this.bol.zza(zzaqrVar, t);
        }

        @Override // com.google.android.gms.internal.zzapk
        public T zzb(zzaqp zzaqpVar) throws IOException {
            if (this.bol == null) {
                throw new IllegalStateException();
            }
            return this.bol.zzb(zzaqpVar);
        }
    }

    public zzaos() {
        this(zzapt.boW, zzaoq.IDENTITY, Collections.emptyMap(), false, false, false, true, false, false, zzapi.DEFAULT, Collections.emptyList());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzaos(zzapt zzaptVar, zzaor zzaorVar, Map<Type, zzaou<?>> map, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, zzapi zzapiVar, List<zzapl> list) {
        this.boa = new ThreadLocal<>();
        this.bob = Collections.synchronizedMap(new HashMap());
        this.boi = new zzaow() { // from class: com.google.android.gms.internal.zzaos.1
        };
        this.boj = new zzapf() { // from class: com.google.android.gms.internal.zzaos.2
        };
        this.bod = new zzaps(map);
        this.boe = z;
        this.bog = z3;
        this.bof = z4;
        this.boh = z5;
        ArrayList arrayList = new ArrayList();
        arrayList.add(zzaqn.bqZ);
        arrayList.add(zzaqi.bpG);
        arrayList.add(zzaptVar);
        arrayList.addAll(list);
        arrayList.add(zzaqn.bqG);
        arrayList.add(zzaqn.bqv);
        arrayList.add(zzaqn.bqp);
        arrayList.add(zzaqn.bqr);
        arrayList.add(zzaqn.bqt);
        arrayList.add(zzaqn.zza(Long.TYPE, Long.class, zza(zzapiVar)));
        arrayList.add(zzaqn.zza(Double.TYPE, Double.class, zzdf(z6)));
        arrayList.add(zzaqn.zza(Float.TYPE, Float.class, zzdg(z6)));
        arrayList.add(zzaqn.bqA);
        arrayList.add(zzaqn.bqC);
        arrayList.add(zzaqn.bqI);
        arrayList.add(zzaqn.bqK);
        arrayList.add(zzaqn.zza(BigDecimal.class, zzaqn.bqE));
        arrayList.add(zzaqn.zza(BigInteger.class, zzaqn.bqF));
        arrayList.add(zzaqn.bqM);
        arrayList.add(zzaqn.bqO);
        arrayList.add(zzaqn.bqS);
        arrayList.add(zzaqn.bqX);
        arrayList.add(zzaqn.bqQ);
        arrayList.add(zzaqn.bqm);
        arrayList.add(zzaqd.bpG);
        arrayList.add(zzaqn.bqV);
        arrayList.add(zzaql.bpG);
        arrayList.add(zzaqk.bpG);
        arrayList.add(zzaqn.bqT);
        arrayList.add(zzaqb.bpG);
        arrayList.add(zzaqn.bqk);
        arrayList.add(new zzaqc(this.bod));
        arrayList.add(new zzaqh(this.bod, z2));
        arrayList.add(new zzaqe(this.bod));
        arrayList.add(zzaqn.bra);
        arrayList.add(new zzaqj(this.bod, zzaorVar, zzaptVar));
        this.boc = Collections.unmodifiableList(arrayList);
    }

    private zzapk<Number> zza(zzapi zzapiVar) {
        return zzapiVar == zzapi.DEFAULT ? zzaqn.bqw : new zzapk<Number>() { // from class: com.google.android.gms.internal.zzaos.5
            @Override // com.google.android.gms.internal.zzapk
            public void zza(zzaqr zzaqrVar, Number number) throws IOException {
                if (number == null) {
                    zzaqrVar.bA();
                } else {
                    zzaqrVar.zzut(number.toString());
                }
            }

            @Override // com.google.android.gms.internal.zzapk
            /* renamed from: zzg */
            public Number zzb(zzaqp zzaqpVar) throws IOException {
                if (zzaqpVar.bq() == zzaqq.NULL) {
                    zzaqpVar.nextNull();
                    return null;
                }
                return Long.valueOf(zzaqpVar.nextLong());
            }
        };
    }

    private static void zza(Object obj, zzaqp zzaqpVar) {
        if (obj != null) {
            try {
                if (zzaqpVar.bq() == zzaqq.END_DOCUMENT) {
                    return;
                }
                throw new zzaoz("JSON document was not fully consumed.");
            } catch (zzaqs e) {
                throw new zzaph(e);
            } catch (IOException e2) {
                throw new zzaoz(e2);
            }
        }
    }

    private zzapk<Number> zzdf(boolean z) {
        return z ? zzaqn.bqy : new zzapk<Number>() { // from class: com.google.android.gms.internal.zzaos.3
            @Override // com.google.android.gms.internal.zzapk
            public void zza(zzaqr zzaqrVar, Number number) throws IOException {
                if (number == null) {
                    zzaqrVar.bA();
                    return;
                }
                zzaos.this.zzm(number.doubleValue());
                zzaqrVar.zza(number);
            }

            @Override // com.google.android.gms.internal.zzapk
            /* renamed from: zze */
            public Double zzb(zzaqp zzaqpVar) throws IOException {
                if (zzaqpVar.bq() == zzaqq.NULL) {
                    zzaqpVar.nextNull();
                    return null;
                }
                return Double.valueOf(zzaqpVar.nextDouble());
            }
        };
    }

    private zzapk<Number> zzdg(boolean z) {
        return z ? zzaqn.bqx : new zzapk<Number>() { // from class: com.google.android.gms.internal.zzaos.4
            @Override // com.google.android.gms.internal.zzapk
            public void zza(zzaqr zzaqrVar, Number number) throws IOException {
                if (number == null) {
                    zzaqrVar.bA();
                    return;
                }
                zzaos.this.zzm(number.floatValue());
                zzaqrVar.zza(number);
            }

            @Override // com.google.android.gms.internal.zzapk
            /* renamed from: zzf */
            public Float zzb(zzaqp zzaqpVar) throws IOException {
                if (zzaqpVar.bq() == zzaqq.NULL) {
                    zzaqpVar.nextNull();
                    return null;
                }
                return Float.valueOf((float) zzaqpVar.nextDouble());
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzm(double d) {
        if (Double.isNaN(d) || Double.isInfinite(d)) {
            throw new IllegalArgumentException(new StringBuilder(168).append(d).append(" is not a valid double value as per JSON specification. To override this").append(" behavior, use GsonBuilder.serializeSpecialFloatingPointValues() method.").toString());
        }
    }

    public String toString() {
        return "{serializeNulls:" + this.boe + "factories:" + this.boc + ",instanceCreators:" + this.bod + "}";
    }

    public <T> zzapk<T> zza(zzapl zzaplVar, zzaqo<T> zzaqoVar) {
        boolean z = false;
        if (!this.boc.contains(zzaplVar)) {
            z = true;
        }
        boolean z2 = z;
        for (zzapl zzaplVar2 : this.boc) {
            if (z2) {
                zzapk<T> zza2 = zzaplVar2.zza(this, zzaqoVar);
                if (zza2 != null) {
                    return zza2;
                }
            } else if (zzaplVar2 == zzaplVar) {
                z2 = true;
            }
        }
        String valueOf = String.valueOf(zzaqoVar);
        throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 22).append("GSON cannot serialize ").append(valueOf).toString());
    }

    public <T> zzapk<T> zza(zzaqo<T> zzaqoVar) {
        HashMap hashMap;
        zzapk<T> zzapkVar = (zzapk<T>) this.bob.get(zzaqoVar);
        if (zzapkVar == null) {
            Map<zzaqo<?>, zza<?>> map = this.boa.get();
            boolean z = false;
            if (map == null) {
                HashMap hashMap2 = new HashMap();
                this.boa.set(hashMap2);
                hashMap = hashMap2;
                z = true;
            } else {
                hashMap = map;
            }
            zzapkVar = hashMap.get(zzaqoVar);
            if (zzapkVar == null) {
                try {
                    zza<?> zzaVar = new zza<>();
                    hashMap.put(zzaqoVar, zzaVar);
                    for (zzapl zzaplVar : this.boc) {
                        zzapkVar = zzaplVar.zza(this, zzaqoVar);
                        if (zzapkVar != null) {
                            zzaVar.zza(zzapkVar);
                            this.bob.put(zzaqoVar, zzapkVar);
                            hashMap.remove(zzaqoVar);
                            if (z) {
                                this.boa.remove();
                            }
                        }
                    }
                    String valueOf = String.valueOf(zzaqoVar);
                    throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 19).append("GSON cannot handle ").append(valueOf).toString());
                } catch (Throwable th) {
                    hashMap.remove(zzaqoVar);
                    if (z) {
                        this.boa.remove();
                    }
                    throw th;
                }
            }
        }
        return zzapkVar;
    }

    public zzaqr zza(Writer writer) throws IOException {
        if (this.bog) {
            writer.write(")]}'\n");
        }
        zzaqr zzaqrVar = new zzaqr(writer);
        if (this.boh) {
            zzaqrVar.setIndent("  ");
        }
        zzaqrVar.zzdk(this.boe);
        return zzaqrVar;
    }

    public <T> T zza(zzaoy zzaoyVar, Class<T> cls) throws zzaph {
        return (T) zzapy.zzp(cls).cast(zza(zzaoyVar, (Type) cls));
    }

    public <T> T zza(zzaoy zzaoyVar, Type type) throws zzaph {
        if (zzaoyVar == null) {
            return null;
        }
        return (T) zza(new zzaqf(zzaoyVar), type);
    }

    public <T> T zza(zzaqp zzaqpVar, Type type) throws zzaoz, zzaph {
        boolean z = true;
        boolean isLenient = zzaqpVar.isLenient();
        zzaqpVar.setLenient(true);
        try {
            try {
                zzaqpVar.bq();
                z = false;
                return zza(zzaqo.zzl(type)).zzb(zzaqpVar);
            } catch (EOFException e) {
                if (!z) {
                    throw new zzaph(e);
                }
                zzaqpVar.setLenient(isLenient);
                return null;
            } catch (IOException e2) {
                throw new zzaph(e2);
            } catch (IllegalStateException e3) {
                throw new zzaph(e3);
            }
        } finally {
            zzaqpVar.setLenient(isLenient);
        }
    }

    public <T> T zza(Reader reader, Type type) throws zzaoz, zzaph {
        zzaqp zzaqpVar = new zzaqp(reader);
        T t = (T) zza(zzaqpVar, type);
        zza(t, zzaqpVar);
        return t;
    }

    public <T> T zza(String str, Type type) throws zzaph {
        if (str == null) {
            return null;
        }
        return (T) zza(new StringReader(str), type);
    }

    public void zza(zzaoy zzaoyVar, zzaqr zzaqrVar) throws zzaoz {
        boolean isLenient = zzaqrVar.isLenient();
        zzaqrVar.setLenient(true);
        boolean bM = zzaqrVar.bM();
        zzaqrVar.zzdj(this.bof);
        boolean bN = zzaqrVar.bN();
        zzaqrVar.zzdk(this.boe);
        try {
            try {
                zzapz.zzb(zzaoyVar, zzaqrVar);
            } catch (IOException e) {
                throw new zzaoz(e);
            }
        } finally {
            zzaqrVar.setLenient(isLenient);
            zzaqrVar.zzdj(bM);
            zzaqrVar.zzdk(bN);
        }
    }

    public void zza(zzaoy zzaoyVar, Appendable appendable) throws zzaoz {
        try {
            zza(zzaoyVar, zza(zzapz.zza(appendable)));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void zza(Object obj, Type type, zzaqr zzaqrVar) throws zzaoz {
        zzapk zza2 = zza(zzaqo.zzl(type));
        boolean isLenient = zzaqrVar.isLenient();
        zzaqrVar.setLenient(true);
        boolean bM = zzaqrVar.bM();
        zzaqrVar.zzdj(this.bof);
        boolean bN = zzaqrVar.bN();
        zzaqrVar.zzdk(this.boe);
        try {
            try {
                zza2.zza(zzaqrVar, obj);
            } catch (IOException e) {
                throw new zzaoz(e);
            }
        } finally {
            zzaqrVar.setLenient(isLenient);
            zzaqrVar.zzdj(bM);
            zzaqrVar.zzdk(bN);
        }
    }

    public void zza(Object obj, Type type, Appendable appendable) throws zzaoz {
        try {
            zza(obj, type, zza(zzapz.zza(appendable)));
        } catch (IOException e) {
            throw new zzaoz(e);
        }
    }

    public String zzb(zzaoy zzaoyVar) {
        StringWriter stringWriter = new StringWriter();
        zza(zzaoyVar, stringWriter);
        return stringWriter.toString();
    }

    public String zzc(Object obj, Type type) {
        StringWriter stringWriter = new StringWriter();
        zza(obj, type, stringWriter);
        return stringWriter.toString();
    }

    public String zzck(Object obj) {
        return obj == null ? zzb(zzapa.bou) : zzc(obj, obj.getClass());
    }

    public <T> T zzf(String str, Class<T> cls) throws zzaph {
        return (T) zzapy.zzp(cls).cast(zza(str, cls));
    }

    public <T> zzapk<T> zzk(Class<T> cls) {
        return zza(zzaqo.zzr(cls));
    }
}
