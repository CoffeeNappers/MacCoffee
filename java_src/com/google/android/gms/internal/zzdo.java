package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzdo {
    private final Collection<zzdn> zzbcp = new ArrayList();
    private final Collection<zzdn<String>> zzbcq = new ArrayList();
    private final Collection<zzdn<String>> zzbcr = new ArrayList();

    public void zza(zzdn zzdnVar) {
        this.zzbcp.add(zzdnVar);
    }

    public void zzb(zzdn<String> zzdnVar) {
        this.zzbcq.add(zzdnVar);
    }

    public void zzc(zzdn<String> zzdnVar) {
        this.zzbcr.add(zzdnVar);
    }

    public List<String> zzlq() {
        ArrayList arrayList = new ArrayList();
        for (zzdn<String> zzdnVar : this.zzbcq) {
            String str = zzdnVar.get();
            if (str != null) {
                arrayList.add(str);
            }
        }
        return arrayList;
    }

    public List<String> zzlr() {
        List<String> zzlq = zzlq();
        for (zzdn<String> zzdnVar : this.zzbcr) {
            String str = zzdnVar.get();
            if (str != null) {
                zzlq.add(str);
            }
        }
        return zzlq;
    }
}
