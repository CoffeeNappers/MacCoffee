package com.my.target.nativeads.views;

import android.content.Context;
import android.graphics.Canvas;
import android.view.View;
import com.my.target.core.ui.drawables.a;
/* loaded from: classes2.dex */
public class StarsRatingView extends View {
    private a drawable;

    public StarsRatingView(Context context) {
        super(context);
        this.drawable = new a(context.getResources().getDisplayMetrics().density);
    }

    public void setRating(float f) {
        this.drawable.a(f);
        invalidate();
    }

    public void setRating(double d) {
        setRating((float) d);
    }

    public void setStarsPadding(float f) {
        this.drawable.b(f);
        invalidate();
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        this.drawable.a(getMeasuredHeight());
        setMeasuredDimension(getPaddingLeft() + getMeasuredWidth() + getPaddingRight(), getPaddingTop() + getMeasuredHeight() + getPaddingBottom());
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        this.drawable.draw(canvas);
    }
}
