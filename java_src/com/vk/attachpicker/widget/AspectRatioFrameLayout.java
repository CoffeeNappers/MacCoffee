package com.vk.attachpicker.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
/* loaded from: classes2.dex */
public class AspectRatioFrameLayout extends FrameLayout {
    private float aspectRatio;

    public AspectRatioFrameLayout(Context context) {
        super(context);
        this.aspectRatio = 1.0f;
    }

    public AspectRatioFrameLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.aspectRatio = 1.0f;
    }

    public float getAspectRatio() {
        return this.aspectRatio;
    }

    public void setAspectRatio(float aspectRatio) {
        this.aspectRatio = aspectRatio;
        requestLayout();
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int targetWidth;
        int targetHeight;
        int width = View.MeasureSpec.getSize(widthMeasureSpec);
        int height = View.MeasureSpec.getSize(heightMeasureSpec);
        float availableAspectRatio = width / height;
        if (this.aspectRatio == 1.0f) {
            targetWidth = Math.min(width, height);
            targetHeight = Math.min(width, height);
        } else if (this.aspectRatio > 1.0f) {
            if (availableAspectRatio <= this.aspectRatio) {
                targetWidth = width;
                targetHeight = (int) (width / this.aspectRatio);
            } else {
                targetWidth = (int) (height * this.aspectRatio);
                targetHeight = height;
            }
        } else if (availableAspectRatio >= this.aspectRatio) {
            targetWidth = (int) (height * this.aspectRatio);
            targetHeight = height;
        } else {
            targetWidth = width;
            targetHeight = (int) (width / this.aspectRatio);
        }
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(targetWidth, 1073741824), View.MeasureSpec.makeMeasureSpec(targetHeight, 1073741824));
    }
}
