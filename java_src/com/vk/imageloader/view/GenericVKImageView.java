package com.vk.imageloader.view;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.generic.GenericDraweeHierarchy;
import com.facebook.drawee.generic.GenericDraweeHierarchyBuilder;
import com.facebook.drawee.generic.GenericDraweeHierarchyInflater;
/* loaded from: classes2.dex */
public class GenericVKImageView extends VKDraweeView<GenericDraweeHierarchy> {
    public static final float MAX_ASPECT_RATIO = 3.33f;
    public static final float MIN_ASPECT_RATIO = 0.3f;
    private float aspectRatio;
    private int fixedHeight;
    private int fixedWidth;
    private boolean hasOverlappingRendering;
    private float maxAspectRatio;
    private int maxHeight;
    private int maxWidth;
    private float minAspectRatio;

    public GenericVKImageView(Context context) {
        this(context, null);
    }

    public GenericVKImageView(Context context, AttributeSet attrs) {
        this(context, null, 0);
    }

    public GenericVKImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.minAspectRatio = 0.3f;
        this.maxAspectRatio = 3.33f;
        this.aspectRatio = 0.0f;
        this.fixedWidth = -1;
        this.fixedHeight = -1;
        this.hasOverlappingRendering = true;
        init(context, attrs);
    }

    private void init(Context context, @Nullable AttributeSet attrs) {
        GenericDraweeHierarchyBuilder builder = GenericDraweeHierarchyInflater.inflateBuilder(context, attrs);
        builder.setFadeDuration(300);
        buildHierarchy(builder);
        setAspectRatio(builder.getDesiredAspectRatio());
        setHierarchy(builder.build());
    }

    protected void buildHierarchy(GenericDraweeHierarchyBuilder builder) {
    }

    public void setAspectRatio(float w, float h) {
        if (w != 0.0f && h != 0.0f) {
            setAspectRatio(w / h);
        }
    }

    public int getFixedWidth() {
        return this.fixedWidth;
    }

    public int getFixedHeight() {
        return this.fixedHeight;
    }

    public void setFixedSize(int fixedWidth, int fixedHeight) {
        this.fixedWidth = fixedWidth;
        this.fixedHeight = fixedHeight;
        requestLayout();
    }

    public void setFixedSize(int fixedSize) {
        setFixedSize(fixedSize, fixedSize);
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
    public boolean hasOverlappingRendering() {
        return this.hasOverlappingRendering;
    }

    public void setHasOverlappingRendering(boolean hasOverlappingRendering) {
        this.hasOverlappingRendering = hasOverlappingRendering;
    }

    public void setAspectRatio(float aspectRatio) {
        if (aspectRatio != this.aspectRatio) {
            this.aspectRatio = aspectRatio;
            requestLayout();
        }
    }

    public float getAspectRatio() {
        return this.aspectRatio;
    }

    private float clampAspectRatio(float ar) {
        if (ar < this.minAspectRatio || ar > this.maxAspectRatio) {
            if (ar < this.minAspectRatio) {
                return this.minAspectRatio;
            }
            return this.maxAspectRatio;
        }
        return ar;
    }

    public float getMinAspectRatio() {
        return this.minAspectRatio;
    }

    public void setMinAspectRatio(float minAspectRatio) {
        this.minAspectRatio = minAspectRatio;
    }

    public float getMaxAspectRatio() {
        return this.maxAspectRatio;
    }

    public void setMaxAspectRatio(float maxAspectRatio) {
        this.maxAspectRatio = maxAspectRatio;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.widget.ImageView, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (this.fixedWidth >= 0 && this.fixedHeight >= 0) {
            super.onMeasure(View.MeasureSpec.makeMeasureSpec(this.fixedWidth, 1073741824), View.MeasureSpec.makeMeasureSpec(this.fixedHeight, 1073741824));
        } else if (this.aspectRatio > 0.0f) {
            float targetAspectRatio = clampAspectRatio(this.aspectRatio);
            int targetWidth = View.MeasureSpec.getSize(widthMeasureSpec);
            int targetHeight = (int) Math.ceil(targetWidth / targetAspectRatio);
            if (targetHeight > this.maxHeight && this.maxHeight > 0 && targetHeight > 0) {
                float downScale = this.maxHeight / targetHeight;
                targetHeight = (int) (targetHeight * downScale);
                targetWidth = (int) (targetWidth * downScale);
            }
            if (targetWidth > this.maxWidth && this.maxWidth > 0 && targetWidth > 0) {
                float downScale2 = this.maxWidth / targetWidth;
                targetHeight = (int) (targetHeight * downScale2);
                targetWidth = (int) (targetWidth * downScale2);
            }
            super.onMeasure(View.MeasureSpec.makeMeasureSpec(targetWidth, 1073741824), View.MeasureSpec.makeMeasureSpec(targetHeight, 1073741824));
        } else {
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }
    }

    public void setPlaceholderColor(int color) {
        getHierarchy().setPlaceholderImage(new ColorDrawable(color));
    }

    public void setPlaceholderImage(Drawable drawable) {
        getHierarchy().setPlaceholderImage(drawable);
    }

    public void setPlaceholderImage(int resId) {
        getHierarchy().setPlaceholderImage(resId);
    }

    public void setErrorImage(Drawable drawable) {
        getHierarchy().setFailureImage(drawable);
    }

    public void setErrorImage(int resId) {
        getHierarchy().setFailureImage(resId);
    }

    public void setOverlayImage(Drawable drawable) {
        getHierarchy().setOverlayImage(drawable);
    }

    public void setActualScaleType(ScalingUtils.ScaleType scaleType) {
        getHierarchy().setActualImageScaleType(scaleType);
    }
}
