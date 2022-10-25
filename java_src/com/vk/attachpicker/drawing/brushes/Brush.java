package com.vk.attachpicker.drawing.brushes;

import android.graphics.Canvas;
import android.graphics.Path;
/* loaded from: classes2.dex */
public abstract class Brush {
    public static final int BRUSH_ERASER = 0;
    public static final int BRUSH_MARKER = 2;
    public static final int BRUSH_NEON = 3;
    public static final int BRUSH_PEN = 1;
    private float size = 1.0f;

    public abstract Brush copy();

    public abstract void draw(Canvas canvas, float f, float f2);

    public abstract void draw(Canvas canvas, Path path);

    public abstract float drawPeriod();

    public abstract int getAlpha();

    public abstract float getMaxDimension();

    public abstract void setColor(int i);

    public abstract boolean shouldBeDrawnInDrawingLayer();

    public abstract boolean shouldBeDrawnInSessionDrawingLayer();

    public float getSize() {
        return this.size;
    }

    public void setSize(float size) {
        this.size = size;
    }
}
