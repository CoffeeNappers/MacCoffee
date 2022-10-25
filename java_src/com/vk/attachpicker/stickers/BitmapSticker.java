package com.vk.attachpicker.stickers;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
/* loaded from: classes2.dex */
public class BitmapSticker extends Sticker {
    private static final Paint paint = new Paint(2);
    private final Bitmap bitmap;
    private final String metaInfo;
    private final Rect bitmapSrcRect = new Rect();
    private final RectF bitmapDstRect = new RectF();

    public BitmapSticker(BitmapSticker bitmapSticker) {
        this.bitmap = bitmapSticker.bitmap;
        this.bitmapSrcRect.set(bitmapSticker.bitmapSrcRect);
        this.bitmapDstRect.set(bitmapSticker.bitmapDstRect);
        this.metaInfo = bitmapSticker.metaInfo;
    }

    public BitmapSticker(Bitmap bitmap, int maxWidth, String metaInfo) {
        this.bitmap = bitmap;
        this.metaInfo = metaInfo;
        initRects(maxWidth);
    }

    private void initRects(int maxWidth) {
        this.bitmapSrcRect.set(0, 0, this.bitmap.getWidth(), this.bitmap.getHeight());
        float desiredRes = maxWidth / 2;
        float scaleW = desiredRes / this.bitmapSrcRect.width();
        float scaleH = desiredRes / this.bitmapSrcRect.height();
        float scale = Math.min(scaleW, scaleH);
        this.bitmapDstRect.set(0.0f, 0.0f, this.bitmap.getWidth() * scale, this.bitmap.getHeight() * scale);
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public void doDraw(Canvas canvas) {
        if (this.bitmap != null) {
            paint.setAlpha(getAlpha());
            canvas.drawBitmap(this.bitmap, this.bitmapSrcRect, this.bitmapDstRect, paint);
        }
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public float getOriginalWidth() {
        if (this.bitmapDstRect != null) {
            return this.bitmapDstRect.width();
        }
        return 0.0f;
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public float getOriginalHeight() {
        if (this.bitmapDstRect != null) {
            return this.bitmapDstRect.height();
        }
        return 0.0f;
    }

    public String getMetaInfo() {
        return this.metaInfo;
    }
}
