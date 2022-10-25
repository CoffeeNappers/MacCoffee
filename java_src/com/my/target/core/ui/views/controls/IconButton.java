package com.my.target.core.ui.views.controls;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LightingColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
/* loaded from: classes2.dex */
public class IconButton extends View {
    private Rect a;
    private Bitmap b;
    private Paint c;
    private ColorFilter d;
    private float e;
    private int f;
    private int g;
    private int h;

    public IconButton(Context context) {
        super(context);
        this.c = new Paint();
        this.d = new LightingColorFilter(-3355444, 1);
        this.c.setFilterBitmap(true);
        this.e = getContext().getResources().getDisplayMetrics().density;
        this.f = (int) ((10.0f * this.e) + 0.5f);
        this.a = new Rect();
    }

    public void setBitmap(Bitmap bitmap, Boolean bool) {
        float f = 1.0f;
        this.b = bitmap;
        if (this.b != null) {
            if (bool.booleanValue()) {
                if (this.e > 1.0f) {
                    f = 2.0f;
                }
                this.h = (int) ((this.b.getHeight() / f) * this.e);
                this.g = (int) ((this.b.getWidth() / f) * this.e);
            } else {
                this.g = this.b.getWidth();
                this.h = this.b.getHeight();
            }
        } else {
            this.h = 0;
            this.g = 0;
        }
        setMeasuredDimension(this.g + (this.f * 2), this.h + (this.f * 2));
        requestLayout();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        switch (motionEvent.getAction()) {
            case 0:
                this.c.setColorFilter(this.d);
                invalidate();
                return true;
            case 1:
                if (motionEvent.getX() >= 0.0f && motionEvent.getX() <= getMeasuredWidth() && motionEvent.getY() >= 0.0f && motionEvent.getY() <= getMeasuredHeight()) {
                    performClick();
                    break;
                }
                break;
            case 2:
            default:
                return super.onTouchEvent(motionEvent);
            case 3:
                break;
        }
        this.c.setColorFilter(null);
        invalidate();
        return true;
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        setMeasuredDimension(getMeasuredWidth(), getMeasuredHeight());
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.b != null) {
            this.a.left = this.f;
            this.a.top = this.f;
            this.a.right = this.g + this.f;
            this.a.bottom = this.h + this.f;
            canvas.drawBitmap(this.b, (Rect) null, this.a, this.c);
        }
    }
}
