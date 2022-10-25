package com.vkontakte.android.ui;

import android.content.Context;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;
/* loaded from: classes3.dex */
public class DisableableViewPager extends ViewPager {
    public DisableableViewPager(Context context) {
        super(context);
    }

    public DisableableViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // android.support.v4.view.ViewPager, android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (!isEnabled()) {
            return false;
        }
        try {
            return super.onTouchEvent(ev);
        } catch (Exception e) {
            return false;
        }
    }

    @Override // android.support.v4.view.ViewPager, android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        if (!isEnabled()) {
            return false;
        }
        return super.onInterceptTouchEvent(ev);
    }
}
