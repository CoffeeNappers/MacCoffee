package com.vk.attachpicker.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.SweepGradient;
import android.util.AttributeSet;
import android.view.View;
import com.vk.attachpicker.util.Utils;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class ContextProgressView extends View {
    private final Paint arcPaint;
    private final int border;
    private final RectF circleRect;
    private int lastMinSide;
    private long lastUpdateTime;
    private int radOffset;

    public ContextProgressView(Context context) {
        super(context);
        this.radOffset = 0;
        this.circleRect = new RectF();
        this.arcPaint = new Paint(1);
        this.border = Screen.dp(2);
        init();
    }

    public ContextProgressView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.radOffset = 0;
        this.circleRect = new RectF();
        this.arcPaint = new Paint(1);
        this.border = Screen.dp(2);
        init();
    }

    public ContextProgressView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.radOffset = 0;
        this.circleRect = new RectF();
        this.arcPaint = new Paint(1);
        this.border = Screen.dp(2);
        init();
    }

    private void init() {
        this.arcPaint.setColor(Utils.getThemeAccentColor(getContext()));
        this.arcPaint.setStyle(Paint.Style.STROKE);
        this.arcPaint.setStrokeWidth(this.border);
        this.arcPaint.setStrokeCap(Paint.Cap.ROUND);
    }

    @Override // android.view.View
    public void setVisibility(int visibility) {
        super.setVisibility(visibility);
        this.lastUpdateTime = System.currentTimeMillis();
        invalidate();
    }

    @Override // android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.lastUpdateTime = System.currentTimeMillis();
        invalidate();
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        if (getVisibility() == 0) {
            long newTime = System.currentTimeMillis();
            long dt = newTime - this.lastUpdateTime;
            this.lastUpdateTime = newTime;
            this.radOffset = (int) (this.radOffset + (((float) (360 * dt)) / 1000.0f));
            int minSide = Math.min(getMeasuredWidth(), getMeasuredHeight()) - this.border;
            this.circleRect.set((getMeasuredWidth() / 2) - (minSide / 2), (getMeasuredHeight() / 2) - (minSide / 2), (getMeasuredWidth() / 2) + (minSide / 2), (getMeasuredHeight() / 2) + (minSide / 2));
            if (this.lastMinSide != minSide) {
                this.lastMinSide = minSide;
                Shader gradient = new SweepGradient(canvas.getWidth() / 2, canvas.getHeight() / 2, 0, this.arcPaint.getColor());
                this.arcPaint.setShader(gradient);
            }
            canvas.save();
            canvas.rotate(this.radOffset, canvas.getWidth() / 2, canvas.getHeight() / 2);
            canvas.drawArc(this.circleRect, -90.0f, 360.0f, false, this.arcPaint);
            canvas.restore();
            invalidate();
        }
    }
}
