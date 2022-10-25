package com.google.android.gms.tagmanager;

import com.google.android.gms.tagmanager.zzm;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
/* loaded from: classes2.dex */
class zzde<K, V> implements zzl<K, V> {
    private final Map<K, V> aHA = new HashMap();
    private final int aHB;
    private final zzm.zza<K, V> aHC;
    private int aHD;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzde(int i, zzm.zza<K, V> zzaVar) {
        this.aHB = i;
        this.aHC = zzaVar;
    }

    @Override // com.google.android.gms.tagmanager.zzl
    public synchronized V get(K k) {
        return this.aHA.get(k);
    }

    @Override // com.google.android.gms.tagmanager.zzl
    public synchronized void zzi(K k, V v) {
        if (k == null || v == null) {
            throw new NullPointerException("key == null || value == null");
        }
        this.aHD += this.aHC.sizeOf(k, v);
        if (this.aHD > this.aHB) {
            Iterator<Map.Entry<K, V>> it = this.aHA.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry<K, V> next = it.next();
                this.aHD -= this.aHC.sizeOf(next.getKey(), next.getValue());
                it.remove();
                if (this.aHD <= this.aHB) {
                    break;
                }
            }
        }
        this.aHA.put(k, v);
    }
}
