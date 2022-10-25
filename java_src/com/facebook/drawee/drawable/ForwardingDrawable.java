package com.facebook.drawee.drawable;

import android.annotation.TargetApi;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
/* loaded from: classes.dex */
public class ForwardingDrawable extends Drawable implements Drawable.Callback, TransformCallback, TransformAwareDrawable, DrawableParent {
    private static final Matrix sTempTransform = new Matrix();
    private Drawable mCurrentDelegate;
    private final DrawableProperties mDrawableProperties = new DrawableProperties();
    protected TransformCallback mTransformCallback;

    public ForwardingDrawable(Drawable drawable) {
        this.mCurrentDelegate = drawable;
        DrawableUtils.setCallbacks(this.mCurrentDelegate, this, this);
    }

    public Drawable setCurrent(Drawable newDelegate) {
        Drawable previousDelegate = setCurrentWithoutInvalidate(newDelegate);
        invalidateSelf();
        return previousDelegate;
    }

    protected Drawable setCurrentWithoutInvalidate(Drawable newDelegate) {
        Drawable previousDelegate = this.mCurrentDelegate;
        DrawableUtils.setCallbacks(previousDelegate, null, null);
        DrawableUtils.setCallbacks(newDelegate, null, null);
        DrawableUtils.setDrawableProperties(newDelegate, this.mDrawableProperties);
        DrawableUtils.copyProperties(newDelegate, this);
        DrawableUtils.setCallbacks(newDelegate, this, this);
        this.mCurrentDelegate = newDelegate;
        return previousDelegate;
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return this.mCurrentDelegate.getOpacity();
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mDrawableProperties.setAlpha(alpha);
        this.mCurrentDelegate.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.mDrawableProperties.setColorFilter(colorFilter);
        this.mCurrentDelegate.setColorFilter(colorFilter);
    }

    @Override // android.graphics.drawable.Drawable
    public void setDither(boolean dither) {
        this.mDrawableProperties.setDither(dither);
        this.mCurrentDelegate.setDither(dither);
    }

    @Override // android.graphics.drawable.Drawable
    public void setFilterBitmap(boolean filterBitmap) {
        this.mDrawableProperties.setFilterBitmap(filterBitmap);
        this.mCurrentDelegate.setFilterBitmap(filterBitmap);
    }

    @Override // android.graphics.drawable.Drawable
    public boolean setVisible(boolean visible, boolean restart) {
        super.setVisible(visible, restart);
        return this.mCurrentDelegate.setVisible(visible, restart);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.graphics.drawable.Drawable
    public void onBoundsChange(Rect bounds) {
        this.mCurrentDelegate.setBounds(bounds);
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return this.mCurrentDelegate.isStateful();
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] state) {
        return this.mCurrentDelegate.setState(state);
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onLevelChange(int level) {
        return this.mCurrentDelegate.setLevel(level);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        this.mCurrentDelegate.draw(canvas);
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return this.mCurrentDelegate.getIntrinsicWidth();
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.mCurrentDelegate.getIntrinsicHeight();
    }

    @Override // android.graphics.drawable.Drawable
    public boolean getPadding(Rect padding) {
        return this.mCurrentDelegate.getPadding(padding);
    }

    @Override // android.graphics.drawable.Drawable
    public Drawable mutate() {
        this.mCurrentDelegate.mutate();
        return this;
    }

    @Override // android.graphics.drawable.Drawable
    public Drawable getCurrent() {
        return this.mCurrentDelegate;
    }

    @Override // com.facebook.drawee.drawable.DrawableParent
    public Drawable setDrawable(Drawable newDrawable) {
        return setCurrent(newDrawable);
    }

    @Override // com.facebook.drawee.drawable.DrawableParent
    public Drawable getDrawable() {
        return getCurrent();
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void invalidateDrawable(Drawable who) {
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void scheduleDrawable(Drawable who, Runnable what, long when) {
        scheduleSelf(what, when);
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void unscheduleDrawable(Drawable who, Runnable what) {
        unscheduleSelf(what);
    }

    @Override // com.facebook.drawee.drawable.TransformAwareDrawable
    public void setTransformCallback(TransformCallback transformCallback) {
        this.mTransformCallback = transformCallback;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void getParentTransform(Matrix transform) {
        if (this.mTransformCallback != null) {
            this.mTransformCallback.getTransform(transform);
        } else {
            transform.reset();
        }
    }

    @Override // com.facebook.drawee.drawable.TransformCallback
    public void getTransform(Matrix transform) {
        getParentTransform(transform);
    }

    @Override // com.facebook.drawee.drawable.TransformCallback
    public void getRootBounds(RectF bounds) {
        if (this.mTransformCallback != null) {
            this.mTransformCallback.getRootBounds(bounds);
        } else {
            bounds.set(getBounds());
        }
    }

    public void getTransformedBounds(RectF outBounds) {
        getParentTransform(sTempTransform);
        outBounds.set(getBounds());
        sTempTransform.mapRect(outBounds);
    }

    @Override // android.graphics.drawable.Drawable
    @TargetApi(21)
    public void setHotspot(float x, float y) {
        this.mCurrentDelegate.setHotspot(x, y);
    }
}
