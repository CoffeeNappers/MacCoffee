package com.my.target.core.utils;

import android.text.TextUtils;
/* compiled from: UrlUtils.java */
/* loaded from: classes2.dex */
public final class m {
    private static final String[] a = {"http://play.google.com", "https://play.google.com", "http://market.android.com", "https://market.android.com", "market://", "samsungapps://"};

    public static boolean a(String str) {
        if (!TextUtils.isEmpty(str)) {
            for (String str2 : a) {
                if (str.startsWith(str2)) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public static boolean b(String str) {
        return str.startsWith("samsungapps://");
    }
}
