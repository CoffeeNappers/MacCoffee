package com.vk.attachpicker.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.util.Utils;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.DisableableViewPager;
import java.lang.reflect.Field;
/* loaded from: classes2.dex */
public class ContentViewPager extends ViewPager {
    private static Field touchSlopField;
    private boolean allowNestedViewHorizontalScroll;
    private Drawable mShadowDrawable;
    private final int shadowHeight;
    private boolean swipeEnabled;

    public ContentViewPager(Context context) {
        super(context);
        this.shadowHeight = Screen.dp(8);
        this.swipeEnabled = true;
        this.allowNestedViewHorizontalScroll = false;
        init();
    }

    public ContentViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.shadowHeight = Screen.dp(8);
        this.swipeEnabled = true;
        this.allowNestedViewHorizontalScroll = false;
        init();
    }

    private void init() {
        try {
            touchSlopField = ViewPager.class.getDeclaredField("mTouchSlop");
            touchSlopField.setAccessible(true);
            touchSlopField.setInt(this, Screen.dp(2));
            this.mShadowDrawable = ContextCompat.getDrawable(getContext(), R.drawable.picker_bg_attach_toolbar);
            this.mShadowDrawable.setCallback(this);
            setWillNotDraw(false);
        } catch (Exception e) {
            throw new RuntimeException("mTouchSlop field not found");
        }
    }

    @Override // android.view.View
    public void setPadding(int left, int top, int right, int bottom) {
        super.setPadding(left, top, right, (int) Picker.getContext().getResources().getDimension(R.dimen.picker_bottom_button_height));
    }

    @Override // android.view.View
    protected boolean fitSystemWindows(Rect insets) {
        boolean res = super.fitSystemWindows(insets);
        setPadding(getPaddingLeft(), getPaddingTop(), getPaddingRight(), (int) Picker.getContext().getResources().getDimension(R.dimen.picker_bottom_button_height));
        return res;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.View
    public void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (this.mShadowDrawable != null) {
            this.mShadowDrawable.setBounds(0, getPaddingTop(), w, getPaddingTop() + this.shadowHeight);
        }
    }

    @Override // android.support.v4.view.ViewPager, android.view.View
    public void draw(Canvas canvas) {
        super.draw(canvas);
        canvas.save();
        canvas.translate(getScrollX(), 0.0f);
        if (this.mShadowDrawable != null) {
            this.mShadowDrawable.draw(canvas);
        }
        canvas.restore();
    }

    @Override // android.support.v4.view.ViewPager, android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent event) {
        if (this.swipeEnabled) {
            return super.onInterceptTouchEvent(event);
        }
        return false;
    }

    @Override // android.support.v4.view.ViewPager, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (this.swipeEnabled) {
            return super.onTouchEvent(event);
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager
    public boolean canScroll(View v, boolean checkV, int dx, int x, int y) {
        if (this.allowNestedViewHorizontalScroll) {
            return super.canScroll(v, checkV, dx, x, y);
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int newHeight = (int) (View.MeasureSpec.getSize(heightMeasureSpec) - getResources().getDimension(R.dimen.picker_toolbar_height));
        super.onMeasure(widthMeasureSpec, View.MeasureSpec.makeMeasureSpec(newHeight, 1073741824));
    }

    public boolean isSwipeEnabled() {
        return this.swipeEnabled;
    }

    public void setSwipeEnabled(boolean swipeEnabled) {
        this.swipeEnabled = swipeEnabled;
    }

    public void setAllowNestedViewHorizontalScroll(boolean allow) {
        this.allowNestedViewHorizontalScroll = allow;
        View activeView = Utils.getPagerActiveView(this);
        if (activeView != null) {
            enablePagers((ViewGroup) activeView, allow);
        }
    }

    private static void enablePagers(ViewGroup view, boolean swipeEnabled) {
        for (int i = 0; i < view.getChildCount(); i++) {
            View v = view.getChildAt(i);
            if (v instanceof DisableableViewPager) {
                v.setEnabled(swipeEnabled);
            } else if (v instanceof me.grishka.appkit.views.DisableableViewPager) {
                ((me.grishka.appkit.views.DisableableViewPager) v).setSwipeEnabled(swipeEnabled);
            } else if (v instanceof ViewGroup) {
                enablePagers((ViewGroup) v, swipeEnabled);
            }
        }
    }
}
