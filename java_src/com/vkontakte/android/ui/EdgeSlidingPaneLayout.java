package com.vkontakte.android.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.support.v4.widget.SlidingPaneLayout;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowInsets;
import com.vkontakte.android.R;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class EdgeSlidingPaneLayout extends SlidingPaneLayout {
    private static final int EDGE_WIDTH = V.dp(40.0f);
    private Drawable shadow;
    private int statusBarHeight;
    private Paint statusBarPaint;

    public EdgeSlidingPaneLayout(Context context) {
        super(context);
        init();
    }

    public EdgeSlidingPaneLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public EdgeSlidingPaneLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    private void init() {
        this.statusBarPaint = new Paint();
        this.statusBarPaint.setColor(getResources().getColor(R.color.brand_primary));
        this.shadow = getResources().getDrawable(R.drawable.shadow_menu_tablet_inner);
    }

    public void setStatusBarColor(int color) {
        this.statusBarPaint.setColor(color);
        invalidate();
    }

    @Override // android.support.v4.widget.SlidingPaneLayout, android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        if (isOpen()) {
            if (getChildCount() > 0) {
                View view = getChildAt(0);
                if (ev.getX() > view.getWidth()) {
                    return true;
                }
            }
        } else if (getChildCount() > 1) {
            View slideable = getChildAt(1);
            if (ev.getX() > slideable.getLeft() + EDGE_WIDTH) {
                return false;
            }
        }
        return super.onInterceptTouchEvent(ev);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.widget.SlidingPaneLayout, android.view.ViewGroup, android.view.View
    public void onLayout(boolean changed, int l, int t, int r, int b) {
        super.onLayout(changed, l, t, r, b);
        for (int i = 0; i < getChildCount(); i++) {
            View c = getChildAt(i);
            SlidingPaneLayout.LayoutParams lp = (SlidingPaneLayout.LayoutParams) c.getLayoutParams();
            if (lp.topMargin != 0) {
                c.layout(c.getLeft(), c.getTop() + lp.topMargin, c.getRight(), c.getBottom());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.widget.SlidingPaneLayout, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        if (getChildCount() >= 1) {
            getChildAt(0).measure(View.MeasureSpec.makeMeasureSpec(((SlidingPaneLayout.LayoutParams) getChildAt(0).getLayoutParams()).width, 1073741824), View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(heightMeasureSpec), 1073741824));
            for (int i = 1; i < getChildCount(); i++) {
                int h = View.MeasureSpec.getSize(heightMeasureSpec);
                if (!getChildAt(i).getFitsSystemWindows()) {
                    h = (h - getPaddingTop()) - getPaddingBottom();
                }
                SlidingPaneLayout.LayoutParams lp = (SlidingPaneLayout.LayoutParams) getChildAt(i).getLayoutParams();
                getChildAt(i).measure(View.MeasureSpec.makeMeasureSpec((View.MeasureSpec.getSize(widthMeasureSpec) - lp.leftMargin) - lp.rightMargin, 1073741824), View.MeasureSpec.makeMeasureSpec(h, 1073741824));
            }
        }
    }

    @Override // android.view.View
    @TargetApi(21)
    public WindowInsets onApplyWindowInsets(WindowInsets windowInsets) {
        int topInset = windowInsets.getSystemWindowInsetTop();
        this.statusBarHeight = topInset;
        for (int i = 0; i < getChildCount(); i++) {
            View c = getChildAt(i);
            if (c.getFitsSystemWindows()) {
                SlidingPaneLayout.LayoutParams lp = (SlidingPaneLayout.LayoutParams) c.getLayoutParams();
                lp.topMargin = -topInset;
                c.setLayoutParams(lp);
                c.dispatchApplyWindowInsets(windowInsets);
            }
        }
        return super.onApplyWindowInsets(windowInsets);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (getChildCount() >= 2) {
            canvas.drawRect(getChildAt(1).getLeft(), 0.0f, getWidth(), this.statusBarHeight, this.statusBarPaint);
            this.shadow.setBounds(getChildAt(1).getLeft() - this.shadow.getIntrinsicWidth(), 0, getChildAt(1).getLeft(), getHeight());
            this.shadow.draw(canvas);
        }
    }
}
