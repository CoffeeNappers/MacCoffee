package com.google.android.gms.internal;

import java.util.Comparator;
/* loaded from: classes2.dex */
public interface zzaim<K, V> {

    /* loaded from: classes2.dex */
    public enum zza {
        RED,
        BLACK
    }

    /* loaded from: classes2.dex */
    public static abstract class zzb<K, V> {
        public abstract void zzk(K k, V v);
    }

    K getKey();

    V getValue();

    boolean isEmpty();

    zzaim<K, V> zza(K k, V v, zza zzaVar, zzaim<K, V> zzaimVar, zzaim<K, V> zzaimVar2);

    zzaim<K, V> zza(K k, V v, Comparator<K> comparator);

    zzaim<K, V> zza(K k, Comparator<K> comparator);

    void zza(zzb<K, V> zzbVar);

    boolean zzcrq();

    zzaim<K, V> zzcrs();

    zzaim<K, V> zzcrt();

    zzaim<K, V> zzcru();

    zzaim<K, V> zzcrv();

    int zzcrw();
}
