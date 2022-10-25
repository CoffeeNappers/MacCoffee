package com.vkontakte.android;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
/* loaded from: classes2.dex */
public class CoverBgDrawable extends Drawable {
    private long animDuration = 1000;
    private long animStart;
    private Drawable bg;
    private Bitmap bmp;
    private Paint paint;

    public CoverBgDrawable(Bitmap b) {
        if (b != null) {
            int[] pixels = new int[b.getWidth() * b.getHeight()];
            b.getPixels(pixels, 0, b.getWidth(), 0, 0, b.getWidth(), b.getHeight());
            for (int i = 0; i < pixels.length; i++) {
                pixels[i] = ((pixels[i] >> 2) & 4144959) | ViewCompat.MEASURED_STATE_MASK;
            }
            this.bmp = Bitmap.createBitmap(pixels, b.getWidth(), b.getHeight(), Bitmap.Config.ARGB_8888);
            this.paint = new Paint();
            this.paint.setFilterBitmap(true);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas c) {
        if (this.bmp != null) {
            Rect bnds = copyBounds();
            c.save();
            c.clipRect(bnds);
            Rect dst = new Rect();
            if (bnds.height() > bnds.width()) {
                dst.top = bnds.top;
                dst.bottom = bnds.bottom;
                dst.left = bnds.left - ((bnds.height() - bnds.width()) / 2);
                dst.right = bnds.right + ((bnds.height() - bnds.width()) / 2);
            } else {
                dst.left = bnds.left;
                dst.right = bnds.right;
                dst.top = bnds.top - ((bnds.width() - bnds.height()) / 2);
                dst.bottom = bnds.bottom + ((bnds.width() - bnds.height()) / 2);
            }
            if (System.currentTimeMillis() < this.animStart + this.animDuration) {
                float a = ((float) (System.currentTimeMillis() - this.animStart)) / ((float) this.animDuration);
                this.paint.setAlpha((int) (255.0f * a));
                invalidateSelf();
                this.bg.setBounds(copyBounds());
                this.bg.draw(c);
            } else {
                this.paint.setAlpha(255);
                this.bg = null;
            }
            c.drawBitmap(this.bmp, (Rect) null, dst, this.paint);
            c.restore();
        }
    }

    public Bitmap getBitmap() {
        return this.bmp;
    }

    public void fadeIn(Drawable from) {
        if (from == null) {
            this.bg = VKApplication.context.getResources().getDrawable(R.drawable.bg_audio_player);
        } else {
            this.bg = from;
        }
        this.animStart = System.currentTimeMillis();
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int arg0) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
    }
}
