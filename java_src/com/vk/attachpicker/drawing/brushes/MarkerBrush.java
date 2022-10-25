package com.vk.attachpicker.drawing.brushes;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class MarkerBrush extends Brush {
    private final RectF drawingRect;
    private final float drawPeriod = 3.0f;
    private final float defaultWidth = Screen.dp(3);
    private final float defaultHeight = Screen.dp(16);
    private final Paint paint = new Paint();

    public MarkerBrush() {
        this.paint.setStyle(Paint.Style.FILL);
        this.drawingRect = new RectF();
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public float getMaxDimension() {
        return this.defaultHeight * getSize();
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public void setColor(int color) {
        this.paint.setColor(color);
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public int getAlpha() {
        return 200;
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public boolean shouldBeDrawnInSessionDrawingLayer() {
        return true;
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public boolean shouldBeDrawnInDrawingLayer() {
        return false;
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public Brush copy() {
        MarkerBrush b = new MarkerBrush();
        b.paint.set(this.paint);
        b.drawingRect.set(this.drawingRect);
        b.setSize(getSize());
        return b;
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public void draw(Canvas canvas, Path path) {
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public void draw(Canvas canvas, float x, float y) {
        float dx = (this.defaultWidth / 2.0f) * getSize();
        float dy = (this.defaultHeight / 2.0f) * getSize();
        this.drawingRect.left = x - dx;
        this.drawingRect.top = y - dy;
        this.drawingRect.right = x + dx;
        this.drawingRect.bottom = y + dy;
        canvas.save();
        canvas.rotate(-60.0f, x, y);
        canvas.drawRoundRect(this.drawingRect, dx, dx, this.paint);
        canvas.restore();
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public float drawPeriod() {
        return this.drawPeriod;
    }
}
