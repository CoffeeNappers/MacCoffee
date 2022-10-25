package com.vk.imageloader.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.RectF;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import com.vk.imageloader.OnLoadCallback;
import com.vk.imageloader.view.zoomable.Attacher;
import com.vk.imageloader.view.zoomable.IAttacher;
import com.vk.imageloader.view.zoomable.OnPhotoTapListener;
import com.vk.imageloader.view.zoomable.OnScaleChangeListener;
import com.vk.imageloader.view.zoomable.OnViewTapListener;
/* loaded from: classes2.dex */
public class VKZoomableImageView extends VKImageView implements IAttacher {
    private Attacher mAttacher;

    public VKZoomableImageView(Context context) {
        this(context, null, 0);
    }

    public VKZoomableImageView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public VKZoomableImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
        setOnLoadCallback(new OnLoadCallback() { // from class: com.vk.imageloader.view.VKZoomableImageView.1
            @Override // com.vk.imageloader.OnLoadCallback
            public void onSuccess(int width, int height) {
                VKZoomableImageView.this.update(width, height);
            }

            @Override // com.vk.imageloader.OnLoadCallback
            public void onFailure() {
            }
        });
    }

    private void init() {
        if (this.mAttacher == null || this.mAttacher.getDraweeView() == null) {
            this.mAttacher = new Attacher(this);
        }
    }

    @Override // com.vk.imageloader.view.VKDraweeView, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        return super.onTouchEvent(event);
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(@NonNull Canvas canvas) {
        int saveCount = canvas.save();
        canvas.concat(this.mAttacher.getDrawMatrix());
        super.onDraw(canvas);
        canvas.restoreToCount(saveCount);
    }

    @Override // com.vk.imageloader.view.VKDraweeView, android.widget.ImageView, android.view.View
    protected void onAttachedToWindow() {
        init();
        super.onAttachedToWindow();
    }

    @Override // com.vk.imageloader.view.VKDraweeView, android.widget.ImageView, android.view.View
    protected void onDetachedFromWindow() {
        this.mAttacher.onDetachedFromWindow();
        super.onDetachedFromWindow();
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public boolean isZoomable() {
        return this.mAttacher.isZoomable();
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setZoomable(boolean zoomable) {
        this.mAttacher.setZoomable(zoomable);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public float getMinimumScale() {
        return this.mAttacher.getMinimumScale();
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public float getMediumScale() {
        return this.mAttacher.getMediumScale();
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public float getMaximumScale() {
        return this.mAttacher.getMaximumScale();
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setMinimumScale(float minimumScale) {
        this.mAttacher.setMinimumScale(minimumScale);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setMediumScale(float mediumScale) {
        this.mAttacher.setMediumScale(mediumScale);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setMaximumScale(float maximumScale) {
        this.mAttacher.setMaximumScale(maximumScale);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public float getScale() {
        return this.mAttacher.getScale();
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setScale(float scale) {
        this.mAttacher.setScale(scale);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setScale(float scale, boolean animate) {
        this.mAttacher.setScale(scale, animate);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setScale(float scale, float focalX, float focalY, boolean animate) {
        this.mAttacher.setScale(scale, focalX, focalY, animate);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setZoomTransitionDuration(long duration) {
        this.mAttacher.setZoomTransitionDuration(duration);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setAllowParentInterceptOnEdge(boolean allow) {
        this.mAttacher.setAllowParentInterceptOnEdge(allow);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setOnDoubleTapListener(GestureDetector.OnDoubleTapListener listener) {
        this.mAttacher.setOnDoubleTapListener(listener);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setOnScaleChangeListener(OnScaleChangeListener listener) {
        this.mAttacher.setOnScaleChangeListener(listener);
    }

    @Override // android.view.View, com.vk.imageloader.view.zoomable.IAttacher
    public void setOnLongClickListener(View.OnLongClickListener listener) {
        this.mAttacher.setOnLongClickListener(listener);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setOnPhotoTapListener(OnPhotoTapListener listener) {
        this.mAttacher.setOnPhotoTapListener(listener);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void setOnViewTapListener(OnViewTapListener listener) {
        this.mAttacher.setOnViewTapListener(listener);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public OnPhotoTapListener getOnPhotoTapListener() {
        return this.mAttacher.getOnPhotoTapListener();
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public OnViewTapListener getOnViewTapListener() {
        return this.mAttacher.getOnViewTapListener();
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public void update(int imageInfoWidth, int imageInfoHeight) {
        this.mAttacher.update(imageInfoWidth, imageInfoHeight);
    }

    @Override // com.vk.imageloader.view.zoomable.IAttacher
    public RectF getDisplayRect() {
        return this.mAttacher.getDisplayRect();
    }
}
