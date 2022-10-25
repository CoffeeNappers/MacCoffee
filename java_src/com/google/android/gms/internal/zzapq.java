package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public final class zzapq {
    public static void zzbt(boolean z) {
        if (!z) {
            throw new IllegalArgumentException();
        }
    }

    public static <T> T zzy(T t) {
        if (t == null) {
            throw new NullPointerException();
        }
        return t;
    }
}
