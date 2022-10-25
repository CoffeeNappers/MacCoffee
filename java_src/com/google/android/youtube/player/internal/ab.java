package com.google.android.youtube.player.internal;

import android.text.TextUtils;
/* loaded from: classes2.dex */
public final class ab {
    public static <T> T a(T t) {
        if (t == null) {
            throw new NullPointerException("null reference");
        }
        return t;
    }

    public static <T> T a(T t, Object obj) {
        if (t == null) {
            throw new NullPointerException(String.valueOf(obj));
        }
        return t;
    }

    public static String a(String str, Object obj) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException(String.valueOf(obj));
        }
        return str;
    }

    public static void a(boolean z) {
        if (!z) {
            throw new IllegalStateException();
        }
    }
}
