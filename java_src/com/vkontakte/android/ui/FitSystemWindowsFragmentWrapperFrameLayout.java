package com.vkontakte.android.ui;

import android.app.Fragment;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Build;
import android.support.annotation.ColorInt;
import android.widget.FrameLayout;
import com.vkontakte.android.fragments.FitSystemWindowsFragment;
import com.vkontakte.android.utils.Utils;
/* loaded from: classes3.dex */
public class FitSystemWindowsFragmentWrapperFrameLayout extends FrameLayout {
    private boolean mDrawStatusBar;
    private int mInsetTop;
    @ColorInt
    private int mStatusBarColor;
    private Paint mStatusBarPaint;

    public FitSystemWindowsFragmentWrapperFrameLayout(Context activity) {
        super(activity);
        this.mInsetTop = 0;
    }

    public void setDrawStatusBar(boolean draw) {
        if (draw != this.mDrawStatusBar) {
            this.mDrawStatusBar = draw;
            if (this.mDrawStatusBar && this.mStatusBarPaint == null) {
                this.mStatusBarPaint = new Paint();
            }
            this.mStatusBarPaint.setColor(this.mStatusBarColor);
            invalidate();
        }
    }

    public void setStatusBarColor(@ColorInt int color) {
        if (color != this.mStatusBarColor) {
            this.mStatusBarColor = color;
            if (this.mStatusBarPaint == null) {
                this.mStatusBarPaint = new Paint();
            }
            this.mStatusBarPaint.setColor(this.mStatusBarColor);
            invalidate();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (this.mDrawStatusBar) {
            canvas.drawRect(0.0f, 0.0f, getWidth(), this.mInsetTop, this.mStatusBarPaint);
        }
    }

    @Override // android.view.View
    protected boolean fitSystemWindows(Rect insets) {
        if (this.mDrawStatusBar) {
            this.mInsetTop = insets.top;
            invalidate();
        }
        Fragment fragment = Utils.castToActivity(getContext()).getFragmentManager().findFragmentById(getId());
        if (fragment != null && !(fragment instanceof FitSystemWindowsFragment)) {
            return super.fitSystemWindows(insets);
        }
        if (Build.VERSION.SDK_INT < 21) {
            return super.fitSystemWindows(insets);
        }
        if (fragment != null && ((FitSystemWindowsFragment) fragment).fitSystemWindows(insets)) {
            insets.set(0, 0, 0, 0);
        }
        return super.fitSystemWindows(insets);
    }

    public int getInsetTop() {
        return this.mInsetTop;
    }
}
