package com.vkontakte.android.attachments;

import android.support.annotation.Nullable;
import com.vkontakte.android.ui.FlowLayout;
/* loaded from: classes.dex */
public interface ThumbAttachment {
    int getHeight();

    float getRatio();

    String getThumbURL();

    int getWidth();

    int getWidth(char c);

    @Nullable
    FlowLayout.LayoutParams overrideLayoutParams();

    void setViewSize(float f, float f2, boolean z, boolean z2);
}
