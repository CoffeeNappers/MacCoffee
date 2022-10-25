package com.google.android.gms.common.util;

import android.support.v4.util.ArrayMap;
import android.support.v4.util.SimpleArrayMap;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class zza<E> extends AbstractSet<E> {
    private final ArrayMap<E, E> Gp;

    public zza() {
        this.Gp = new ArrayMap<>();
    }

    public zza(int i) {
        this.Gp = new ArrayMap<>(i);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public zza(Collection<E> collection) {
        this(collection.size());
        addAll(collection);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean add(E e) {
        if (this.Gp.containsKey(e)) {
            return false;
        }
        this.Gp.put(e, e);
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean addAll(Collection<? extends E> collection) {
        return collection instanceof zza ? zza((zza) collection) : super.addAll(collection);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public void clear() {
        this.Gp.clear();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean contains(Object obj) {
        return this.Gp.containsKey(obj);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public Iterator<E> iterator() {
        return this.Gp.keySet().iterator();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean remove(Object obj) {
        if (!this.Gp.containsKey(obj)) {
            return false;
        }
        this.Gp.remove(obj);
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public int size() {
        return this.Gp.size();
    }

    public boolean zza(zza<? extends E> zzaVar) {
        int size = size();
        this.Gp.putAll((SimpleArrayMap<? extends E, ? extends E>) zzaVar.Gp);
        return size() > size;
    }
}
