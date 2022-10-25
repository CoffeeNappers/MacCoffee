package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Matrix;
import android.util.AttributeSet;
import android.widget.ImageView;
/* loaded from: classes3.dex */
public class OverlayImageViewTopCrop extends OverlayImageView {
    public OverlayImageViewTopCrop(Context context) {
        super(context);
        setScaleType(ImageView.ScaleType.MATRIX);
    }

    public OverlayImageViewTopCrop(Context context, AttributeSet attrs) {
        super(context, attrs);
        setScaleType(ImageView.ScaleType.MATRIX);
    }

    public OverlayImageViewTopCrop(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        setScaleType(ImageView.ScaleType.MATRIX);
    }

    @Override // android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        recomputeImgMatrix();
    }

    @Override // android.widget.ImageView
    protected boolean setFrame(int l, int t, int r, int b) {
        recomputeImgMatrix();
        return super.setFrame(l, t, r, b);
    }

    private void recomputeImgMatrix() {
        float scale;
        if (getDrawable() != null) {
            Matrix matrix = getImageMatrix();
            int viewWidth = (getWidth() - getPaddingLeft()) - getPaddingRight();
            int viewHeight = (getHeight() - getPaddingTop()) - getPaddingBottom();
            int drawableWidth = getDrawable().getIntrinsicWidth();
            int drawableHeight = getDrawable().getIntrinsicHeight();
            if (drawableWidth * viewHeight > drawableHeight * viewWidth) {
                scale = viewHeight / drawableHeight;
            } else {
                scale = viewWidth / drawableWidth;
            }
            matrix.setScale(scale, scale);
            setImageMatrix(matrix);
        }
    }
}
