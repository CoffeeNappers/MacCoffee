package com.my.target.core.utils;
/* compiled from: ArrayUtils.java */
/* loaded from: classes2.dex */
public final class c {
    public static String a(String[] strArr) {
        String str = null;
        int length = strArr.length;
        int i = 0;
        while (i < length) {
            String str2 = strArr[i];
            if (str != null) {
                str2 = str + "," + str2;
            }
            i++;
            str = str2;
        }
        return str == null ? "" : str;
    }
}
