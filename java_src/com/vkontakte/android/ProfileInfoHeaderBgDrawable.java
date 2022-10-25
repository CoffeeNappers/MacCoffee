package com.vkontakte.android;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
/* loaded from: classes2.dex */
public class ProfileInfoHeaderBgDrawable extends Drawable {
    private Paint bgPaint = new Paint();
    private Paint divPaint;
    public boolean topCorners;
    private Paint whitePaint;

    public ProfileInfoHeaderBgDrawable(boolean top) {
        this.topCorners = false;
        this.topCorners = top;
        this.bgPaint.setColor(-13551805);
        this.whitePaint = new Paint();
        this.whitePaint.setColor(-1);
        this.whitePaint.setAntiAlias(true);
        this.divPaint = new Paint();
        this.divPaint.setColor(-3552308);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        Rect bounds = new Rect();
        copyBounds(bounds);
        canvas.drawRect(getBounds(), this.bgPaint);
        bounds.left += Global.scale(8.0f);
        bounds.right -= Global.scale(8.0f);
        if (this.topCorners) {
            Rect r1 = new Rect(bounds);
            if (this.topCorners) {
                r1.top += Global.scale(2.0f);
            }
            canvas.drawRect(r1, this.whitePaint);
            RectF r2 = new RectF(bounds);
            if (this.topCorners) {
                r2.bottom = r2.top + Global.scale(5.0f);
            }
            canvas.drawRoundRect(r2, Global.scale(2.0f), Global.scale(2.0f), this.whitePaint);
        } else {
            canvas.drawRect(bounds, this.whitePaint);
        }
        Rect divFrame = new Rect();
        divFrame.left = bounds.left + Global.scale(10.0f);
        divFrame.right = bounds.right - Global.scale(10.0f);
        divFrame.top = bounds.bottom - Global.scale(2.0f);
        divFrame.bottom = bounds.bottom;
        canvas.drawRect(divFrame, this.divPaint);
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
        padding.bottom = Global.scale(8.0f);
        return true;
    }
}
