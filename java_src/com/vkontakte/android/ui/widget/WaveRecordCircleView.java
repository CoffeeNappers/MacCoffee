package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.media.audio.AudioMessageUtils;
/* loaded from: classes3.dex */
public class WaveRecordCircleView extends ImageView {
    private static final int PAINT_ALPHA = 70;
    private float amplitude;
    private float animateAmplitudeDiff;
    private float animateToAmplitude;
    private long lastUpdateTime;
    private final float minWaveRadius;
    private final Paint paintButton;
    private final Paint paintRecord;
    private final float radius;
    private float scale;

    public WaveRecordCircleView(Context context) {
        this(context, null);
    }

    public WaveRecordCircleView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WaveRecordCircleView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.paintRecord = new Paint(1);
        this.paintButton = new Paint(1);
        this.scale = 1.0f;
        this.paintButton.setColor(context.getResources().getColor(R.color.brand_primary));
        this.paintRecord.setColor(context.getResources().getColor(R.color.brand_primary));
        this.paintRecord.setAlpha(70);
        this.radius = context.getResources().getDimension(R.dimen.voice_rec_button_size) / 2.0f;
        this.minWaveRadius = context.getResources().getDimension(R.dimen.voice_rec_min_wave_radius);
    }

    public void setAmplitude(Double value) {
        if (value == null) {
            this.animateToAmplitude = 0.0f;
        } else {
            double max = Math.abs(AudioMessageUtils.SILENCE_VALUE);
            double val = Math.max(0.0d, max - Math.abs(value.doubleValue()));
            this.animateToAmplitude = ((float) Math.min(max, val)) / ((float) max);
        }
        this.animateAmplitudeDiff = (this.animateToAmplitude - this.amplitude) / 150.0f;
        this.lastUpdateTime = System.currentTimeMillis();
        invalidate();
    }

    public float getScale() {
        return this.scale;
    }

    public void setScale(float value) {
        this.scale = value;
        invalidate();
    }

    public void setPaintColor(int paintColor) {
        this.paintButton.setColor(paintColor);
        this.paintRecord.setColor(paintColor);
        this.paintRecord.setAlpha(70);
        invalidate();
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        long dt = System.currentTimeMillis() - this.lastUpdateTime;
        if (this.animateToAmplitude != this.amplitude) {
            this.amplitude += this.animateAmplitudeDiff * ((float) dt);
            if (this.animateAmplitudeDiff > 0.0f) {
                if (this.amplitude > this.animateToAmplitude) {
                    this.amplitude = this.animateToAmplitude;
                }
            } else if (this.amplitude < this.animateToAmplitude) {
                this.amplitude = this.animateToAmplitude;
            }
            invalidate();
        }
        this.lastUpdateTime = System.currentTimeMillis();
        if (this.amplitude != 0.0f) {
            canvas.drawCircle(getMeasuredWidth() / 2.0f, getMeasuredHeight() / 2.0f, (this.minWaveRadius + (Global.scale(40.0f) * this.amplitude)) * this.scale, this.paintRecord);
        }
        canvas.drawCircle(getMeasuredWidth() / 2.0f, getMeasuredHeight() / 2.0f, this.radius, this.paintButton);
        super.onDraw(canvas);
    }
}
