package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import com.vkontakte.android.Global;
/* loaded from: classes3.dex */
public class BarcodeViewfinderLayout extends FrameLayout {
    private int cropHorizontal;
    private int cropVertical;
    private Path invRoundRect;
    private Path markerCorner;
    private Paint markerFillClearPaint;
    private Paint markerFillPaint;
    private Paint markerStrokePaint;
    private Paint whitePaint;

    public BarcodeViewfinderLayout(Context context) {
        super(context);
        init();
    }

    public BarcodeViewfinderLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public BarcodeViewfinderLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    private void init() {
        setWillNotDraw(false);
        this.markerFillPaint = new Paint();
        this.markerFillPaint.setColor(-1711276033);
        this.markerFillClearPaint = new Paint();
        this.markerFillClearPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
        this.markerFillClearPaint.setColor(ViewCompat.MEASURED_STATE_MASK);
        this.markerStrokePaint = new Paint();
        this.markerStrokePaint.setColor(637534208);
        this.markerStrokePaint.setStyle(Paint.Style.STROKE);
        this.markerStrokePaint.setStrokeWidth(Global.scale(2.0f));
        this.whitePaint = new Paint();
        this.whitePaint.setAntiAlias(true);
        this.whitePaint.setColor(-1);
        int thickness = Global.scale(3.0f);
        int width = Global.scale(36.0f);
        this.markerCorner = new Path();
        this.markerCorner.moveTo(0.0f, 0.0f);
        this.markerCorner.rLineTo(width, 0.0f);
        this.markerCorner.rLineTo(0.0f, thickness);
        this.markerCorner.rLineTo(-(width - thickness), 0.0f);
        this.markerCorner.rLineTo(0.0f, width - thickness);
        this.markerCorner.rLineTo(-thickness, 0.0f);
        this.markerCorner.rLineTo(0.0f, -width);
        this.markerCorner.close();
        this.invRoundRect = new Path();
        this.invRoundRect.toggleInverseFillType();
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        super.onLayout(changed, l, t, r, b);
        for (int i = 0; i < getChildCount(); i++) {
            View c = getChildAt(i);
            c.layout(c.getLeft() - this.cropHorizontal, c.getTop() - this.cropVertical, c.getRight() + this.cropHorizontal, c.getBottom() + this.cropVertical);
        }
    }

    public void setCrop(int x, int y) {
        this.cropHorizontal = x;
        this.cropVertical = y;
        requestLayout();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (this.invRoundRect.isEmpty()) {
            this.invRoundRect.addRoundRect(new RectF(0.0f, 0.0f, canvas.getWidth(), canvas.getHeight()), Global.scale(3.0f), Global.scale(3.0f), Path.Direction.CW);
        }
        canvas.drawPath(this.invRoundRect, this.whitePaint);
        canvas.saveLayer(0.0f, 0.0f, canvas.getWidth(), canvas.getHeight(), null, 31);
        for (int i = 0; i < 4; i++) {
            canvas.save();
            canvas.rotate(i * 90, canvas.getWidth() / 2, canvas.getHeight() / 2);
            canvas.translate(Global.scale(35.0f), Global.scale(35.0f));
            canvas.drawPath(this.markerCorner, this.markerStrokePaint);
            canvas.drawPath(this.markerCorner, this.markerFillClearPaint);
            canvas.drawPath(this.markerCorner, this.markerFillPaint);
            canvas.restore();
        }
        canvas.restore();
    }
}
