package com.google.android.gms.analytics;

import com.google.android.gms.analytics.internal.zzae;
/* loaded from: classes2.dex */
public final class zzc {
    public static String zzbl(int i) {
        return zzc("&cd", i);
    }

    public static String zzbm(int i) {
        return zzc("cd", i);
    }

    public static String zzbn(int i) {
        return zzc("&cm", i);
    }

    public static String zzbo(int i) {
        return zzc("cm", i);
    }

    public static String zzbp(int i) {
        return zzc("&pr", i);
    }

    public static String zzbq(int i) {
        return zzc("pr", i);
    }

    public static String zzbr(int i) {
        return zzc("&promo", i);
    }

    public static String zzbs(int i) {
        return zzc("promo", i);
    }

    public static String zzbt(int i) {
        return zzc("pi", i);
    }

    public static String zzbu(int i) {
        return zzc("&il", i);
    }

    public static String zzbv(int i) {
        return zzc("il", i);
    }

    public static String zzbw(int i) {
        return zzc("cd", i);
    }

    public static String zzbx(int i) {
        return zzc("cm", i);
    }

    private static String zzc(String str, int i) {
        if (i < 1) {
            zzae.zzf("index out of range for prefix", str);
            return "";
        }
        return new StringBuilder(String.valueOf(str).length() + 11).append(str).append(i).toString();
    }
}
