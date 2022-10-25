package com.vkontakte.android.ui;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
/* loaded from: classes3.dex */
public class ParallaxDrawable extends Drawable {
    private Bitmap bmp;
    private Path path;
    private BitmapShader shader;
    private float offset = 0.0f;
    private int[] cornerRadiuses = {0, 0, 0, 0};
    private Paint paint = new Paint();

    public ParallaxDrawable() {
        this.paint.setFilterBitmap(true);
        this.paint.setAntiAlias(true);
    }

    public void setBitmap(Bitmap b) {
        this.bmp = b;
        if (this.bmp != null) {
            this.shader = new BitmapShader(this.bmp, Shader.TileMode.REPEAT, Shader.TileMode.CLAMP);
            this.paint.setShader(this.shader);
        }
    }

    public void setOffset(float off) {
        this.offset = off;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas c) {
        if (this.bmp != null) {
            Rect bnds = copyBounds();
            int h = this.bmp.getHeight();
            int w = Math.round(this.bmp.getWidth() * (bnds.height() / h));
            if (w < bnds.width()) {
                w = (int) (w * Math.ceil(bnds.width() / w));
            }
            int wd = w - bnds.width();
            int x = bnds.left - Math.round(wd * this.offset);
            Matrix matrix = new Matrix();
            matrix.setScale(bnds.height() / h, bnds.height() / h);
            matrix.postTranslate(x, 0.0f);
            this.shader.setLocalMatrix(matrix);
            if (this.path == null) {
                this.path = new Path();
                this.path.addRoundRect(new RectF(bnds), new float[]{this.cornerRadiuses[0], this.cornerRadiuses[0], this.cornerRadiuses[1], this.cornerRadiuses[1], this.cornerRadiuses[2], this.cornerRadiuses[2], this.cornerRadiuses[3], this.cornerRadiuses[3]}, Path.Direction.CW);
            }
            c.drawPath(this.path, this.paint);
        }
    }

    public void setCornersRadius(int topLeft, int topRight, int bottomLeft, int bottomRight) {
        this.cornerRadiuses = new int[]{topLeft, topRight, bottomLeft, bottomRight};
        this.path = null;
    }

    @Override // android.graphics.drawable.Drawable
    public void setBounds(Rect rect) {
        super.setBounds(rect);
        this.path = null;
    }

    @Override // android.graphics.drawable.Drawable
    public void setBounds(int l, int t, int r, int b) {
        super.setBounds(l, t, r, b);
        this.path = null;
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
    }
}
