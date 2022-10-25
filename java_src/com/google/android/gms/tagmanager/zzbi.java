package com.google.android.gms.tagmanager;

import android.annotation.TargetApi;
import android.util.LruCache;
import com.google.android.gms.tagmanager.zzm;
@TargetApi(12)
/* loaded from: classes2.dex */
class zzbi<K, V> implements zzl<K, V> {
    private LruCache<K, V> aFK;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzbi(int i, final zzm.zza<K, V> zzaVar) {
        this.aFK = new LruCache<K, V>(i) { // from class: com.google.android.gms.tagmanager.zzbi.1
            @Override // android.util.LruCache
            protected int sizeOf(K k, V v) {
                return zzaVar.sizeOf(k, v);
            }
        };
    }

    @Override // com.google.android.gms.tagmanager.zzl
    public V get(K k) {
        return this.aFK.get(k);
    }

    @Override // com.google.android.gms.tagmanager.zzl
    public void zzi(K k, V v) {
        this.aFK.put(k, v);
    }
}
