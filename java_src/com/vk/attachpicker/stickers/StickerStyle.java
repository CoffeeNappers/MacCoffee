package com.vk.attachpicker.stickers;

import android.graphics.Typeface;
import com.vk.attachpicker.util.Fonts;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public enum StickerStyle {
    ROBOTO_BOLD(R.drawable.picker_ic_text_font_1_shadow_48dp, Fonts.getRobotoBold(), Screen.dp(40), true, true, true, true, false, 0),
    LOBSTER_REGULAR(R.drawable.picker_ic_text_font_2_shadow_48dp, Fonts.getLobsterRegular(), Screen.dp(40), true, true, true, true, false, 0),
    IMPACT(R.drawable.picker_ic_text_font_3_shadow_48dp, Fonts.getImpact(), Screen.dp(40), true, true, true, true, false, 0),
    ROBOTO_FIXED(R.drawable.picker_ic_text_font_4_shadow_48dp, Fonts.getRobotoRegular(), Screen.dp(18), false, false, false, true, true, 2130706432);
    
    final int background;
    final boolean canRotate;
    final boolean canScale;
    final boolean canTranslateX;
    final boolean canTranslateY;
    final int fontSize;
    final boolean fullWidth;
    final int iconResId;
    final Typeface typeface;

    StickerStyle(int iconResId, Typeface typeface, int fontSize, boolean canRotate, boolean canScale, boolean canTranslateX, boolean canTranslateY, boolean fullWidth, int background) {
        this.iconResId = iconResId;
        this.typeface = typeface;
        this.fontSize = fontSize;
        this.canRotate = canRotate;
        this.canScale = canScale;
        this.canTranslateX = canTranslateX;
        this.canTranslateY = canTranslateY;
        this.fullWidth = fullWidth;
        this.background = background;
    }

    public boolean fixedStyle() {
        return !this.canTranslateX || !this.canTranslateY || !this.canRotate || !this.canScale;
    }
}
