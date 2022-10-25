package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaim;
import java.util.Comparator;
/* loaded from: classes2.dex */
public class zzail<K, V> implements zzaim<K, V> {
    private static final zzail bal = new zzail();

    private zzail() {
    }

    public static <K, V> zzail<K, V> zzcrr() {
        return bal;
    }

    @Override // com.google.android.gms.internal.zzaim
    public K getKey() {
        return null;
    }

    @Override // com.google.android.gms.internal.zzaim
    public V getValue() {
        return null;
    }

    @Override // com.google.android.gms.internal.zzaim
    public boolean isEmpty() {
        return true;
    }

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zza(K k, V v, zzaim.zza zzaVar, zzaim<K, V> zzaimVar, zzaim<K, V> zzaimVar2) {
        return this;
    }

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zza(K k, V v, Comparator<K> comparator) {
        return new zzain(k, v);
    }

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zza(K k, Comparator<K> comparator) {
        return this;
    }

    @Override // com.google.android.gms.internal.zzaim
    public void zza(zzaim.zzb<K, V> zzbVar) {
    }

    @Override // com.google.android.gms.internal.zzaim
    public boolean zzcrq() {
        return false;
    }

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zzcrs() {
        return this;
    }

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zzcrt() {
        return this;
    }

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zzcru() {
        return this;
    }

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zzcrv() {
        return this;
    }

    @Override // com.google.android.gms.internal.zzaim
    public int zzcrw() {
        return 0;
    }
}
