package com.vkontakte.android;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
/* loaded from: classes2.dex */
public class ProfileInfoItemBgDrawable extends Drawable {
    public boolean bottomCorners;
    private Paint divPaint;
    public boolean dividerEnabled;
    private Paint highlightPaint;
    public boolean topCorners;
    private Paint whitePaint;
    private boolean pressed = false;
    private Paint bgPaint = new Paint();

    public ProfileInfoItemBgDrawable(boolean div, boolean top, boolean bottom) {
        this.dividerEnabled = true;
        this.bottomCorners = false;
        this.topCorners = false;
        this.dividerEnabled = div;
        this.bottomCorners = bottom;
        this.topCorners = top;
        this.bgPaint.setColor(-13551805);
        this.whitePaint = new Paint();
        this.whitePaint.setColor(-1);
        this.whitePaint.setAntiAlias(true);
        this.highlightPaint = new Paint();
        this.highlightPaint.setColor(-8006673);
        this.highlightPaint.setAntiAlias(true);
        this.divPaint = new Paint();
        this.divPaint.setColor(-2039326);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        Rect bounds = new Rect();
        copyBounds(bounds);
        canvas.drawRect(getBounds(), this.bgPaint);
        bounds.left += Global.scale(8.0f);
        bounds.right -= Global.scale(8.0f);
        if (this.bottomCorners || this.topCorners) {
            Rect r1 = new Rect(bounds);
            if (this.bottomCorners) {
                r1.bottom -= Global.scale(12.0f);
            }
            if (this.topCorners) {
                r1.top += Global.scale(2.0f);
            }
            if (this.bottomCorners) {
                r1.bottom -= Global.scale(2.0f);
            }
            if (this.pressed) {
                if (this.dividerEnabled) {
                    canvas.drawRect(new Rect(r1.left, r1.top, r1.right, r1.top + Global.scale(1.0f)), this.whitePaint);
                    r1.top += Global.scale(1.0f);
                }
                canvas.drawRect(r1, this.highlightPaint);
            } else {
                canvas.drawRect(r1, this.whitePaint);
            }
            if (this.bottomCorners) {
                RectF r2 = new RectF(bounds);
                r2.bottom -= Global.scale(12.0f);
                r2.top = r2.bottom - Global.scale(5.0f);
                canvas.drawRoundRect(r2, Global.scale(2.0f), Global.scale(2.0f), this.pressed ? this.highlightPaint : this.whitePaint);
            }
            if (this.topCorners) {
                RectF r22 = new RectF(bounds);
                r22.bottom = r22.top + Global.scale(5.0f);
                canvas.drawRoundRect(r22, Global.scale(2.0f), Global.scale(2.0f), this.pressed ? this.highlightPaint : this.whitePaint);
            }
        } else {
            canvas.drawRect(bounds, this.whitePaint);
            if (this.pressed) {
                bounds.top += Global.scale(1.0f);
                canvas.drawRect(bounds, this.highlightPaint);
                bounds.top -= Global.scale(1.0f);
            }
        }
        if (this.dividerEnabled) {
            Rect divFrame = new Rect();
            divFrame.left = bounds.left + Global.scale(10.0f);
            divFrame.right = bounds.right - Global.scale(10.0f);
            divFrame.top = bounds.top;
            divFrame.bottom = bounds.top + Global.scale(1.0f);
            canvas.drawRect(divFrame, this.divPaint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean onStateChange(int[] state) {
        this.pressed = false;
        for (int s : state) {
            if (s == 16842919) {
                this.pressed = true;
            }
        }
        invalidateSelf();
        return true;
    }

    private boolean isPressed() {
        int[] ds = getState();
        for (int s : ds) {
            if (s == 16842919) {
                return true;
            }
        }
        return false;
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int arg0) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter arg0) {
    }

    @Override // android.graphics.drawable.Drawable
    public boolean getPadding(Rect padding) {
        int scale = Global.scale(24.0f);
        padding.right = scale;
        padding.left = scale;
        padding.top = this.topCorners ? Global.scale(12.0f) : Global.scale(8.0f);
        padding.bottom = this.bottomCorners ? Global.scale(24.0f) : Global.scale(8.0f);
        return true;
    }
}
