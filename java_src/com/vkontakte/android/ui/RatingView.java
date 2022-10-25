package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.util.AttributeSet;
import android.view.View;
import com.vkontakte.android.Global;
/* loaded from: classes3.dex */
public class RatingView extends View {
    private Paint emptyPaint;
    private Paint filledPaint;
    private float rating;
    private Path star;
    private static final int STAR_SIZE = Global.scale(14.1f);
    private static final int STAR_MARGIN = Global.scale(2.5f);

    public RatingView(Context context) {
        super(context);
        init();
    }

    public RatingView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public RatingView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        this.star = new Path();
        double theta = Math.toRadians(72.0d);
        double delta = Math.toRadians(36.0d);
        double r = STAR_SIZE / 2;
        this.star.moveTo((float) r, (float) ((-r) + r));
        for (int i = 0; i < 5; i++) {
            double x = r * Math.sin(i * theta);
            double y = r * Math.cos(i * theta);
            this.star.lineTo((float) ((-x) + r), (float) ((-y) + r));
            double x2 = Math.sin((i * theta) + delta) * r * 0.4000000059604645d;
            double y2 = Math.cos((i * theta) + delta) * r * 0.4000000059604645d;
            this.star.lineTo((float) ((-x2) + r), (float) ((-y2) + r));
        }
        this.star.close();
        this.filledPaint = new Paint();
        this.filledPaint.setAntiAlias(true);
        this.filledPaint.setColor(-7631217);
        this.emptyPaint = new Paint();
        this.emptyPaint.setAntiAlias(true);
        this.emptyPaint.setColor(-2368549);
    }

    public void setRating(float rating) {
        this.rating = rating;
        invalidate();
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        boolean isFraction = Math.floor((double) this.rating) != Math.ceil((double) this.rating);
        canvas.translate(0.0f, (getHeight() / 2) - (STAR_SIZE / 2));
        for (int i = 0; i < 5; i++) {
            canvas.save();
            canvas.translate((STAR_SIZE * i) + (STAR_MARGIN * i) + getPaddingLeft(), 0.0f);
            if (isFraction && i + 1 == Math.ceil(this.rating)) {
                canvas.save();
                canvas.clipRect(0.0f, 0.0f, (float) Math.round(STAR_SIZE * (this.rating - Math.floor(this.rating))), canvas.getHeight());
                canvas.drawPath(this.star, this.filledPaint);
                canvas.restore();
                canvas.clipRect((float) Math.round(STAR_SIZE * (this.rating - Math.floor(this.rating))), 0.0f, canvas.getWidth(), canvas.getHeight());
                canvas.drawPath(this.star, this.emptyPaint);
            } else {
                canvas.drawPath(this.star, ((float) (i + 1)) <= this.rating ? this.filledPaint : this.emptyPaint);
            }
            canvas.restore();
        }
    }
}
