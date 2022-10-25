package com.vk.attachpicker.drawing.brushes;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class PenBrush extends Brush {
    private final float defaultWidth = Screen.dp(8);
    private final Paint paint = new Paint(1);

    public PenBrush() {
        this.paint.setStyle(Paint.Style.STROKE);
        this.paint.setStrokeJoin(Paint.Join.ROUND);
        this.paint.setStrokeCap(Paint.Cap.ROUND);
        setSize(1.0f);
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public void setSize(float size) {
        super.setSize(size);
        this.paint.setStrokeWidth(this.defaultWidth * size);
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public float getMaxDimension() {
        return this.defaultWidth * getSize();
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public void setColor(int color) {
        this.paint.setColor(color);
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public int getAlpha() {
        return 255;
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public boolean shouldBeDrawnInSessionDrawingLayer() {
        return false;
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public boolean shouldBeDrawnInDrawingLayer() {
        return false;
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public Brush copy() {
        PenBrush b = new PenBrush();
        b.paint.set(this.paint);
        b.setSize(getSize());
        return b;
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public void draw(Canvas canvas, Path path) {
        canvas.drawPath(path, this.paint);
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public void draw(Canvas canvas, float x, float y) {
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public float drawPeriod() {
        return 0.0f;
    }
}
