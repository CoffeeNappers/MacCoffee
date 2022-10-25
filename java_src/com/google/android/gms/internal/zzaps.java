package com.google.android.gms.internal;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;
/* loaded from: classes2.dex */
public final class zzaps {
    private final Map<Type, zzaou<?>> bop;

    public zzaps(Map<Type, zzaou<?>> map) {
        this.bop = map;
    }

    private <T> zzapx<T> zzc(final Type type, Class<? super T> cls) {
        if (Collection.class.isAssignableFrom(cls)) {
            return SortedSet.class.isAssignableFrom(cls) ? new zzapx<T>() { // from class: com.google.android.gms.internal.zzaps.7
                /* JADX WARN: Type inference failed for: r0v0, types: [T, java.util.TreeSet] */
                @Override // com.google.android.gms.internal.zzapx
                public T bj() {
                    return new TreeSet();
                }
            } : EnumSet.class.isAssignableFrom(cls) ? new zzapx<T>() { // from class: com.google.android.gms.internal.zzaps.8
                /* JADX WARN: Type inference failed for: r0v19, types: [T, java.util.EnumSet] */
                @Override // com.google.android.gms.internal.zzapx
                public T bj() {
                    if (!(type instanceof ParameterizedType)) {
                        String valueOf = String.valueOf(type.toString());
                        throw new zzaoz(valueOf.length() != 0 ? "Invalid EnumSet type: ".concat(valueOf) : new String("Invalid EnumSet type: "));
                    }
                    Type type2 = ((ParameterizedType) type).getActualTypeArguments()[0];
                    if (type2 instanceof Class) {
                        return EnumSet.noneOf((Class) type2);
                    }
                    String valueOf2 = String.valueOf(type.toString());
                    throw new zzaoz(valueOf2.length() != 0 ? "Invalid EnumSet type: ".concat(valueOf2) : new String("Invalid EnumSet type: "));
                }
            } : Set.class.isAssignableFrom(cls) ? new zzapx<T>() { // from class: com.google.android.gms.internal.zzaps.9
                /* JADX WARN: Type inference failed for: r0v0, types: [T, java.util.LinkedHashSet] */
                @Override // com.google.android.gms.internal.zzapx
                public T bj() {
                    return new LinkedHashSet();
                }
            } : Queue.class.isAssignableFrom(cls) ? new zzapx<T>() { // from class: com.google.android.gms.internal.zzaps.10
                /* JADX WARN: Type inference failed for: r0v0, types: [T, java.util.LinkedList] */
                @Override // com.google.android.gms.internal.zzapx
                public T bj() {
                    return new LinkedList();
                }
            } : new zzapx<T>() { // from class: com.google.android.gms.internal.zzaps.11
                /* JADX WARN: Type inference failed for: r0v0, types: [T, java.util.ArrayList] */
                @Override // com.google.android.gms.internal.zzapx
                public T bj() {
                    return new ArrayList();
                }
            };
        } else if (!Map.class.isAssignableFrom(cls)) {
            return null;
        } else {
            return SortedMap.class.isAssignableFrom(cls) ? new zzapx<T>() { // from class: com.google.android.gms.internal.zzaps.12
                /* JADX WARN: Type inference failed for: r0v0, types: [java.util.TreeMap, T] */
                @Override // com.google.android.gms.internal.zzapx
                public T bj() {
                    return new TreeMap();
                }
            } : (!(type instanceof ParameterizedType) || String.class.isAssignableFrom(zzaqo.zzl(((ParameterizedType) type).getActualTypeArguments()[0]).bB())) ? new zzapx<T>() { // from class: com.google.android.gms.internal.zzaps.3
                /* JADX WARN: Type inference failed for: r0v0, types: [com.google.android.gms.internal.zzapw, T] */
                @Override // com.google.android.gms.internal.zzapx
                public T bj() {
                    return new zzapw();
                }
            } : new zzapx<T>() { // from class: com.google.android.gms.internal.zzaps.2
                /* JADX WARN: Type inference failed for: r0v0, types: [java.util.LinkedHashMap, T] */
                @Override // com.google.android.gms.internal.zzapx
                public T bj() {
                    return new LinkedHashMap();
                }
            };
        }
    }

    private <T> zzapx<T> zzd(final Type type, final Class<? super T> cls) {
        return new zzapx<T>() { // from class: com.google.android.gms.internal.zzaps.4
            private final zzaqa boS = zzaqa.bo();

            /* JADX WARN: Type inference failed for: r0v2, types: [T, java.lang.Object] */
            @Override // com.google.android.gms.internal.zzapx
            public T bj() {
                try {
                    return this.boS.zzf(cls);
                } catch (Exception e) {
                    String valueOf = String.valueOf(type);
                    throw new RuntimeException(new StringBuilder(String.valueOf(valueOf).length() + 116).append("Unable to invoke no-args constructor for ").append(valueOf).append(". ").append("Register an InstanceCreator with Gson for this type may fix this problem.").toString(), e);
                }
            }
        };
    }

    private <T> zzapx<T> zzl(Class<? super T> cls) {
        try {
            final Constructor<? super T> declaredConstructor = cls.getDeclaredConstructor(new Class[0]);
            if (!declaredConstructor.isAccessible()) {
                declaredConstructor.setAccessible(true);
            }
            return new zzapx<T>() { // from class: com.google.android.gms.internal.zzaps.6
                /* JADX WARN: Type inference failed for: r0v5, types: [T, java.lang.Object] */
                @Override // com.google.android.gms.internal.zzapx
                public T bj() {
                    try {
                        return declaredConstructor.newInstance(null);
                    } catch (IllegalAccessException e) {
                        throw new AssertionError(e);
                    } catch (InstantiationException e2) {
                        String valueOf = String.valueOf(declaredConstructor);
                        throw new RuntimeException(new StringBuilder(String.valueOf(valueOf).length() + 30).append("Failed to invoke ").append(valueOf).append(" with no args").toString(), e2);
                    } catch (InvocationTargetException e3) {
                        String valueOf2 = String.valueOf(declaredConstructor);
                        throw new RuntimeException(new StringBuilder(String.valueOf(valueOf2).length() + 30).append("Failed to invoke ").append(valueOf2).append(" with no args").toString(), e3.getTargetException());
                    }
                }
            };
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    public String toString() {
        return this.bop.toString();
    }

    public <T> zzapx<T> zzb(zzaqo<T> zzaqoVar) {
        final Type bC = zzaqoVar.bC();
        Class<? super T> bB = zzaqoVar.bB();
        final zzaou<?> zzaouVar = this.bop.get(bC);
        if (zzaouVar != null) {
            return new zzapx<T>() { // from class: com.google.android.gms.internal.zzaps.1
                /* JADX WARN: Type inference failed for: r0v1, types: [T, java.lang.Object] */
                @Override // com.google.android.gms.internal.zzapx
                public T bj() {
                    return zzaouVar.zza(bC);
                }
            };
        }
        final zzaou<?> zzaouVar2 = this.bop.get(bB);
        if (zzaouVar2 != null) {
            return new zzapx<T>() { // from class: com.google.android.gms.internal.zzaps.5
                /* JADX WARN: Type inference failed for: r0v1, types: [T, java.lang.Object] */
                @Override // com.google.android.gms.internal.zzapx
                public T bj() {
                    return zzaouVar2.zza(bC);
                }
            };
        }
        zzapx<T> zzl = zzl(bB);
        if (zzl != null) {
            return zzl;
        }
        zzapx<T> zzc = zzc(bC, bB);
        return zzc == null ? zzd(bC, bB) : zzc;
    }
}
