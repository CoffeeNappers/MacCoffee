package com.google.android.gms.analytics.internal;
/* loaded from: classes2.dex */
public enum zzo {
    NONE,
    GZIP;

    public static zzo zzfc(String str) {
        return "GZIP".equalsIgnoreCase(str) ? GZIP : NONE;
    }
}
