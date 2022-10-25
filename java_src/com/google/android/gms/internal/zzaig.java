package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaih;
import com.google.android.gms.internal.zzaim;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzaig<K, V> extends zzaih<K, V> {
    private final K[] aZZ;
    private final V[] baa;
    private final Comparator<K> bab;

    public zzaig(Comparator<K> comparator) {
        this.aZZ = (K[]) new Object[0];
        this.baa = (V[]) new Object[0];
        this.bab = comparator;
    }

    private zzaig(Comparator<K> comparator, K[] kArr, V[] vArr) {
        this.aZZ = kArr;
        this.baa = vArr;
        this.bab = comparator;
    }

    public static <A, B, C> zzaig<A, C> zza(List<A> list, Map<B, C> map, zzaih.zza.InterfaceC0073zza<A, B> interfaceC0073zza, Comparator<A> comparator) {
        Collections.sort(list, comparator);
        int size = list.size();
        Object[] objArr = new Object[size];
        Object[] objArr2 = new Object[size];
        int i = 0;
        for (A a : list) {
            objArr[i] = a;
            objArr2[i] = map.get(interfaceC0073zza.zzbk(a));
            i++;
        }
        return new zzaig<>(comparator, objArr, objArr2);
    }

    public static <K, V> zzaig<K, V> zza(Map<K, V> map, Comparator<K> comparator) {
        return zza(new ArrayList(map.keySet()), map, zzaih.zza.zzcrm(), comparator);
    }

    private static <T> T[] zza(T[] tArr, int i) {
        int length = tArr.length - 1;
        T[] tArr2 = (T[]) new Object[length];
        System.arraycopy(tArr, 0, tArr2, 0, i);
        System.arraycopy(tArr, i + 1, tArr2, i, length - i);
        return tArr2;
    }

    private static <T> T[] zza(T[] tArr, int i, T t) {
        int length = tArr.length + 1;
        T[] tArr2 = (T[]) new Object[length];
        System.arraycopy(tArr, 0, tArr2, 0, i);
        tArr2[i] = t;
        System.arraycopy(tArr, i, tArr2, i + 1, (length - i) - 1);
        return tArr2;
    }

    private static <T> T[] zzb(T[] tArr, int i, T t) {
        int length = tArr.length;
        T[] tArr2 = (T[]) new Object[length];
        System.arraycopy(tArr, 0, tArr2, 0, length);
        tArr2[i] = t;
        return tArr2;
    }

    private int zzbi(K k) {
        int i = 0;
        while (i < this.aZZ.length && this.bab.compare(this.aZZ[i], k) < 0) {
            i++;
        }
        return i;
    }

    private int zzbj(K k) {
        int i = 0;
        K[] kArr = this.aZZ;
        int length = kArr.length;
        int i2 = 0;
        while (i2 < length) {
            if (this.bab.compare(k, kArr[i2]) == 0) {
                return i;
            }
            i2++;
            i++;
        }
        return -1;
    }

    private Iterator<Map.Entry<K, V>> zze(final int i, final boolean z) {
        return new Iterator<Map.Entry<K, V>>() { // from class: com.google.android.gms.internal.zzaig.1
            int bac;

            {
                this.bac = i;
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return z ? this.bac >= 0 : this.bac < zzaig.this.aZZ.length;
            }

            @Override // java.util.Iterator
            public Map.Entry<K, V> next() {
                Object obj = zzaig.this.aZZ[this.bac];
                Object obj2 = zzaig.this.baa[this.bac];
                this.bac = z ? this.bac - 1 : this.bac + 1;
                return new AbstractMap.SimpleImmutableEntry(obj, obj2);
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException("Can't remove elements from ImmutableSortedMap");
            }
        };
    }

    @Override // com.google.android.gms.internal.zzaih
    public boolean containsKey(K k) {
        return zzbj(k) != -1;
    }

    @Override // com.google.android.gms.internal.zzaih
    public V get(K k) {
        int zzbj = zzbj(k);
        if (zzbj != -1) {
            return this.baa[zzbj];
        }
        return null;
    }

    @Override // com.google.android.gms.internal.zzaih
    public Comparator<K> getComparator() {
        return this.bab;
    }

    @Override // com.google.android.gms.internal.zzaih
    public boolean isEmpty() {
        return this.aZZ.length == 0;
    }

    @Override // com.google.android.gms.internal.zzaih, java.lang.Iterable
    public Iterator<Map.Entry<K, V>> iterator() {
        return zze(0, false);
    }

    @Override // com.google.android.gms.internal.zzaih
    public int size() {
        return this.aZZ.length;
    }

    @Override // com.google.android.gms.internal.zzaih
    public void zza(zzaim.zzb<K, V> zzbVar) {
        for (int i = 0; i < this.aZZ.length; i++) {
            zzbVar.zzk(this.aZZ[i], this.baa[i]);
        }
    }

    @Override // com.google.android.gms.internal.zzaih
    public zzaih<K, V> zzbg(K k) {
        int zzbj = zzbj(k);
        if (zzbj == -1) {
            return this;
        }
        return new zzaig(this.bab, zza(this.aZZ, zzbj), zza(this.baa, zzbj));
    }

    @Override // com.google.android.gms.internal.zzaih
    public K zzbh(K k) {
        int zzbj = zzbj(k);
        if (zzbj == -1) {
            throw new IllegalArgumentException("Can't find predecessor of nonexistent key");
        }
        if (zzbj <= 0) {
            return null;
        }
        return this.aZZ[zzbj - 1];
    }

    @Override // com.google.android.gms.internal.zzaih
    public K zzcrj() {
        if (this.aZZ.length > 0) {
            return this.aZZ[0];
        }
        return null;
    }

    @Override // com.google.android.gms.internal.zzaih
    public K zzcrk() {
        if (this.aZZ.length > 0) {
            return this.aZZ[this.aZZ.length - 1];
        }
        return null;
    }

    @Override // com.google.android.gms.internal.zzaih
    public Iterator<Map.Entry<K, V>> zzcrl() {
        return zze(this.aZZ.length - 1, true);
    }

    @Override // com.google.android.gms.internal.zzaih
    public zzaih<K, V> zzj(K k, V v) {
        int zzbj = zzbj(k);
        if (zzbj != -1) {
            if (this.aZZ[zzbj] == k && this.baa[zzbj] == v) {
                return this;
            }
            return new zzaig(this.bab, zzb(this.aZZ, zzbj, k), zzb(this.baa, zzbj, v));
        } else if (this.aZZ.length <= 25) {
            int zzbi = zzbi(k);
            return new zzaig(this.bab, zza(this.aZZ, zzbi, k), zza(this.baa, zzbi, v));
        } else {
            HashMap hashMap = new HashMap(this.aZZ.length + 1);
            for (int i = 0; i < this.aZZ.length; i++) {
                hashMap.put(this.aZZ[i], this.baa[i]);
            }
            hashMap.put(k, v);
            return zzaip.zzc(hashMap, this.bab);
        }
    }
}
