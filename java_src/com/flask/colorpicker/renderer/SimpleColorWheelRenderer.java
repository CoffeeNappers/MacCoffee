package com.flask.colorpicker.renderer;

import android.graphics.Color;
import android.graphics.Paint;
import com.flask.colorpicker.ColorCircle;
import com.flask.colorpicker.builder.PaintBuilder;
/* loaded from: classes.dex */
public class SimpleColorWheelRenderer extends AbsColorWheelRenderer {
    private Paint selectorFill = PaintBuilder.newPaint().build();
    private float[] hsv = new float[3];

    @Override // com.flask.colorpicker.renderer.ColorWheelRenderer
    public void draw() {
        int setSize = this.colorCircleList.size();
        int currentCount = 0;
        float half = this.colorWheelRenderOption.targetCanvas.getWidth() / 2.0f;
        int density = this.colorWheelRenderOption.density;
        float maxRadius = this.colorWheelRenderOption.maxRadius;
        for (int i = 0; i < density; i++) {
            float p = i / (density - 1);
            float radius = maxRadius * p;
            float size = this.colorWheelRenderOption.cSize;
            int total = calcTotalCount(radius, size);
            for (int j = 0; j < total; j++) {
                double angle = ((6.283185307179586d * j) / total) + ((3.141592653589793d / total) * ((i + 1) % 2));
                float x = half + ((float) (radius * Math.cos(angle)));
                float y = half + ((float) (radius * Math.sin(angle)));
                this.hsv[0] = (float) ((180.0d * angle) / 3.141592653589793d);
                this.hsv[1] = radius / maxRadius;
                this.hsv[2] = this.colorWheelRenderOption.lightness;
                this.selectorFill.setColor(Color.HSVToColor(this.hsv));
                this.selectorFill.setAlpha(getAlphaValueAsInt());
                this.colorWheelRenderOption.targetCanvas.drawCircle(x, y, size - this.colorWheelRenderOption.strokeWidth, this.selectorFill);
                if (currentCount >= setSize) {
                    this.colorCircleList.add(new ColorCircle(x, y, this.hsv));
                } else {
                    this.colorCircleList.get(currentCount).set(x, y, this.hsv);
                }
                currentCount++;
            }
        }
    }
}
