package com.google.android.gms.internal;

import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzaoa {
    private long blA;
    private Map<String, zzanv> blB;
    private boolean blp;
    private int blx;

    public zzaoa() {
        this(-1L);
    }

    public zzaoa(int i, long j, Map<String, zzanv> map, boolean z) {
        this.blx = i;
        this.blA = j;
        this.blB = map == null ? new HashMap<>() : map;
        this.blp = z;
    }

    public zzaoa(long j) {
        this(0, j, null, false);
    }

    public Map<String, zzanv> Y() {
        return this.blB;
    }

    public long Z() {
        return this.blA;
    }

    public int getLastFetchStatus() {
        return this.blx;
    }

    public boolean isDeveloperModeEnabled() {
        return this.blp;
    }

    public void zza(String str, zzanv zzanvVar) {
        this.blB.put(str, zzanvVar);
    }

    public void zzagf(int i) {
        this.blx = i;
    }

    public void zzch(Map<String, zzanv> map) {
        if (map == null) {
            map = new HashMap<>();
        }
        this.blB = map;
    }

    public void zzcq(long j) {
        this.blA = j;
    }

    public void zzdd(boolean z) {
        this.blp = z;
    }

    public void zzud(String str) {
        if (this.blB.get(str) == null) {
            return;
        }
        this.blB.remove(str);
    }
}
