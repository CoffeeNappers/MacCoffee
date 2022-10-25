package com.vk.attachpicker.crop;

import android.graphics.RectF;
/* loaded from: classes2.dex */
public interface CropAreaProvider {
    float getCenterX();

    float getCenterY();

    float getCropAspectRatio();

    float getCropHeight();

    RectF getCropRect();

    float getCropScale();

    float getCropWidth();

    float getX0();

    float getX1();

    float getY0();

    float getY1();
}
