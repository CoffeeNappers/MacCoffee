package com.vk.attachpicker.drawing.brushes;

import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.support.v4.view.ViewCompat;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class NeonBrush extends Brush {
    private static final float ADD_BACKGROUND_BLUR = 13.0f;
    private static final float ADD_BACKGROUND_STROKE = 6.0f;
    private final Paint backgroundPaint;
    private final float defaultWidth = Screen.dp(8);
    private final Paint topPaint = new Paint(1);

    public NeonBrush() {
        this.topPaint.setStyle(Paint.Style.STROKE);
        this.topPaint.setStrokeJoin(Paint.Join.ROUND);
        this.topPaint.setStrokeCap(Paint.Cap.ROUND);
        this.backgroundPaint = new Paint(1);
        this.backgroundPaint.setStyle(Paint.Style.STROKE);
        this.backgroundPaint.setStrokeJoin(Paint.Join.ROUND);
        this.backgroundPaint.setStrokeCap(Paint.Cap.ROUND);
        setSize(1.0f);
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public void setSize(float size) {
        super.setSize(size);
        this.topPaint.setStrokeWidth(this.defaultWidth * size);
        this.backgroundPaint.setStrokeWidth((1.4f * this.defaultWidth * size) + ADD_BACKGROUND_STROKE);
        this.backgroundPaint.setMaskFilter(new BlurMaskFilter(ADD_BACKGROUND_BLUR * size, BlurMaskFilter.Blur.NORMAL));
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public float getMaxDimension() {
        return (1.4f * this.defaultWidth * getSize()) + ADD_BACKGROUND_STROKE + (26.0f * getSize());
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public void setColor(int color) {
        if (color == -16777216) {
            this.topPaint.setColor(ViewCompat.MEASURED_STATE_MASK);
            this.backgroundPaint.setColor(-3377951);
            return;
        }
        this.topPaint.setColor(-1);
        this.backgroundPaint.setColor(color);
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
        NeonBrush b = new NeonBrush();
        b.topPaint.set(this.topPaint);
        b.backgroundPaint.set(this.backgroundPaint);
        b.setSize(getSize());
        return b;
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public void draw(Canvas canvas, Path path) {
        canvas.drawPath(path, this.backgroundPaint);
        canvas.drawPath(path, this.topPaint);
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public void draw(Canvas canvas, float x, float y) {
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public float drawPeriod() {
        return 0.0f;
    }
}
