package com.flask.colorpicker.renderer;

import android.graphics.Color;
import android.graphics.Paint;
import com.flask.colorpicker.ColorCircle;
import com.flask.colorpicker.builder.PaintBuilder;
/* loaded from: classes.dex */
public class FlowerColorWheelRenderer extends AbsColorWheelRenderer {
    private Paint selectorFill = PaintBuilder.newPaint().build();
    private float[] hsv = new float[3];
    private float sizeJitter = 1.2f;

    @Override // com.flask.colorpicker.renderer.ColorWheelRenderer
    public void draw() {
        int setSize = this.colorCircleList.size();
        int currentCount = 0;
        float half = this.colorWheelRenderOption.targetCanvas.getWidth() / 2.0f;
        int density = this.colorWheelRenderOption.density;
        float strokeWidth = this.colorWheelRenderOption.strokeWidth;
        float maxRadius = this.colorWheelRenderOption.maxRadius;
        float cSize = this.colorWheelRenderOption.cSize;
        int i = 0;
        while (i < density) {
            float p = i / (density - 1);
            float jitter = (i - (density / 2.0f)) / density;
            float radius = maxRadius * p;
            float size = Math.max(1.5f + strokeWidth, (i == 0 ? 0.0f : this.sizeJitter * cSize * jitter) + cSize);
            int total = Math.min(calcTotalCount(radius, size), density * 2);
            for (int j = 0; j < total; j++) {
                double angle = ((6.283185307179586d * j) / total) + ((3.141592653589793d / total) * ((i + 1) % 2));
                float x = half + ((float) (radius * Math.cos(angle)));
                float y = half + ((float) (radius * Math.sin(angle)));
                this.hsv[0] = (float) ((180.0d * angle) / 3.141592653589793d);
                this.hsv[1] = radius / maxRadius;
                this.hsv[2] = this.colorWheelRenderOption.lightness;
                this.selectorFill.setColor(Color.HSVToColor(this.hsv));
                this.selectorFill.setAlpha(getAlphaValueAsInt());
                this.colorWheelRenderOption.targetCanvas.drawCircle(x, y, size - strokeWidth, this.selectorFill);
                if (currentCount >= setSize) {
                    this.colorCircleList.add(new ColorCircle(x, y, this.hsv));
                } else {
                    this.colorCircleList.get(currentCount).set(x, y, this.hsv);
                }
                currentCount++;
            }
            i++;
        }
    }
}
