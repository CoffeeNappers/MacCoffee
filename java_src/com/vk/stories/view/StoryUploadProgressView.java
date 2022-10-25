package com.vk.stories.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class StoryUploadProgressView extends View {
    private final Paint borderPaint;
    private final RectF drawBounds;
    private final Paint innerPaint;
    private float progress;
    private static final int SIZE = Screen.dp(20);
    private static final int STROKE_WIDTH = Screen.dp(2);
    private static final int RADIUS = ((SIZE / 2) - (STROKE_WIDTH / 2)) - 2;

    public StoryUploadProgressView(Context context) {
        super(context);
        this.borderPaint = new Paint(1);
        this.innerPaint = new Paint(1);
        this.drawBounds = new RectF();
        this.progress = 0.0f;
        init();
    }

    public StoryUploadProgressView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.borderPaint = new Paint(1);
        this.innerPaint = new Paint(1);
        this.drawBounds = new RectF();
        this.progress = 0.0f;
        init();
    }

    public StoryUploadProgressView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.borderPaint = new Paint(1);
        this.innerPaint = new Paint(1);
        this.drawBounds = new RectF();
        this.progress = 0.0f;
        init();
    }

    private void init() {
        this.borderPaint.setColor(-1);
        this.borderPaint.setStyle(Paint.Style.STROKE);
        this.borderPaint.setStrokeWidth(STROKE_WIDTH);
        this.innerPaint.setColor(-1);
        this.innerPaint.setStyle(Paint.Style.FILL);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int cx = canvas.getWidth() / 2;
        int cy = canvas.getHeight() / 2;
        this.drawBounds.set(cx - RADIUS, cy - RADIUS, RADIUS + cx, RADIUS + cy);
        canvas.drawCircle(cx, cy, RADIUS, this.borderPaint);
        canvas.drawArc(this.drawBounds, -90.0f, 360.0f * this.progress, true, this.innerPaint);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(SIZE, 1073741824), View.MeasureSpec.makeMeasureSpec(SIZE, 1073741824));
    }

    public float getProgress() {
        return this.progress;
    }

    public void setProgress(float progress) {
        if (progress < 0.0f) {
            progress = 0.0f;
        } else if (progress > 0.95f) {
            progress = 0.95f;
        }
        if (progress == 0.0f || progress > this.progress) {
            this.progress = progress;
        }
        invalidate();
    }
}
