package com.my.tracker.net;

import android.text.TextUtils;
/* compiled from: Hosts.java */
/* loaded from: classes2.dex */
public final class a {
    private static String a = "https://tracker-api.my.com/v2/";
    private static String b;

    public static String a() {
        return !TextUtils.isEmpty(b) ? b : a;
    }
}
