package com.facebook.drawee.drawable;

import android.annotation.TargetApi;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import com.facebook.common.internal.Preconditions;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class ArrayDrawable extends Drawable implements Drawable.Callback, TransformCallback, TransformAwareDrawable {
    private final DrawableParent[] mDrawableParents;
    private final Drawable[] mLayers;
    private TransformCallback mTransformCallback;
    private final DrawableProperties mDrawableProperties = new DrawableProperties();
    private final Rect mTmpRect = new Rect();
    private boolean mIsStateful = false;
    private boolean mIsStatefulCalculated = false;
    private boolean mIsMutated = false;

    public ArrayDrawable(Drawable[] layers) {
        Preconditions.checkNotNull(layers);
        this.mLayers = layers;
        for (int i = 0; i < this.mLayers.length; i++) {
            DrawableUtils.setCallbacks(this.mLayers[i], this, this);
        }
        this.mDrawableParents = new DrawableParent[this.mLayers.length];
    }

    public int getNumberOfLayers() {
        return this.mLayers.length;
    }

    @Nullable
    public Drawable getDrawable(int index) {
        boolean z = true;
        Preconditions.checkArgument(index >= 0);
        if (index >= this.mLayers.length) {
            z = false;
        }
        Preconditions.checkArgument(z);
        return this.mLayers[index];
    }

    @Nullable
    public Drawable setDrawable(int index, @Nullable Drawable drawable) {
        boolean z = true;
        Preconditions.checkArgument(index >= 0);
        if (index >= this.mLayers.length) {
            z = false;
        }
        Preconditions.checkArgument(z);
        Drawable oldDrawable = this.mLayers[index];
        if (drawable != oldDrawable) {
            if (drawable != null && this.mIsMutated) {
                drawable.mutate();
            }
            DrawableUtils.setCallbacks(this.mLayers[index], null, null);
            DrawableUtils.setCallbacks(drawable, null, null);
            DrawableUtils.setDrawableProperties(drawable, this.mDrawableProperties);
            DrawableUtils.copyProperties(drawable, this);
            DrawableUtils.setCallbacks(drawable, this, this);
            this.mIsStatefulCalculated = false;
            this.mLayers[index] = drawable;
            invalidateSelf();
        }
        return oldDrawable;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        int width = -1;
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                width = Math.max(width, drawable.getIntrinsicWidth());
            }
        }
        if (width > 0) {
            return width;
        }
        return -1;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        int height = -1;
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                height = Math.max(height, drawable.getIntrinsicHeight());
            }
        }
        if (height > 0) {
            return height;
        }
        return -1;
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                drawable.setBounds(bounds);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        if (!this.mIsStatefulCalculated) {
            this.mIsStateful = false;
            for (int i = 0; i < this.mLayers.length; i++) {
                Drawable drawable = this.mLayers[i];
                this.mIsStateful = (drawable != null && drawable.isStateful()) | this.mIsStateful;
            }
            this.mIsStatefulCalculated = true;
        }
        return this.mIsStateful;
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] state) {
        boolean stateChanged = false;
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null && drawable.setState(state)) {
                stateChanged = true;
            }
        }
        return stateChanged;
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onLevelChange(int level) {
        boolean levelChanged = false;
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null && drawable.setLevel(level)) {
                levelChanged = true;
            }
        }
        return levelChanged;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                drawable.draw(canvas);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public boolean getPadding(Rect padding) {
        padding.left = 0;
        padding.top = 0;
        padding.right = 0;
        padding.bottom = 0;
        Rect rect = this.mTmpRect;
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                drawable.getPadding(rect);
                padding.left = Math.max(padding.left, rect.left);
                padding.top = Math.max(padding.top, rect.top);
                padding.right = Math.max(padding.right, rect.right);
                padding.bottom = Math.max(padding.bottom, rect.bottom);
            }
        }
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public Drawable mutate() {
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                drawable.mutate();
            }
        }
        this.mIsMutated = true;
        return this;
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        if (this.mLayers.length == 0) {
            return -2;
        }
        int opacity = -1;
        for (int i = 1; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                opacity = Drawable.resolveOpacity(opacity, drawable.getOpacity());
            }
        }
        return opacity;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mDrawableProperties.setAlpha(alpha);
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                drawable.setAlpha(alpha);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.mDrawableProperties.setColorFilter(colorFilter);
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                drawable.setColorFilter(colorFilter);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setDither(boolean dither) {
        this.mDrawableProperties.setDither(dither);
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                drawable.setDither(dither);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setFilterBitmap(boolean filterBitmap) {
        this.mDrawableProperties.setFilterBitmap(filterBitmap);
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                drawable.setFilterBitmap(filterBitmap);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public boolean setVisible(boolean visible, boolean restart) {
        boolean changed = super.setVisible(visible, restart);
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                drawable.setVisible(visible, restart);
            }
        }
        return changed;
    }

    public DrawableParent getDrawableParentForIndex(int index) {
        boolean z = true;
        Preconditions.checkArgument(index >= 0);
        if (index >= this.mDrawableParents.length) {
            z = false;
        }
        Preconditions.checkArgument(z);
        if (this.mDrawableParents[index] == null) {
            this.mDrawableParents[index] = createDrawableParentForIndex(index);
        }
        return this.mDrawableParents[index];
    }

    private DrawableParent createDrawableParentForIndex(final int index) {
        return new DrawableParent() { // from class: com.facebook.drawee.drawable.ArrayDrawable.1
            @Override // com.facebook.drawee.drawable.DrawableParent
            public Drawable setDrawable(Drawable newDrawable) {
                return ArrayDrawable.this.setDrawable(index, newDrawable);
            }

            @Override // com.facebook.drawee.drawable.DrawableParent
            public Drawable getDrawable() {
                return ArrayDrawable.this.getDrawable(index);
            }
        };
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

    @Override // com.facebook.drawee.drawable.TransformCallback
    public void getTransform(Matrix transform) {
        if (this.mTransformCallback != null) {
            this.mTransformCallback.getTransform(transform);
        } else {
            transform.reset();
        }
    }

    @Override // com.facebook.drawee.drawable.TransformCallback
    public void getRootBounds(RectF bounds) {
        if (this.mTransformCallback != null) {
            this.mTransformCallback.getRootBounds(bounds);
        } else {
            bounds.set(getBounds());
        }
    }

    @Override // android.graphics.drawable.Drawable
    @TargetApi(21)
    public void setHotspot(float x, float y) {
        for (int i = 0; i < this.mLayers.length; i++) {
            Drawable drawable = this.mLayers[i];
            if (drawable != null) {
                drawable.setHotspot(x, y);
            }
        }
    }
}
