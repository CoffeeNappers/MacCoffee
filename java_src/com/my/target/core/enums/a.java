package com.my.target.core.enums;

import java.util.Arrays;
/* compiled from: MediaSectionNames.java */
/* loaded from: classes2.dex */
public final class a {
    public static final String[] a = {"preroll", "pauseroll", "midroll", "postroll"};

    public static boolean a(String str) {
        return Arrays.asList(a).contains(str);
    }
}
