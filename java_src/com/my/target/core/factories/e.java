package com.my.target.core.factories;

import com.my.target.core.models.sections.f;
import com.my.target.core.models.sections.g;
import com.my.target.core.models.sections.h;
import com.my.target.core.models.sections.i;
import com.my.target.core.models.sections.j;
/* compiled from: SectionsFactory.java */
/* loaded from: classes2.dex */
public final class e {
    public static i a(String str, int i) {
        String a = com.my.target.core.enums.b.a(str);
        if (a != null) {
            if (a.equals("standard")) {
                return new j(str, i);
            }
            if (a.equals("showcase") || a.equals("appwall")) {
                return new com.my.target.core.models.sections.b(str, i);
            }
            if (a.equals("fullscreen")) {
                return new com.my.target.core.models.sections.d(str, i);
            }
            if (a.equals("nativeads")) {
                return new h(str, i);
            }
            if (a.equals("instreamads")) {
                return new f(str, i);
            }
            if (a.equals("fullscreenslider")) {
                return new com.my.target.core.models.sections.e(str, i);
            }
            if (a.equals("instreamaudioads")) {
                return new g(str, i);
            }
        }
        return null;
    }
}
