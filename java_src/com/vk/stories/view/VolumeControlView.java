package com.vk.stories.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class VolumeControlView extends View {
    private final int DP8;
    private final Paint bluePaint;
    private final Paint grayPaint;
    private float volumeLevel;

    public VolumeControlView(Context context) {
        super(context);
        this.DP8 = Screen.dp(8);
        this.grayPaint = new Paint(1);
        this.bluePaint = new Paint(1);
        init();
    }

    public VolumeControlView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.DP8 = Screen.dp(8);
        this.grayPaint = new Paint(1);
        this.bluePaint = new Paint(1);
        init();
    }

    public VolumeControlView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.DP8 = Screen.dp(8);
        this.grayPaint = new Paint(1);
        this.bluePaint = new Paint(1);
        init();
    }

    private void init() {
        setBackgroundColor(-1);
        this.grayPaint.setColor(503316480);
        this.grayPaint.setStyle(Paint.Style.STROKE);
        this.grayPaint.setStrokeWidth(Screen.dp(1.0f));
        this.grayPaint.setStrokeCap(Paint.Cap.ROUND);
        this.bluePaint.setColor(-11103529);
        this.bluePaint.setStyle(Paint.Style.STROKE);
        this.bluePaint.setStrokeWidth(Screen.dp(3.0f));
        this.bluePaint.setStrokeCap(Paint.Cap.ROUND);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float cy = canvas.getHeight() / 2;
        float availableWidth = canvas.getWidth() - (this.DP8 * 2);
        canvas.drawLine(this.DP8, cy, this.DP8 + availableWidth, cy, this.grayPaint);
        canvas.drawLine(this.DP8, cy, (this.volumeLevel * availableWidth) + this.DP8, cy, this.bluePaint);
    }

    public float getVolumeLevel() {
        return this.volumeLevel;
    }

    public void setVolumeLevel(float volumeLevel) {
        this.volumeLevel = volumeLevel;
        if (volumeLevel < 0.0f) {
            volumeLevel = 0.0f;
        } else if (volumeLevel > 1.0f) {
            volumeLevel = 1.0f;
        }
        this.volumeLevel = volumeLevel;
        invalidate();
    }
}
