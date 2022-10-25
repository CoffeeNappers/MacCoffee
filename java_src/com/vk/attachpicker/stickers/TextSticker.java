package com.vk.attachpicker.stickers;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.support.v4.graphics.ColorUtils;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class TextSticker extends Sticker {
    private final Paint backgroundPaint = new Paint(1);
    private final RectF backgroundRect = new RectF();
    private int lastCanvasHeight;
    private int lastCanvasWidth;
    private final int maxWidth;
    private StaticLayout staticLayout;
    private StickerStyle stickerStyle;
    private String text;
    private final TextPaint textPaint;

    public static TextPaint createPaint(Typeface typeface, int color, int fontColor) {
        TextPaint tp = new TextPaint(1);
        tp.setTypeface(typeface);
        tp.setColor(color);
        tp.setTextSize(fontColor);
        tp.setTextAlign(Paint.Align.CENTER);
        tp.setShadowLayer(2.0f, 0.0f, 2.0f, 671088640);
        return tp;
    }

    public TextSticker(TextSticker sticker) {
        this.maxWidth = sticker.maxWidth;
        this.stickerStyle = sticker.stickerStyle;
        this.textPaint = new TextPaint(sticker.textPaint);
        this.backgroundPaint.setStyle(Paint.Style.FILL);
        setText(sticker.text);
    }

    public TextSticker(int maxWidth, String text, int color, StickerStyle typeface) {
        this.maxWidth = maxWidth;
        this.stickerStyle = typeface;
        this.textPaint = createPaint(typeface.typeface, color, typeface.fontSize);
        this.backgroundPaint.setStyle(Paint.Style.FILL);
        setText(text);
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public boolean canRotate() {
        return this.stickerStyle.canRotate;
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public boolean canScale() {
        return this.stickerStyle.canScale;
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public boolean canTranslateX() {
        return this.stickerStyle.canTranslateX;
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public boolean canTranslateY() {
        return this.stickerStyle.canTranslateY;
    }

    public String getText() {
        return this.text;
    }

    public int getColor() {
        return this.textPaint.getColor();
    }

    public StickerStyle getStickerStyle() {
        return this.stickerStyle;
    }

    public void setText(String text) {
        if (text == null) {
            text = "...";
        }
        this.text = text;
        this.staticLayout = new StaticLayout(text, this.textPaint, this.maxWidth, Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, false);
    }

    public void setColor(int color) {
        this.textPaint.setColor(color);
        setText(this.text);
    }

    public void setTypeface(StickerStyle typeface) {
        if (typeface != null) {
            boolean wasFixedStyle = this.stickerStyle != null ? this.stickerStyle.fixedStyle() : false;
            this.stickerStyle = typeface;
            this.textPaint.setTextSize(typeface.fontSize);
            this.textPaint.setTypeface(typeface.typeface);
            setText(this.text);
            if (wasFixedStyle != typeface.fixedStyle()) {
                reset(this.lastCanvasWidth, this.lastCanvasHeight);
            }
        }
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public void doDraw(Canvas canvas) {
        this.lastCanvasWidth = canvas.getWidth();
        this.lastCanvasHeight = canvas.getHeight();
        if (this.staticLayout != null) {
            float currentScale = getScale();
            int width = this.stickerStyle.fullWidth ? (int) (canvas.getWidth() / currentScale) : (int) getOriginalWidth();
            if (this.stickerStyle.background != 0) {
                this.backgroundRect.set(0.0f, -Screen.dp(3), width, getOriginalHeight() + Screen.dp(6));
                float fAlpha = getAlpha() / 255.0f;
                this.backgroundPaint.setColor(ColorUtils.setAlphaComponent(this.stickerStyle.background, (int) (Color.alpha(this.stickerStyle.background) * fAlpha)));
                canvas.drawRect(this.backgroundRect, this.backgroundPaint);
            }
            int saveCount = canvas.save();
            canvas.translate(width / 2, 0.0f);
            this.staticLayout.getPaint().setAlpha(getAlpha());
            this.staticLayout.draw(canvas);
            canvas.restoreToCount(saveCount);
        }
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public float getOriginalWidth() {
        if (this.stickerStyle != null && this.stickerStyle.fullWidth) {
            return this.lastCanvasWidth;
        }
        if (this.staticLayout == null) {
            return 0.0f;
        }
        if (this.staticLayout.getLineCount() > 1) {
            return this.maxWidth;
        }
        if (this.staticLayout.getLineCount() <= 0) {
            return 0.0f;
        }
        return this.staticLayout.getLineWidth(0);
    }

    @Override // com.vk.attachpicker.stickers.Sticker
    public float getOriginalHeight() {
        if (this.staticLayout == null) {
            return 0.0f;
        }
        return this.staticLayout.getHeight();
    }
}
