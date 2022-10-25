package com.vk.attachpicker.stickers;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.support.v4.internal.view.SupportMenu;
/* loaded from: classes2.dex */
public class RedSquareSticker extends Sticker {
    private final float originalHeight;
    private final float originalWidth;
    private final Paint paint = new Paint();

    public RedSquareSticker(float originalWidth, float originalHeight) {
        this.originalWidth = originalWidth;
        this.originalHeight = originalHeight;
        this.paint.setColor(SupportMenu.CATEGORY_MASK);
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public void doDraw(Canvas canvas) {
        canvas.drawRect(0.0f, 0.0f, getOriginalWidth(), getOriginalHeight(), this.paint);
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public float getOriginalWidth() {
        return this.originalWidth;
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public float getOriginalHeight() {
        return this.originalHeight;
    }
}
