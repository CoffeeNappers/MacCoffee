package com.google.android.gms.internal;

import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public class zzair {
    private final List<List<String>> baC;
    private final List<String> baD;

    public zzair(List<List<String>> list, List<String> list2) {
        if (list.size() != list2.size() - 1) {
            throw new IllegalArgumentException("Number of posts need to be n-1 for n hashes in CompoundHash");
        }
        this.baC = list;
        this.baD = list2;
    }

    public List<List<String>> zzcsf() {
        return Collections.unmodifiableList(this.baC);
    }

    public List<String> zzcsg() {
        return Collections.unmodifiableList(this.baD);
    }
}
