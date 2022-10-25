package com.vkontakte.android.ui;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.v4.view.ViewCompat;
import android.support.v4.widget.DrawerLayout;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class TabletAwareDrawerLayout extends DrawerLayout {
    private static final int DEFAULT_SCRIM_COLOR = -1728053248;
    private Drawable actionBarBg;
    private OnFixedStateChangedListener listener;
    private Rect rect;
    private boolean showFixed;
    private int statusBarHeight;
    private Paint statusBarPaint;
    private int topInset;

    /* loaded from: classes3.dex */
    public interface OnFixedStateChangedListener {
        void onFixedStateChanged(boolean z);
    }

    public TabletAwareDrawerLayout(Context context) {
        super(context);
        this.showFixed = false;
        this.topInset = 0;
        this.actionBarBg = null;
        this.rect = new Rect();
        this.statusBarHeight = 0;
        init();
    }

    public TabletAwareDrawerLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.showFixed = false;
        this.topInset = 0;
        this.actionBarBg = null;
        this.rect = new Rect();
        this.statusBarHeight = 0;
        init();
    }

    public TabletAwareDrawerLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.showFixed = false;
        this.topInset = 0;
        this.actionBarBg = null;
        this.rect = new Rect();
        this.statusBarHeight = 0;
        init();
    }

    private void init() {
        if (Build.VERSION.SDK_INT >= 21) {
            this.statusBarPaint = new Paint();
            TypedArray ta = getContext().getTheme().obtainStyledAttributes(new int[]{R.attr.colorPrimary});
            this.statusBarPaint.setColor(ta.getColor(0, ViewCompat.MEASURED_STATE_MASK));
            ta.recycle();
        }
    }

    @Override // android.support.v4.widget.DrawerLayout, android.view.View
    public void onMeasure(int wms, int hms) {
        int w = View.MeasureSpec.getSize(wms);
        int h = View.MeasureSpec.getSize(hms);
        int ww = getResources().getConfiguration().screenWidthDp;
        int wh = getResources().getConfiguration().screenHeightDp;
        boolean newShowFixed = ww > wh && Screen.isTablet(getContext());
        if (this.showFixed != newShowFixed) {
            this.showFixed = newShowFixed;
            if (this.listener != null) {
                this.listener.onFixedStateChanged(newShowFixed);
            }
        }
        if (this.showFixed) {
            View content = getChildAt(0);
            View menu = getChildAt(1);
            DrawerLayout.LayoutParams mlp = (DrawerLayout.LayoutParams) menu.getLayoutParams();
            menu.measure(mlp.width | 1073741824, h | 1073741824);
            content.measure((w - menu.getMeasuredWidth()) | 1073741824, h | 1073741824);
            setMeasuredDimension(w, h);
            menu.setVisibility(0);
            setScrimColor(0);
            return;
        }
        super.onMeasure(wms, hms);
        setScrimColor(DEFAULT_SCRIM_COLOR);
    }

    @Override // android.support.v4.widget.DrawerLayout, android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        if (this.showFixed) {
            return false;
        }
        return super.onInterceptTouchEvent(ev);
    }

    @Override // android.support.v4.widget.DrawerLayout, android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (this.showFixed) {
            return false;
        }
        return super.onTouchEvent(ev);
    }

    @Override // android.support.v4.widget.DrawerLayout
    public void closeDrawers() {
        if (!this.showFixed) {
            super.closeDrawers();
        }
    }

    public boolean isShownFixed() {
        return this.showFixed;
    }

    public void setOnFixedStateChangedListener(OnFixedStateChangedListener l) {
        this.listener = l;
    }

    public void setStatusBarHeight(int h) {
        this.statusBarHeight = h;
        invalidate();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        if (this.statusBarHeight > 0) {
            canvas.drawRect(0.0f, 0.0f, canvas.getWidth(), this.statusBarHeight, this.statusBarPaint);
        }
        super.dispatchDraw(canvas);
    }
}
