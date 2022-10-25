package com.google.android.gms.internal;

import java.util.AbstractMap;
import java.util.HashSet;
import java.util.Iterator;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzgk implements zzgj {
    private final zzgi zzbuq;
    private final HashSet<AbstractMap.SimpleEntry<String, zzfe>> zzbur = new HashSet<>();

    public zzgk(zzgi zzgiVar) {
        this.zzbuq = zzgiVar;
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zza(String str, zzfe zzfeVar) {
        this.zzbuq.zza(str, zzfeVar);
        this.zzbur.add(new AbstractMap.SimpleEntry<>(str, zzfeVar));
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zza(String str, JSONObject jSONObject) {
        this.zzbuq.zza(str, jSONObject);
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zzb(String str, zzfe zzfeVar) {
        this.zzbuq.zzb(str, zzfeVar);
        this.zzbur.remove(new AbstractMap.SimpleEntry(str, zzfeVar));
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zzb(String str, JSONObject jSONObject) {
        this.zzbuq.zzb(str, jSONObject);
    }

    @Override // com.google.android.gms.internal.zzgi
    public void zzi(String str, String str2) {
        this.zzbuq.zzi(str, str2);
    }

    @Override // com.google.android.gms.internal.zzgj
    public void zzod() {
        Iterator<AbstractMap.SimpleEntry<String, zzfe>> it = this.zzbur.iterator();
        while (it.hasNext()) {
            AbstractMap.SimpleEntry<String, zzfe> next = it.next();
            String valueOf = String.valueOf(next.getValue().toString());
            zzkx.v(valueOf.length() != 0 ? "Unregistering eventhandler: ".concat(valueOf) : new String("Unregistering eventhandler: "));
            this.zzbuq.zzb(next.getKey(), next.getValue());
        }
        this.zzbur.clear();
    }
}
