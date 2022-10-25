package com.vkontakte.android.ui;

import android.support.v4.view.ViewPager;
import android.util.Log;
/* loaded from: classes3.dex */
public class ViewPagerDetector implements ViewPager.OnPageChangeListener {
    private final Callback callback;
    private int mLastState;
    private int next;
    private Boolean isToLeft = null;
    private boolean isDraggingStarted = false;
    private float lastX = -1.0f;

    /* loaded from: classes3.dex */
    public interface Callback {
        void onPageScrolled(int i, int i2, float f);

        void onPageSelected(int i);
    }

    public ViewPagerDetector(Callback callback) {
        this.callback = callback;
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
        if (this.isDraggingStarted) {
            if (this.lastX != -1.0f) {
                if (this.isToLeft == null) {
                    if (positionOffset > this.lastX) {
                        this.isToLeft = false;
                    } else {
                        this.isToLeft = true;
                    }
                    this.next = this.isToLeft.booleanValue() ? position : position + 1;
                }
                if (position != this.next || this.isToLeft.booleanValue()) {
                    float percent = this.isToLeft.booleanValue() ? 1.0f - positionOffset : positionOffset;
                    Log.e("onPageScrolled()", String.format("[%d, %d, %f]", Integer.valueOf(position), Integer.valueOf(this.next), Float.valueOf(percent)));
                    this.callback.onPageScrolled(position, this.next, percent);
                } else {
                    return;
                }
            }
            this.lastX = positionOffset;
        }
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageSelected(int position) {
        if (this.mLastState != 2) {
            Log.e("onPageSelected()", "====================================================");
            this.callback.onPageSelected(position);
        }
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrollStateChanged(int state) {
        Log.e("onScrollStateChanged", "====================================================");
        this.mLastState = state;
        if (state == 1 || state == 2) {
            this.isDraggingStarted = true;
        } else if (state == 0) {
            this.isDraggingStarted = false;
            this.isToLeft = null;
            this.lastX = -1.0f;
            this.next = 0;
        }
    }
}
