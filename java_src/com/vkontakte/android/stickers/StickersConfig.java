package com.vkontakte.android.stickers;

import com.vk.core.util.Screen;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
/* loaded from: classes3.dex */
public class StickersConfig {
    public static final int FORCE_INAPP = 0;
    public static final int KEYBOARD_COLUMNS_COUNT = 4;
    public static final int KEYBOARD_COLUMNS_COUNT_LANDSCAPE;
    public static final int KEYBOARD_PADDING = Global.scale(3.0f);
    public static final int KEYBOARD_THUMB_SIZE;
    public static final int PREVIEW_SIZE;
    public static final int STICKER_AUTOSUGGEST_ITEM_SIZE;
    public static final int STICKER_KEYBOARD_SIZE;
    public static final int STICKER_SIZE;

    private StickersConfig() {
    }

    static {
        KEYBOARD_COLUMNS_COUNT_LANDSCAPE = Screen.isTablet() ? 4 : 6;
        KEYBOARD_THUMB_SIZE = Global.scale(34.0f);
        STICKER_SIZE = Global.scale(176.0f);
        PREVIEW_SIZE = Math.min(Screen.isTablet() ? Global.scale(250.0f) : STICKER_SIZE, 512);
        STICKER_AUTOSUGGEST_ITEM_SIZE = VKApplication.context.getResources().getDimensionPixelSize(R.dimen.sticker_suggest_size);
        int keyboardWidth = Screen.isTablet() ? KeyboardPopup.TABLE_WIDTH : VKApplication.context.getResources().getDisplayMetrics().widthPixels;
        int keyboardHeight = Screen.isTablet() ? KeyboardPopup.TABLET_HEIGHT : VKApplication.context.getResources().getDisplayMetrics().heightPixels;
        STICKER_KEYBOARD_SIZE = Math.min(Screen.isTablet() ? KeyboardPopup.TABLE_WIDTH / 4 : Math.max((keyboardWidth - KEYBOARD_PADDING) / 4, (keyboardHeight - KEYBOARD_PADDING) / KEYBOARD_COLUMNS_COUNT_LANDSCAPE), 512);
    }
}
