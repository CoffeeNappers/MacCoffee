package com.vk.attachpicker.widget;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
/* loaded from: classes2.dex */
public class RoundedDrawable extends Drawable {
    private final Bitmap bitmap;
    private final int bitmapHeight;
    private final int bitmapWidth;
    private final int cornerRadius;
    private final RectF rectF = new RectF();
    private final Paint paint = new Paint();

    public RoundedDrawable(Bitmap bitmap, int cornerRadius) {
        this.bitmap = bitmap;
        this.cornerRadius = cornerRadius;
        this.paint.setAntiAlias(true);
        this.paint.setDither(true);
        BitmapShader shader = new BitmapShader(bitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
        this.paint.setShader(shader);
        this.bitmapWidth = this.bitmap.getWidth();
        this.bitmapHeight = this.bitmap.getHeight();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        canvas.drawRoundRect(this.rectF, this.cornerRadius, this.cornerRadius, this.paint);
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        this.rectF.set(bounds);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        if (this.paint.getAlpha() != alpha) {
            this.paint.setAlpha(alpha);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.paint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return Math.min(this.bitmapWidth, this.bitmapHeight);
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return getIntrinsicWidth();
    }

    public void setAntiAlias(boolean aa) {
        this.paint.setAntiAlias(aa);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setFilterBitmap(boolean filter) {
        this.paint.setFilterBitmap(filter);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setDither(boolean dither) {
        this.paint.setDither(dither);
        invalidateSelf();
    }

    public Bitmap getBitmap() {
        return this.bitmap;
    }
}
