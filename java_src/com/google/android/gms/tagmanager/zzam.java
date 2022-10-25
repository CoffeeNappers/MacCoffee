package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public abstract class zzam {
    private final Set<String> aFo;
    private final String aFp;

    public zzam(String str, String... strArr) {
        this.aFp = str;
        this.aFo = new HashSet(strArr.length);
        for (String str2 : strArr) {
            this.aFo.add(str2);
        }
    }

    public abstract zzaj.zza zzay(Map<String, zzaj.zza> map);

    public abstract boolean zzcdu();

    public String zzcfg() {
        return this.aFp;
    }

    public Set<String> zzcfh() {
        return this.aFo;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzf(Set<String> set) {
        return set.containsAll(this.aFo);
    }
}
