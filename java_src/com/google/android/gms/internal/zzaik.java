package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaim;
/* loaded from: classes2.dex */
public class zzaik<K, V> extends zzaio<K, V> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public zzaik(K k, V v, zzaim<K, V> zzaimVar, zzaim<K, V> zzaimVar2) {
        super(k, v, zzaimVar, zzaimVar2);
    }

    @Override // com.google.android.gms.internal.zzaio
    protected zzaio<K, V> zza(K k, V v, zzaim<K, V> zzaimVar, zzaim<K, V> zzaimVar2) {
        if (k == null) {
            k = getKey();
        }
        if (v == null) {
            v = getValue();
        }
        if (zzaimVar == null) {
            zzaimVar = zzcrs();
        }
        if (zzaimVar2 == null) {
            zzaimVar2 = zzcrt();
        }
        return new zzaik(k, v, zzaimVar, zzaimVar2);
    }

    @Override // com.google.android.gms.internal.zzaio
    protected zzaim.zza zzcrp() {
        return zzaim.zza.BLACK;
    }

    @Override // com.google.android.gms.internal.zzaim
    public boolean zzcrq() {
        return false;
    }
}
