package com.vk.attachpicker.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
/* loaded from: classes2.dex */
public class AspectRatioImageView extends ImageView {
    private float aspectRatio;
    private int maxHeight;
    private int maxWidth;

    public AspectRatioImageView(Context context) {
        super(context);
        this.aspectRatio = 1.0f;
    }

    public AspectRatioImageView(Context context, AttributeSet attrs) {
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

    @Override // android.widget.ImageView
    public void setMaxHeight(int maxHeight) {
        super.setMaxHeight(maxHeight);
        this.maxHeight = maxHeight;
    }

    @Override // android.widget.ImageView
    public void setMaxWidth(int maxWidth) {
        super.setMaxWidth(maxWidth);
        this.maxWidth = maxWidth;
    }

    @Override // android.widget.ImageView, android.view.View
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
        if (targetHeight > this.maxHeight && this.maxHeight > 0 && targetHeight > 0) {
            float downScale = this.maxHeight / targetHeight;
            targetHeight = (int) (targetHeight * downScale);
            targetWidth = (int) (targetWidth * downScale);
        } else if (targetWidth > this.maxWidth && this.maxWidth > 0 && targetWidth > 0) {
            float downScale2 = this.maxWidth / targetWidth;
            targetHeight = (int) (targetHeight * downScale2);
            targetWidth = (int) (targetWidth * downScale2);
        }
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(targetWidth, 1073741824), View.MeasureSpec.makeMeasureSpec(targetHeight, 1073741824));
    }
}
