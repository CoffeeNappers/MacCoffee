package com.vk.attachpicker.widget;

import android.content.Context;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;
/* loaded from: classes2.dex */
public class VkViewPager extends ViewPager {
    public VkViewPager(Context context) {
        super(context);
    }

    public VkViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // android.support.v4.view.ViewPager, android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        try {
            return super.onInterceptTouchEvent(ev);
        } catch (IllegalArgumentException e) {
            return false;
        }
    }
}
