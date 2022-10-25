package com.fourmob.datetimepicker.date;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.widget.TextView;
import com.fourmob.datetimepicker.R;
/* loaded from: classes.dex */
public class TextViewWithCircularIndicator extends TextView {
    private final int mCircleColor;
    Paint mCirclePaint;
    private boolean mDrawCircle;
    private final String mItemIsSelectedText;
    private final int mRadius;

    public TextViewWithCircularIndicator(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mCirclePaint = new Paint();
        Resources localResources = context.getResources();
        this.mCircleColor = localResources.getColor(R.color.blue);
        this.mRadius = localResources.getDimensionPixelOffset(R.dimen.month_select_circle_radius);
        this.mItemIsSelectedText = context.getResources().getString(R.string.item_is_selected);
        init();
    }

    private void init() {
        this.mCirclePaint.setFakeBoldText(true);
        this.mCirclePaint.setAntiAlias(true);
        this.mCirclePaint.setColor(this.mCircleColor);
        this.mCirclePaint.setTextAlign(Paint.Align.CENTER);
        this.mCirclePaint.setStyle(Paint.Style.FILL);
        this.mCirclePaint.setAlpha(60);
    }

    public void drawIndicator(boolean drawIndicator) {
        this.mDrawCircle = drawIndicator;
    }

    @Override // android.view.View
    public CharSequence getContentDescription() {
        CharSequence text = getText();
        return this.mDrawCircle ? String.format(this.mItemIsSelectedText, text) : text;
    }

    @Override // android.widget.TextView, android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mDrawCircle) {
            int width = getWidth();
            int heigth = getHeight();
            int radius = Math.min(width, heigth) / 2;
            canvas.drawCircle(width / 2, heigth / 2, radius, this.mCirclePaint);
        }
    }
}
