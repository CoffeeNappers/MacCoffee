package com.vk.attachpicker.crop;

import android.content.Context;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import com.vk.attachpicker.crop.RectCropOverlayView;
/* loaded from: classes2.dex */
public abstract class CropOverlayView extends View implements CropAreaProvider {
    public abstract RectF calculatePosition(float f);

    public abstract void initWithAspectRatio(float f);

    public abstract void setForcedAspectRatio(float f, float f2, boolean z);

    public abstract void setLinesAndTransparentOverlayVisible(boolean z);

    public abstract void setOnCropChangeListener(RectCropOverlayView.OnCropChangeListener onCropChangeListener);

    public abstract void setTopSidePadding(float f);

    public abstract void setTouchEnabled(boolean z);

    public abstract void setX0(float f);

    public abstract void setX1(float f);

    public abstract void setY0(float f);

    public abstract void setY1(float f);

    public CropOverlayView(Context context) {
        super(context);
    }

    public CropOverlayView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public CropOverlayView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }
}
