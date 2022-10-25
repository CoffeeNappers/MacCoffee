package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaih;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzaij<T> implements Iterable<T> {
    private final zzaih<T, Void> baj;

    /* loaded from: classes2.dex */
    private static class zza<T> implements Iterator<T> {
        final Iterator<Map.Entry<T, Void>> bak;

        public zza(Iterator<Map.Entry<T, Void>> it) {
            this.bak = it;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.bak.hasNext();
        }

        @Override // java.util.Iterator
        public T next() {
            return this.bak.next().getKey();
        }

        @Override // java.util.Iterator
        public void remove() {
            this.bak.remove();
        }
    }

    private zzaij(zzaih<T, Void> zzaihVar) {
        this.baj = zzaihVar;
    }

    public zzaij(List<T> list, Comparator<T> comparator) {
        this.baj = zzaih.zza.zzb(list, Collections.emptyMap(), zzaih.zza.zzcrm(), comparator);
    }

    @Override // java.lang.Iterable
    public Iterator<T> iterator() {
        return new zza(this.baj.iterator());
    }

    public zzaij<T> zzbl(T t) {
        zzaih<T, Void> zzbg = this.baj.zzbg(t);
        return zzbg == this.baj ? this : new zzaij<>(zzbg);
    }

    public zzaij<T> zzbm(T t) {
        return new zzaij<>(this.baj.zzj(t, null));
    }

    public T zzbn(T t) {
        return this.baj.zzbh(t);
    }

    public Iterator<T> zzcrl() {
        return new zza(this.baj.zzcrl());
    }

    public T zzcrn() {
        return this.baj.zzcrj();
    }

    public T zzcro() {
        return this.baj.zzcrk();
    }
}
