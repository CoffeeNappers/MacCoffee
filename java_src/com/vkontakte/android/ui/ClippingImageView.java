package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
/* loaded from: classes3.dex */
public class ClippingImageView extends View {
    private Bitmap bmp;
    private int clipBottom;
    private int clipLeft;
    private int clipRight;
    private int clipTop;
    private Paint paint;

    public ClippingImageView(Context context) {
        super(context);
        init();
    }

    public ClippingImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public ClippingImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    private void init() {
        this.paint = new Paint();
        this.paint.setFilterBitmap(true);
    }

    public int getClipTop() {
        return this.clipTop;
    }

    public void setClipTop(int clipTop) {
        this.clipTop = clipTop;
        invalidate();
    }

    public int getClipLeft() {
        return this.clipLeft;
    }

    public void setClipLeft(int clipLeft) {
        this.clipLeft = clipLeft;
        invalidate();
    }

    public int getClipBottom() {
        return this.clipBottom;
    }

    public void setClipBottom(int clipBottom) {
        this.clipBottom = clipBottom;
        invalidate();
    }

    public int getClipRight() {
        return this.clipRight;
    }

    public void setClipRight(int clipRight) {
        this.clipRight = clipRight;
        invalidate();
    }

    public void setClipVertical(int c) {
        this.clipBottom = c;
        this.clipTop = c;
        invalidate();
    }

    public int getClipVertical() {
        return this.clipTop;
    }

    public void setClipHorizontal(int c) {
        this.clipRight = c;
        this.clipLeft = c;
        invalidate();
    }

    public int getClipHorizontal() {
        return this.clipRight;
    }

    public void setImageBitmap(Bitmap b) {
        this.bmp = b;
        invalidate();
    }

    public Drawable getDrawable() {
        return new BitmapDrawable(this.bmp);
    }

    @Override // android.view.View
    public void onDraw(Canvas c) {
        Rect rect = new Rect(this.clipLeft, this.clipTop, getWidth() - this.clipRight, getHeight() - this.clipBottom);
        c.save();
        c.clipRect(rect);
        if (this.bmp != null) {
            c.drawBitmap(this.bmp, (Rect) null, new Rect(0, 0, getWidth(), getHeight()), this.paint);
        }
        c.restore();
    }
}
