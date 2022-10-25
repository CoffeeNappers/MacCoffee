package com.vkontakte.android.stickers;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
/* loaded from: classes3.dex */
public class CalloutPopupBackgroundDrawable extends Drawable {
    private Drawable mCenterDrawable;
    private Drawable mLeftDrawable;
    private Drawable mRightDrawable;
    private int mLeftSize = -1;
    private int mCenterSize = -1;
    private int mRightSize = -1;

    public CalloutPopupBackgroundDrawable(Drawable leftDrawable, Drawable centerDrawable, Drawable rightDrawable) {
        this.mLeftDrawable = leftDrawable;
        this.mCenterDrawable = centerDrawable;
        this.mRightDrawable = rightDrawable;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        this.mLeftDrawable.draw(canvas);
        this.mCenterDrawable.draw(canvas);
        this.mRightDrawable.draw(canvas);
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        int drawableWithoutSizeCount = this.mLeftSize >= 0 ? 0 : 1;
        if (this.mCenterSize < 0) {
            drawableWithoutSizeCount++;
        }
        if (this.mRightSize < 0) {
            drawableWithoutSizeCount++;
        }
        int width = this.mLeftSize < 0 ? bounds.width() / drawableWithoutSizeCount : this.mLeftSize;
        this.mLeftDrawable.setBounds(bounds.left, bounds.top, bounds.left + width, bounds.bottom);
        int start = width;
        int width2 = this.mCenterSize < 0 ? (bounds.width() - Math.max(this.mLeftSize, 0)) / drawableWithoutSizeCount : this.mCenterSize;
        this.mCenterDrawable.setBounds(bounds.left + start, bounds.top, bounds.left + start + width2, bounds.bottom);
        int start2 = start + width2;
        this.mRightDrawable.setBounds(bounds.left + start2, bounds.top, bounds.left + start2 + (this.mRightSize < 0 ? ((bounds.width() - Math.max(this.mLeftSize, 0)) - Math.max(this.mCenterSize, 0)) / drawableWithoutSizeCount : this.mRightSize), bounds.bottom);
    }

    public void setLeftSize(int mLeftSize) {
        this.mLeftSize = mLeftSize;
    }

    public void setCenterSize(int mCenterSize) {
        this.mCenterSize = mCenterSize;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return this.mLeftDrawable.getOpacity();
    }
}
