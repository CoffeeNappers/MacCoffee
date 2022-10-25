package com.vk.attachpicker.util;

import android.graphics.Typeface;
import com.vk.attachpicker.Picker;
import com.vkontakte.android.ui.Font;
/* loaded from: classes2.dex */
public class Fonts {
    private static final FontStore lobsterRegular = new FontStore("fonts/Lobster-Regular.ttf");
    private static final FontStore impact = new FontStore("fonts/Impact.ttf");

    public static Typeface getRobotoRegular() {
        return Font.Regular.typeface;
    }

    public static Typeface getRobotoMedium() {
        return Font.Medium.typeface;
    }

    public static Typeface getRobotoBold() {
        return Font.Bold.typeface;
    }

    public static Typeface getLobsterRegular() {
        return lobsterRegular.getTypeFace();
    }

    public static Typeface getImpact() {
        return impact.getTypeFace();
    }

    /* loaded from: classes2.dex */
    private static class FontStore {
        private final String path;
        private Typeface typeface;

        FontStore(String path) {
            this.path = path;
        }

        Typeface getTypeFace() {
            if (this.typeface == null) {
                this.typeface = Typeface.createFromAsset(Picker.getContext().getAssets(), this.path);
            }
            return this.typeface;
        }
    }
}
