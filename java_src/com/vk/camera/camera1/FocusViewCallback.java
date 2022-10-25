package com.vk.camera.camera1;

import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public interface FocusViewCallback {
    public static final int FOCUS_SIZE = Screen.dp(72);

    void clear();

    void setFocus(int i, int i2);

    void showFail(boolean z);

    void showStart();

    void showSuccess(boolean z);
}
