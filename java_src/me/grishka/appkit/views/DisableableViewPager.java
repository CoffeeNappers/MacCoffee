package me.grishka.appkit.views;

import android.content.Context;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;
/* loaded from: classes3.dex */
public class DisableableViewPager extends ViewPager {
    private boolean swipeEnabled;

    public DisableableViewPager(Context context) {
        super(context);
        this.swipeEnabled = true;
    }

    public DisableableViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.swipeEnabled = true;
    }

    @Override // android.support.v4.view.ViewPager, android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        return this.swipeEnabled && super.onInterceptTouchEvent(ev);
    }

    @Override // android.support.v4.view.ViewPager, android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        return this.swipeEnabled && super.onTouchEvent(ev);
    }

    public boolean isSwipeEnabled() {
        return this.swipeEnabled;
    }

    public void setSwipeEnabled(boolean swipeEnabled) {
        this.swipeEnabled = swipeEnabled;
    }
}
