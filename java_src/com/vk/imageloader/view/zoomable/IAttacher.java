package com.vk.imageloader.view.zoomable;

import android.graphics.RectF;
import android.view.GestureDetector;
import android.view.View;
/* loaded from: classes2.dex */
public interface IAttacher {
    public static final float DEFAULT_MAX_SCALE = 3.0f;
    public static final float DEFAULT_MID_SCALE = 1.75f;
    public static final float DEFAULT_MIN_SCALE = 1.0f;
    public static final long ZOOM_DURATION = 200;

    RectF getDisplayRect();

    float getMaximumScale();

    float getMediumScale();

    float getMinimumScale();

    OnPhotoTapListener getOnPhotoTapListener();

    OnViewTapListener getOnViewTapListener();

    float getScale();

    boolean isZoomable();

    void setAllowParentInterceptOnEdge(boolean z);

    void setMaximumScale(float f);

    void setMediumScale(float f);

    void setMinimumScale(float f);

    void setOnDoubleTapListener(GestureDetector.OnDoubleTapListener onDoubleTapListener);

    void setOnLongClickListener(View.OnLongClickListener onLongClickListener);

    void setOnPhotoTapListener(OnPhotoTapListener onPhotoTapListener);

    void setOnScaleChangeListener(OnScaleChangeListener onScaleChangeListener);

    void setOnViewTapListener(OnViewTapListener onViewTapListener);

    void setScale(float f);

    void setScale(float f, float f2, float f3, boolean z);

    void setScale(float f, boolean z);

    void setZoomTransitionDuration(long j);

    void setZoomable(boolean z);

    void update(int i, int i2);
}