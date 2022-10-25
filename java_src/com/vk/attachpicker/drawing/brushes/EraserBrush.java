package com.vk.attachpicker.drawing.brushes;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class EraserBrush extends Brush {
    private final float defaultWidth = Screen.dp(8);
    private final Paint paint = new Paint(1);

    public EraserBrush() {
        this.paint.setStyle(Paint.Style.STROKE);
        this.paint.setStrokeJoin(Paint.Join.ROUND);
        this.paint.setStrokeCap(Paint.Cap.ROUND);
        this.paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
        this.paint.setARGB(0, 0, 0, 0);
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
        return true;
    }

    @Override // com.vk.attachpicker.drawing.brushes.Brush
    public Brush copy() {
        EraserBrush b = new EraserBrush();
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
