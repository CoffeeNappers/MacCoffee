package com.flask.colorpicker;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.ColorDrawable;
import com.flask.colorpicker.builder.PaintBuilder;
import com.vkontakte.android.Global;
/* loaded from: classes.dex */
public class CircleColorDrawable extends ColorDrawable {
    private Paint fillBackPaint;
    private Paint fillPaint;
    private Paint strokePaint;
    private float strokeWidth;

    public CircleColorDrawable() {
        this.strokePaint = PaintBuilder.newPaint().style(Paint.Style.STROKE).stroke(this.strokeWidth).color(805306368).build();
        this.fillPaint = PaintBuilder.newPaint().style(Paint.Style.FILL).color(0).build();
        this.fillBackPaint = PaintBuilder.newPaint().shader(PaintBuilder.createAlphaPatternShader(16)).build();
    }

    public CircleColorDrawable(int color) {
        super(color);
        this.strokePaint = PaintBuilder.newPaint().style(Paint.Style.STROKE).stroke(this.strokeWidth).color(805306368).build();
        this.fillPaint = PaintBuilder.newPaint().style(Paint.Style.FILL).color(0).build();
        this.fillBackPaint = PaintBuilder.newPaint().shader(PaintBuilder.createAlphaPatternShader(16)).build();
    }

    @Override // android.graphics.drawable.ColorDrawable, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        canvas.drawColor(0);
        int width = canvas.getWidth();
        float radius = width / 2.0f;
        this.strokeWidth = Global.scale(0.5f);
        this.strokePaint.setStrokeWidth(this.strokeWidth);
        this.fillPaint.setColor(getColor());
        canvas.drawCircle(radius, radius, radius, this.fillPaint);
        canvas.drawCircle(radius, radius, radius - (this.strokeWidth / 2.0f), this.strokePaint);
    }

    @Override // android.graphics.drawable.ColorDrawable
    public void setColor(int color) {
        super.setColor(color);
        invalidateSelf();
    }
}
