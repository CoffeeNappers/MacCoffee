package com.my.target.core.enums;

import com.google.android.exoplayer2.util.MimeTypes;
/* compiled from: Sections.java */
/* loaded from: classes2.dex */
public abstract class b {
    private static String[] a = {"standard", "showcase", "appwall", "fullscreenslider", "fullscreen", "nativeads", "instreamads", "video", "instreamaudioads", MimeTypes.BASE_TYPE_AUDIO};

    public static String a(String str) {
        String[] strArr;
        for (String str2 : a) {
            if (str.indexOf(str2) == 0) {
                return str2;
            }
        }
        return null;
    }
}
