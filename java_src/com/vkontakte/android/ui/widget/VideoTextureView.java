package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.TextureView;
import android.view.ViewParent;
/* loaded from: classes3.dex */
public class VideoTextureView extends TextureView {
    private OnVideoTextureCallback mCallback;
    private float mVideoHeight;
    private float mVideoWidth;

    /* loaded from: classes3.dex */
    public interface OnVideoTextureCallback {
        void onDetachedFromWindow();
    }

    public VideoTextureView(Context context) {
        super(context);
        this.mVideoWidth = -1.0f;
        this.mVideoHeight = -1.0f;
    }

    public VideoTextureView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mVideoWidth = -1.0f;
        this.mVideoHeight = -1.0f;
    }

    public void setCallback(OnVideoTextureCallback callback) {
        this.mCallback = callback;
    }

    public void setVideoSize(int width, int height) {
        this.mVideoWidth = width;
        this.mVideoHeight = height;
        ViewParent parent = getParent();
        requestLayout();
        if (parent != null) {
            parent.requestLayout();
        }
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int width;
        int height;
        int parentWidth = getDefaultSize(getSuggestedMinimumWidth(), widthMeasureSpec);
        int parentHeight = getDefaultSize(getSuggestedMinimumHeight(), heightMeasureSpec);
        if (this.mVideoWidth <= 0.0f || this.mVideoHeight <= 0.0f || parentWidth <= 0 || parentHeight <= 0) {
            setMeasuredDimension(parentWidth, parentHeight);
            return;
        }
        float sratio = parentWidth / parentHeight;
        float vratio = this.mVideoWidth / this.mVideoHeight;
        if (sratio > vratio) {
            height = parentHeight;
            width = (int) (height * vratio);
        } else {
            width = parentWidth;
            height = (int) (width / vratio);
        }
        setMeasuredDimension(width, height);
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        try {
            super.onDetachedFromWindow();
            if (this.mCallback != null) {
                this.mCallback.onDetachedFromWindow();
            }
        } catch (Throwable th) {
        }
    }
}
