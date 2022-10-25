package com.google.android.gms.internal;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzfr implements Iterable<zzfq> {
    private final List<zzfq> zzbrd = new LinkedList();

    private zzfq zzg(zzmd zzmdVar) {
        Iterator<zzfq> it = com.google.android.gms.ads.internal.zzu.zzhj().iterator();
        while (it.hasNext()) {
            zzfq next = it.next();
            if (next.zzbnz == zzmdVar) {
                return next;
            }
        }
        return null;
    }

    @Override // java.lang.Iterable
    public Iterator<zzfq> iterator() {
        return this.zzbrd.iterator();
    }

    public void zza(zzfq zzfqVar) {
        this.zzbrd.add(zzfqVar);
    }

    public void zzb(zzfq zzfqVar) {
        this.zzbrd.remove(zzfqVar);
    }

    public boolean zze(zzmd zzmdVar) {
        zzfq zzg = zzg(zzmdVar);
        if (zzg != null) {
            zzg.zzbra.abort();
            return true;
        }
        return false;
    }

    public boolean zzf(zzmd zzmdVar) {
        return zzg(zzmdVar) != null;
    }

    public int zzni() {
        return this.zzbrd.size();
    }
}
