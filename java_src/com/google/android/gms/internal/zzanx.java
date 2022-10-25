package com.google.android.gms.internal;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
/* loaded from: classes2.dex */
public class zzanx {
    private Map<String, Map<String, byte[]>> blv;
    private long vO;

    public zzanx(Map<String, Map<String, byte[]>> map, long j) {
        this.blv = map;
        this.vO = j;
    }

    public Map<String, Map<String, byte[]>> V() {
        return this.blv;
    }

    public boolean W() {
        return this.blv != null && !this.blv.isEmpty();
    }

    public long getTimestamp() {
        return this.vO;
    }

    public void setTimestamp(long j) {
        this.vO = j;
    }

    public boolean zzbv(String str, String str2) {
        return W() && zzuc(str2) && zzbw(str, str2) != null;
    }

    public byte[] zzbw(String str, String str2) {
        if (str == null || !zzuc(str2)) {
            return null;
        }
        return this.blv.get(str2).get(str);
    }

    public Set<String> zzbx(String str, String str2) {
        TreeSet treeSet = new TreeSet();
        if (!zzuc(str2)) {
            return treeSet;
        }
        if (str == null || str.isEmpty()) {
            return this.blv.get(str2).keySet();
        }
        for (String str3 : this.blv.get(str2).keySet()) {
            if (str3.startsWith(str)) {
                treeSet.add(str3);
            }
        }
        return treeSet;
    }

    public void zzk(Map<String, byte[]> map, String str) {
        if (this.blv == null) {
            this.blv = new HashMap();
        }
        this.blv.put(str, map);
    }

    public boolean zzuc(String str) {
        if (str == null) {
            return false;
        }
        return W() && this.blv.get(str) != null && !this.blv.get(str).isEmpty();
    }
}
