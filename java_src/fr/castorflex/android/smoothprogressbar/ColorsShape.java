package fr.castorflex.android.smoothprogressbar;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.shapes.Shape;
/* loaded from: classes3.dex */
public class ColorsShape extends Shape {
    private int[] mColors;
    private float mStrokeWidth;

    public ColorsShape(float strokeWidth, int[] colors) {
        this.mStrokeWidth = strokeWidth;
        this.mColors = colors;
    }

    public float getStrokeWidth() {
        return this.mStrokeWidth;
    }

    public void setStrokeWidth(float strokeWidth) {
        this.mStrokeWidth = strokeWidth;
    }

    public int[] getColors() {
        return this.mColors;
    }

    public void setColors(int[] colors) {
        this.mColors = colors;
    }

    @Override // android.graphics.drawable.shapes.Shape
    public void draw(Canvas canvas, Paint paint) {
        int[] iArr;
        float ratio = 1.0f / this.mColors.length;
        int i = 0;
        paint.setStrokeWidth(this.mStrokeWidth);
        for (int color : this.mColors) {
            paint.setColor(color);
            i++;
            canvas.drawLine(getWidth() * i * ratio, getHeight() / 2.0f, getWidth() * i * ratio, getHeight() / 2.0f, paint);
        }
    }
}
