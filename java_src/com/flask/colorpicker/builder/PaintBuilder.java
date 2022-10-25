package com.flask.colorpicker.builder;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Shader;
/* loaded from: classes.dex */
public class PaintBuilder {
    public static PaintHolder newPaint() {
        return new PaintHolder();
    }

    /* loaded from: classes.dex */
    public static class PaintHolder {
        private Paint paint;

        private PaintHolder() {
            this.paint = new Paint(1);
        }

        public PaintHolder color(int color) {
            this.paint.setColor(color);
            return this;
        }

        public PaintHolder antiAlias(boolean flag) {
            this.paint.setAntiAlias(flag);
            return this;
        }

        public PaintHolder style(Paint.Style style) {
            this.paint.setStyle(style);
            return this;
        }

        public PaintHolder mode(PorterDuff.Mode mode) {
            this.paint.setXfermode(new PorterDuffXfermode(mode));
            return this;
        }

        public PaintHolder stroke(float width) {
            this.paint.setStrokeWidth(width);
            return this;
        }

        public PaintHolder xPerMode(PorterDuff.Mode mode) {
            this.paint.setXfermode(new PorterDuffXfermode(mode));
            return this;
        }

        public PaintHolder shader(Shader shader) {
            this.paint.setShader(shader);
            return this;
        }

        public Paint build() {
            return this.paint;
        }
    }

    public static Shader createAlphaPatternShader(int size) {
        return new BitmapShader(createAlphaBackgroundPattern(Math.max(8, (size / 2) * 2)), Shader.TileMode.REPEAT, Shader.TileMode.REPEAT);
    }

    private static Bitmap createAlphaBackgroundPattern(int size) {
        Paint alphaPatternPaint = newPaint().build();
        Bitmap bm = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
        Canvas c = new Canvas(bm);
        int s = Math.round(size / 2.0f);
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 2; j++) {
                if ((i + j) % 2 == 0) {
                    alphaPatternPaint.setColor(-1);
                } else {
                    alphaPatternPaint.setColor(-3092272);
                }
                c.drawRect(i * s, j * s, (i + 1) * s, (j + 1) * s, alphaPatternPaint);
            }
        }
        return bm;
    }
}
