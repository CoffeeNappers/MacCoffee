package com.google.android.gms.analytics.internal;
/* loaded from: classes.dex */
public class zze {
    public static final String VERSION = String.valueOf(com.google.android.gms.common.zzc.GOOGLE_PLAY_SERVICES_VERSION_CODE / 1000).replaceAll("(\\d+)(\\d)(\\d\\d)", "$1.$2.$3");
    public static final String cS;

    static {
        String valueOf = String.valueOf(VERSION);
        cS = valueOf.length() != 0 ? "ma".concat(valueOf) : new String("ma");
    }
}
