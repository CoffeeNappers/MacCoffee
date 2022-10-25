package com.vk.imageloader.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.generic.GenericDraweeHierarchyBuilder;
/* loaded from: classes2.dex */
public class VKHorizontalParallaxImageView extends VKImageView implements ScalingUtils.ScaleType {
    private final Matrix drawMatrix;
    private float offset;

    public VKHorizontalParallaxImageView(Context context) {
        super(context);
        this.drawMatrix = new Matrix();
        this.offset = 0.0f;
    }

    public VKHorizontalParallaxImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.drawMatrix = new Matrix();
        this.offset = 0.0f;
    }

    public VKHorizontalParallaxImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.drawMatrix = new Matrix();
        this.offset = 0.0f;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.imageloader.view.VKImageView, com.vk.imageloader.view.GenericVKImageView
    public void buildHierarchy(GenericDraweeHierarchyBuilder builder) {
        builder.setActualImageScaleType(this);
    }

    @Override // com.facebook.drawee.drawable.ScalingUtils.ScaleType
    public Matrix getTransform(Matrix outTransform, Rect parentBounds, int childWidth, int childHeight, float focusX, float focusY) {
        float scale = parentBounds.height() / childHeight;
        outTransform.setScale(scale, scale);
        return outTransform;
    }

    public float getOffset() {
        return this.offset;
    }

    public void setOffset(float offset) {
        this.offset = offset;
        invalidate();
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        if (hasImage()) {
            float scale = canvas.getHeight() / getImageHeight();
            int iw = (int) (getImageWidth() * scale);
            int ih = (int) (getImageHeight() * scale);
            int wd = iw - canvas.getWidth();
            int x = Math.round(wd * this.offset) % iw;
            Drawable d = getHierarchy().getTopLevelDrawable();
            if (d != null) {
                d.setBounds(0, 0, iw, ih);
                this.drawMatrix.setTranslate(x - iw, 0.0f);
                canvas.save();
                canvas.concat(this.drawMatrix);
                d.draw(canvas);
                canvas.restore();
                this.drawMatrix.setTranslate(x, 0.0f);
                canvas.save();
                canvas.concat(this.drawMatrix);
                d.draw(canvas);
                canvas.restore();
                this.drawMatrix.setTranslate(x + iw, 0.0f);
                canvas.save();
                canvas.concat(this.drawMatrix);
                d.draw(canvas);
                canvas.restore();
                return;
            }
            return;
        }
        super.onDraw(canvas);
    }
}
