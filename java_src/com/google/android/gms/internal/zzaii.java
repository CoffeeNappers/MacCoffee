package com.google.android.gms.internal;

import java.util.AbstractMap;
import java.util.Comparator;
import java.util.EmptyStackException;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Stack;
/* loaded from: classes2.dex */
public class zzaii<K, V> implements Iterator<Map.Entry<K, V>> {
    private final Stack<zzaio<K, V>> bah = new Stack<>();
    private final boolean bai;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzaii(zzaim<K, V> zzaimVar, K k, Comparator<K> comparator, boolean z) {
        this.bai = z;
        zzaim<K, V> zzaimVar2 = zzaimVar;
        while (!zzaimVar2.isEmpty()) {
            int compare = k != null ? z ? comparator.compare(k, zzaimVar2.getKey()) : comparator.compare(zzaimVar2.getKey(), k) : 1;
            if (compare < 0) {
                zzaimVar2 = z ? zzaimVar2.zzcrs() : zzaimVar2.zzcrt();
            } else if (compare == 0) {
                this.bah.push((zzaio) zzaimVar2);
                return;
            } else {
                this.bah.push((zzaio) zzaimVar2);
                zzaimVar2 = z ? zzaimVar2.zzcrt() : zzaimVar2.zzcrs();
            }
        }
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        return this.bah.size() > 0;
    }

    @Override // java.util.Iterator
    public Map.Entry<K, V> next() {
        try {
            zzaio<K, V> pop = this.bah.pop();
            AbstractMap.SimpleEntry simpleEntry = new AbstractMap.SimpleEntry(pop.getKey(), pop.getValue());
            if (this.bai) {
                for (zzaim<K, V> zzcrs = pop.zzcrs(); !zzcrs.isEmpty(); zzcrs = zzcrs.zzcrt()) {
                    this.bah.push((zzaio) zzcrs);
                }
            } else {
                for (zzaim<K, V> zzcrt = pop.zzcrt(); !zzcrt.isEmpty(); zzcrt = zzcrt.zzcrs()) {
                    this.bah.push((zzaio) zzcrt);
                }
            }
            return simpleEntry;
        } catch (EmptyStackException e) {
            throw new NoSuchElementException();
        }
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException("remove called on immutable collection");
    }
}
