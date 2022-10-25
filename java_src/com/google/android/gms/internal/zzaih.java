package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaim;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public abstract class zzaih<K, V> implements Iterable<Map.Entry<K, V>> {

    /* loaded from: classes2.dex */
    public static class zza {
        private static final InterfaceC0073zza bag = new InterfaceC0073zza() { // from class: com.google.android.gms.internal.zzaih.zza.1
            @Override // com.google.android.gms.internal.zzaih.zza.InterfaceC0073zza
            public Object zzbk(Object obj) {
                return obj;
            }
        };

        /* renamed from: com.google.android.gms.internal.zzaih$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        public interface InterfaceC0073zza<C, D> {
            D zzbk(C c);
        }

        public static <K, V> zzaih<K, V> zza(Comparator<K> comparator) {
            return new zzaig(comparator);
        }

        public static <A, B, C> zzaih<A, C> zzb(List<A> list, Map<B, C> map, InterfaceC0073zza<A, B> interfaceC0073zza, Comparator<A> comparator) {
            return list.size() < 25 ? zzaig.zza(list, map, interfaceC0073zza, comparator) : zzaip.zzc(list, map, interfaceC0073zza, comparator);
        }

        public static <A, B> zzaih<A, B> zzb(Map<A, B> map, Comparator<A> comparator) {
            return map.size() < 25 ? zzaig.zza(map, comparator) : zzaip.zzc(map, comparator);
        }

        public static <A> InterfaceC0073zza<A, A> zzcrm() {
            return bag;
        }
    }

    public abstract boolean containsKey(K k);

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zzaih)) {
            return false;
        }
        zzaih zzaihVar = (zzaih) obj;
        if (getComparator().equals(zzaihVar.getComparator()) && size() == zzaihVar.size()) {
            Iterator<Map.Entry<K, V>> it = iterator();
            Iterator<Map.Entry<K, V>> it2 = zzaihVar.iterator();
            while (it.hasNext()) {
                if (!it.next().equals(it2.next())) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }

    public abstract V get(K k);

    public abstract Comparator<K> getComparator();

    public int hashCode() {
        int hashCode = getComparator().hashCode();
        Iterator<Map.Entry<K, V>> it = iterator();
        while (true) {
            int i = hashCode;
            if (it.hasNext()) {
                hashCode = it.next().hashCode() + (i * 31);
            } else {
                return i;
            }
        }
    }

    public abstract boolean isEmpty();

    @Override // java.lang.Iterable
    public abstract Iterator<Map.Entry<K, V>> iterator();

    public abstract int size();

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append("{");
        Iterator<Map.Entry<K, V>> it = iterator();
        boolean z = true;
        while (it.hasNext()) {
            Map.Entry<K, V> next = it.next();
            if (z) {
                z = false;
            } else {
                sb.append(", ");
            }
            sb.append("(");
            sb.append(next.getKey());
            sb.append("=>");
            sb.append(next.getValue());
            sb.append(")");
        }
        sb.append("};");
        return sb.toString();
    }

    public abstract void zza(zzaim.zzb<K, V> zzbVar);

    public abstract zzaih<K, V> zzbg(K k);

    public abstract K zzbh(K k);

    public abstract K zzcrj();

    public abstract K zzcrk();

    public abstract Iterator<Map.Entry<K, V>> zzcrl();

    public abstract zzaih<K, V> zzj(K k, V v);
}
