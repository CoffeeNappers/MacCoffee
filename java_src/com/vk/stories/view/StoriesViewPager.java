package com.vk.stories.view;

import android.annotation.SuppressLint;
import android.content.Context;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.animation.Interpolator;
import android.widget.Scroller;
import com.vk.core.util.TimeoutLock;
import java.lang.reflect.Field;
/* loaded from: classes2.dex */
public class StoriesViewPager extends ViewPager {
    private ScrollerCustomDuration mScroller;
    private final TimeoutLock touchLocker;

    public StoriesViewPager(Context context) {
        super(context);
        this.touchLocker = new TimeoutLock(500L);
        this.mScroller = null;
        postInitViewPager();
    }

    public StoriesViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.touchLocker = new TimeoutLock(500L);
        this.mScroller = null;
        postInitViewPager();
    }

    public void lockTouches() {
        this.touchLocker.lock();
    }

    @Override // android.support.v4.view.ViewPager, android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        if (this.touchLocker.isLocked()) {
            return false;
        }
        return super.onInterceptTouchEvent(ev);
    }

    @Override // android.support.v4.view.ViewPager, android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (this.touchLocker.isLocked()) {
            return false;
        }
        return super.onTouchEvent(ev);
    }

    private void postInitViewPager() {
        try {
            Field scroller = ViewPager.class.getDeclaredField("mScroller");
            scroller.setAccessible(true);
            Field interpolator = ViewPager.class.getDeclaredField("sInterpolator");
            interpolator.setAccessible(true);
            this.mScroller = new ScrollerCustomDuration(getContext(), (Interpolator) interpolator.get(null));
            scroller.set(this, this.mScroller);
        } catch (Exception e) {
        }
    }

    public void setScrollDurationFactor(double scrollFactor) {
        this.mScroller.setScrollDurationFactor(scrollFactor);
    }

    /* loaded from: classes2.dex */
    public class ScrollerCustomDuration extends Scroller {
        private double mScrollFactor;

        public ScrollerCustomDuration(Context context) {
            super(context);
            this.mScrollFactor = 1.5d;
        }

        public ScrollerCustomDuration(Context context, Interpolator interpolator) {
            super(context, interpolator);
            this.mScrollFactor = 1.5d;
        }

        @SuppressLint({"NewApi"})
        public ScrollerCustomDuration(Context context, Interpolator interpolator, boolean flywheel) {
            super(context, interpolator, flywheel);
            this.mScrollFactor = 1.5d;
        }

        public void setScrollDurationFactor(double scrollFactor) {
            this.mScrollFactor = scrollFactor;
        }

        @Override // android.widget.Scroller
        public void startScroll(int startX, int startY, int dx, int dy, int duration) {
            super.startScroll(startX, startY, dx, dy, (int) (duration * this.mScrollFactor));
        }
    }
}
