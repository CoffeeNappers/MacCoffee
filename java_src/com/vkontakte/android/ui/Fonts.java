package com.vkontakte.android.ui;

import android.graphics.Typeface;
/* loaded from: classes3.dex */
public class Fonts {
    private static Typeface lightTypeface;

    public static Typeface getRobotoLight() {
        if (lightTypeface != null) {
            return lightTypeface;
        }
        Typeface create = Typeface.create("sans-serif-light", 0);
        lightTypeface = create;
        return create;
    }
}
