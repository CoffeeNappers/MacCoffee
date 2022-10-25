package com.google.android.gms.internal;

import java.lang.Comparable;
import java.util.Comparator;
/* loaded from: classes2.dex */
public class zzaiq<A extends Comparable<A>> implements Comparator<A> {
    private static zzaiq baB = new zzaiq();

    private zzaiq() {
    }

    public static <T extends Comparable<T>> zzaiq<T> zzi(Class<T> cls) {
        return baB;
    }

    @Override // java.util.Comparator
    /* renamed from: zza */
    public int compare(A a, A a2) {
        return a.compareTo(a2);
    }
}
