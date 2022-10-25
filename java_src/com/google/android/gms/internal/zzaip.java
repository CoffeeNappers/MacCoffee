package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaih;
import com.google.android.gms.internal.zzaim;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzaip<K, V> extends zzaih<K, V> {
    private Comparator<K> bab;
    private zzaim<K, V> bas;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zza<A, B, C> {
        private final List<A> bat;
        private final zzaih.zza.InterfaceC0073zza<A, B> bau;
        private zzaio<A, C> bav;
        private zzaio<A, C> baw;
        private final Map<B, C> values;

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: com.google.android.gms.internal.zzaip$zza$zza  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        public static class C0074zza implements Iterable<zzb> {
            private final int length;
            private long value;

            public C0074zza(int i) {
                int i2 = i + 1;
                this.length = (int) Math.floor(Math.log(i2) / Math.log(2.0d));
                this.value = i2 & (((long) Math.pow(2.0d, this.length)) - 1);
            }

            @Override // java.lang.Iterable
            public Iterator<zzb> iterator() {
                return new Iterator<zzb>() { // from class: com.google.android.gms.internal.zzaip.zza.zza.1
                    private int bax;

                    {
                        this.bax = C0074zza.this.length - 1;
                    }

                    @Override // java.util.Iterator
                    public boolean hasNext() {
                        return this.bax >= 0;
                    }

                    @Override // java.util.Iterator
                    public void remove() {
                    }

                    @Override // java.util.Iterator
                    /* renamed from: zzcse */
                    public zzb next() {
                        boolean z = true;
                        zzb zzbVar = new zzb();
                        if ((C0074zza.this.value & (1 << this.bax)) != 0) {
                            z = false;
                        }
                        zzbVar.baz = z;
                        zzbVar.baA = (int) Math.pow(2.0d, this.bax);
                        this.bax--;
                        return zzbVar;
                    }
                };
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes2.dex */
        public static class zzb {
            public int baA;
            public boolean baz;

            zzb() {
            }
        }

        private zza(List<A> list, Map<B, C> map, zzaih.zza.InterfaceC0073zza<A, B> interfaceC0073zza) {
            this.bat = list;
            this.values = map;
            this.bau = interfaceC0073zza;
        }

        private void zza(zzaim.zza zzaVar, int i, int i2) {
            zzaim<A, C> zzab = zzab(i2 + 1, i - 1);
            A a = this.bat.get(i2);
            zzaio<A, C> zzainVar = zzaVar == zzaim.zza.RED ? new zzain<>(a, zzbp(a), null, zzab) : new zzaik<>(a, zzbp(a), null, zzab);
            if (this.bav == null) {
                this.bav = zzainVar;
                this.baw = zzainVar;
                return;
            }
            this.baw.zzb(zzainVar);
            this.baw = zzainVar;
        }

        private zzaim<A, C> zzab(int i, int i2) {
            if (i2 == 0) {
                return zzail.zzcrr();
            }
            if (i2 == 1) {
                A a = this.bat.get(i);
                return new zzaik(a, zzbp(a), null, null);
            }
            int i3 = i2 / 2;
            int i4 = i + i3;
            zzaim<A, C> zzab = zzab(i, i3);
            zzaim<A, C> zzab2 = zzab(i4 + 1, i3);
            A a2 = this.bat.get(i4);
            return new zzaik(a2, zzbp(a2), zzab, zzab2);
        }

        private C zzbp(A a) {
            return this.values.get(this.bau.zzbk(a));
        }

        public static <A, B, C> zzaip<A, C> zzc(List<A> list, Map<B, C> map, zzaih.zza.InterfaceC0073zza<A, B> interfaceC0073zza, Comparator<A> comparator) {
            zza zzaVar = new zza(list, map, interfaceC0073zza);
            Collections.sort(list, comparator);
            Iterator<zzb> it = new C0074zza(list.size()).iterator();
            int size = list.size();
            while (true) {
                int i = size;
                if (!it.hasNext()) {
                    break;
                }
                zzb next = it.next();
                int i2 = i - next.baA;
                if (next.baz) {
                    zzaVar.zza(zzaim.zza.BLACK, next.baA, i2);
                } else {
                    zzaVar.zza(zzaim.zza.BLACK, next.baA, i2);
                    i2 -= next.baA;
                    zzaVar.zza(zzaim.zza.RED, next.baA, i2);
                }
                size = i2;
            }
            return new zzaip<>(zzaVar.bav == null ? zzail.zzcrr() : zzaVar.bav, comparator);
        }
    }

    private zzaip(zzaim<K, V> zzaimVar, Comparator<K> comparator) {
        this.bas = zzaimVar;
        this.bab = comparator;
    }

    private zzaim<K, V> zzbo(K k) {
        zzaim<K, V> zzaimVar = this.bas;
        while (!zzaimVar.isEmpty()) {
            int compare = this.bab.compare(k, zzaimVar.getKey());
            if (compare < 0) {
                zzaimVar = zzaimVar.zzcrs();
            } else if (compare == 0) {
                return zzaimVar;
            } else {
                zzaimVar = zzaimVar.zzcrt();
            }
        }
        return null;
    }

    public static <A, B, C> zzaip<A, C> zzc(List<A> list, Map<B, C> map, zzaih.zza.InterfaceC0073zza<A, B> interfaceC0073zza, Comparator<A> comparator) {
        return zza.zzc(list, map, interfaceC0073zza, comparator);
    }

    public static <A, B> zzaip<A, B> zzc(Map<A, B> map, Comparator<A> comparator) {
        return zza.zzc(new ArrayList(map.keySet()), map, zzaih.zza.zzcrm(), comparator);
    }

    @Override // com.google.android.gms.internal.zzaih
    public boolean containsKey(K k) {
        return zzbo(k) != null;
    }

    @Override // com.google.android.gms.internal.zzaih
    public V get(K k) {
        zzaim<K, V> zzbo = zzbo(k);
        if (zzbo != null) {
            return zzbo.getValue();
        }
        return null;
    }

    @Override // com.google.android.gms.internal.zzaih
    public Comparator<K> getComparator() {
        return this.bab;
    }

    @Override // com.google.android.gms.internal.zzaih
    public boolean isEmpty() {
        return this.bas.isEmpty();
    }

    @Override // com.google.android.gms.internal.zzaih, java.lang.Iterable
    public Iterator<Map.Entry<K, V>> iterator() {
        return new zzaii(this.bas, null, this.bab, false);
    }

    @Override // com.google.android.gms.internal.zzaih
    public int size() {
        return this.bas.zzcrw();
    }

    @Override // com.google.android.gms.internal.zzaih
    public void zza(zzaim.zzb<K, V> zzbVar) {
        this.bas.zza(zzbVar);
    }

    @Override // com.google.android.gms.internal.zzaih
    public zzaih<K, V> zzbg(K k) {
        return !containsKey(k) ? this : new zzaip(this.bas.zza(k, this.bab).zza(null, null, zzaim.zza.BLACK, null, null), this.bab);
    }

    @Override // com.google.android.gms.internal.zzaih
    public K zzbh(K k) {
        zzaim<K, V> zzaimVar = this.bas;
        zzaim<K, V> zzaimVar2 = null;
        while (!zzaimVar.isEmpty()) {
            int compare = this.bab.compare(k, zzaimVar.getKey());
            if (compare == 0) {
                if (zzaimVar.zzcrs().isEmpty()) {
                    if (zzaimVar2 == null) {
                        return null;
                    }
                    return zzaimVar2.getKey();
                }
                zzaim<K, V> zzcrs = zzaimVar.zzcrs();
                while (!zzcrs.zzcrt().isEmpty()) {
                    zzcrs = zzcrs.zzcrt();
                }
                return zzcrs.getKey();
            } else if (compare < 0) {
                zzaimVar = zzaimVar.zzcrs();
            } else {
                zzaim<K, V> zzaimVar3 = zzaimVar;
                zzaimVar = zzaimVar.zzcrt();
                zzaimVar2 = zzaimVar3;
            }
        }
        String valueOf = String.valueOf(k);
        throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 50).append("Couldn't find predecessor key of non-present key: ").append(valueOf).toString());
    }

    @Override // com.google.android.gms.internal.zzaih
    public K zzcrj() {
        return this.bas.zzcru().getKey();
    }

    @Override // com.google.android.gms.internal.zzaih
    public K zzcrk() {
        return this.bas.zzcrv().getKey();
    }

    @Override // com.google.android.gms.internal.zzaih
    public Iterator<Map.Entry<K, V>> zzcrl() {
        return new zzaii(this.bas, null, this.bab, true);
    }

    @Override // com.google.android.gms.internal.zzaih
    public zzaih<K, V> zzj(K k, V v) {
        return new zzaip(this.bas.zza(k, v, this.bab).zza(null, null, zzaim.zza.BLACK, null, null), this.bab);
    }
}
