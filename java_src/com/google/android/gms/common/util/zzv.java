package com.google.android.gms.common.util;

import java.util.regex.Pattern;
/* loaded from: classes2.dex */
public class zzv {
    private static final Pattern GG = Pattern.compile("\\$\\{(.*?)\\}");

    public static boolean zzij(String str) {
        return str == null || str.trim().isEmpty();
    }
}
