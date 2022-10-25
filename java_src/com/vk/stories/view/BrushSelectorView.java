package com.vk.stories.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.support.v4.graphics.ColorUtils;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.View;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class BrushSelectorView extends View {
    private static final int COLOR_NONE = -5460562;
    private int backgroundCircleColor;
    private Drawable bottomDrawable;
    private Drawable topDrawable;
    private Drawable topWhiteDrawable;
    private static final int backgroundCircleRadius = Screen.dp(20);
    private static final Paint backgroundCirclePaint = new Paint(1);

    static {
        backgroundCirclePaint.setStyle(Paint.Style.FILL);
    }

    public BrushSelectorView(Context context) {
        this(context, null);
    }

    public BrushSelectorView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public BrushSelectorView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.BrushSelectorView, 0, 0);
        int topDrawableResId = a.getResourceId(0, R.drawable.pen_marker_color_48dp);
        int topWhiteDrawableResId = a.getResourceId(1, R.drawable.pen_marker_color_white_48dp);
        int bottomDrawableResId = a.getResourceId(2, R.drawable.pen_marker_chrome_48dp);
        a.recycle();
        setBackgroundResource(R.drawable.picker_white_ripple_unbounded);
        setTopDrawableResId(topDrawableResId);
        setTopWhiteDrawableResId(topWhiteDrawableResId);
        setBottomDrawableResId(bottomDrawableResId);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int cx = canvas.getWidth() / 2;
        int cy = canvas.getHeight() / 2;
        if (this.backgroundCircleColor != 0) {
            if (Color.red(this.backgroundCircleColor) == 255 && Color.green(this.backgroundCircleColor) == 255 && Color.blue(this.backgroundCircleColor) == 255) {
                backgroundCirclePaint.setColor(ColorUtils.setAlphaComponent(ViewCompat.MEASURED_STATE_MASK, 51));
            } else {
                backgroundCirclePaint.setColor(this.backgroundCircleColor);
            }
            canvas.drawCircle(cx, cy, backgroundCircleRadius, backgroundCirclePaint);
        }
        if (Color.red(this.backgroundCircleColor) == 255 && Color.green(this.backgroundCircleColor) == 255 && Color.blue(this.backgroundCircleColor) == 255) {
            this.topWhiteDrawable.draw(canvas);
        } else {
            this.topDrawable.draw(canvas);
        }
        this.bottomDrawable.draw(canvas);
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        this.topDrawable.setBounds(0, 0, w, h);
        this.topWhiteDrawable.setBounds(0, 0, w, h);
        this.bottomDrawable.setBounds(0, 0, w, h);
    }

    public void setTopDrawableResId(int resId) {
        this.topDrawable = ContextCompat.getDrawable(getContext(), resId);
        invalidate();
    }

    public void setTopWhiteDrawableResId(int resId) {
        this.topWhiteDrawable = ContextCompat.getDrawable(getContext(), resId);
        invalidate();
    }

    public void setBottomDrawableResId(int resId) {
        this.bottomDrawable = ContextCompat.getDrawable(getContext(), resId);
        invalidate();
    }

    public void setColorNone() {
        this.topDrawable.setColorFilter(COLOR_NONE, PorterDuff.Mode.MULTIPLY);
        this.topWhiteDrawable.setColorFilter(COLOR_NONE, PorterDuff.Mode.MULTIPLY);
        this.backgroundCircleColor = 0;
        invalidate();
    }

    public void setColor(int color) {
        this.topDrawable.setColorFilter(color, PorterDuff.Mode.MULTIPLY);
        this.topWhiteDrawable.setColorFilter(color, PorterDuff.Mode.MULTIPLY);
        this.backgroundCircleColor = ColorUtils.setAlphaComponent(color, 51);
        invalidate();
    }
}
