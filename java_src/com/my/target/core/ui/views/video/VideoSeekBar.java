package com.my.target.core.ui.views.video;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.MotionEvent;
import android.view.View;
/* loaded from: classes2.dex */
public class VideoSeekBar extends View {
    Paint a;
    private int b;
    private int c;
    private int d;

    public VideoSeekBar(Context context) {
        super(context);
        this.a = new Paint();
        this.d = 20;
        setBackgroundColor(-1996488705);
        this.a.setColor(-16733198);
        this.a.setStrokeWidth(20.0f);
        this.a.setStyle(Paint.Style.STROKE);
        this.a.setStrokeJoin(Paint.Join.ROUND);
        setOnTouchListener(new View.OnTouchListener() { // from class: com.my.target.core.ui.views.video.VideoSeekBar.1
            @Override // android.view.View.OnTouchListener
            public final boolean onTouch(View view, MotionEvent motionEvent) {
                return true;
            }
        });
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        setMeasuredDimension(i, View.MeasureSpec.makeMeasureSpec(this.d, 1073741824));
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        if (getWidth() != 0 && getHeight() != 0 && this.b != 0 && this.c != 0) {
            canvas.drawLine(0.0f, getHeight() / 2, (getWidth() / this.b) * this.c, getHeight() / 2, this.a);
        }
    }

    public void setHeight(int i) {
        this.d = i;
        this.a.setStrokeWidth(i);
    }

    public void setMax(int i) {
        this.b = i;
    }

    public void setProgress(int i) {
        this.c = i;
        invalidate();
    }
}
