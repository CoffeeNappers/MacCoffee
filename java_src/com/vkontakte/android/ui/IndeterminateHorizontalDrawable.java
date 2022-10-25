package com.vkontakte.android.ui;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import com.vkontakte.android.Global;
/* loaded from: classes3.dex */
public class IndeterminateHorizontalDrawable extends Drawable {
    private Paint bgPaint;
    private Paint fgPaint = new Paint();
    private int maxOffset;
    private int offset;

    public IndeterminateHorizontalDrawable() {
        this.fgPaint.setColor(-1381395);
        this.fgPaint.setAntiAlias(true);
        this.fgPaint.setStrokeWidth(Global.scale(10.0f));
        this.fgPaint.setStrokeCap(Paint.Cap.BUTT);
        this.bgPaint = new Paint();
        this.bgPaint.setColor(-13388315);
        this.bgPaint.setAntiAlias(true);
        this.maxOffset = Global.scale(40.0f);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas c) {
        int height = Global.scale(3.0f);
        Rect b = new Rect();
        copyBounds(b);
        b.top = b.centerY() - (height / 2);
        b.bottom = b.top + height;
        c.drawRect(new RectF(b), this.bgPaint);
        c.save();
        c.clipRect(b);
        c.translate(b.left, b.top);
        for (int i = -1; i < 100 && Global.scale(40.0f) * i <= b.width(); i++) {
            c.drawLine(((Global.scale(40.0f) * i) - Global.scale(20.0f)) + this.offset, b.height() + Global.scale(20.0f), ((i + 1) * Global.scale(40.0f)) + Global.scale(20.0f) + this.offset, -Global.scale(20.0f), this.fgPaint);
        }
        this.offset += Global.scale(1.0f);
        this.offset %= this.maxOffset;
        c.restore();
        if (isVisible()) {
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
    }
}
