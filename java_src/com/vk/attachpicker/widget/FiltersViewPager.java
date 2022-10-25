package com.vk.attachpicker.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;
import com.vk.attachpicker.util.Utils;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.Screen;
import java.lang.reflect.Field;
/* loaded from: classes2.dex */
public class FiltersViewPager extends ViewPager {
    private static Field touchSlopField;
    private ValueAnimator fakeSwipeAnimator;
    private final Handler handler;
    private boolean swipeEnabled;

    public FiltersViewPager(Context context) {
        super(context);
        this.handler = new Handler(Looper.getMainLooper());
        this.swipeEnabled = true;
        init();
    }

    public FiltersViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.handler = new Handler(Looper.getMainLooper());
        this.swipeEnabled = true;
        init();
    }

    private void init() {
        try {
            if (touchSlopField == null) {
                touchSlopField = ViewPager.class.getDeclaredField("mTouchSlop");
                touchSlopField.setAccessible(true);
            }
            touchSlopField.setInt(this, Screen.dp(16));
        } catch (Exception e) {
            throw new RuntimeException("mTouchSlop field not found");
        }
    }

    public void showFakeSwipe() {
        Utils.runOnPreDraw(this, FiltersViewPager$$Lambda$1.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$showFakeSwipe$0() {
        beginFakeDrag();
        final float targetSwipe = getMeasuredWidth() * 0.4f;
        this.fakeSwipeAnimator = ObjectAnimator.ofFloat(0.0f, 1.0f);
        this.fakeSwipeAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vk.attachpicker.widget.FiltersViewPager.1
            float prevValue = 0.0f;

            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator animation) {
                float v = ((Float) animation.getAnimatedValue()).floatValue();
                float delta = v - this.prevValue;
                this.prevValue = v;
                if (FiltersViewPager.this.isFakeDragging()) {
                    FiltersViewPager.this.fakeDragBy((-delta) * targetSwipe);
                }
            }
        });
        this.fakeSwipeAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.widget.FiltersViewPager.2
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animation) {
                onAnimationEnd(animation);
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                FiltersViewPager.this.fakeSwipeAnimator = null;
            }
        });
        this.fakeSwipeAnimator.setInterpolator(AnimationUtils.decelerateInterpolator2);
        this.fakeSwipeAnimator.setDuration(300L);
        this.fakeSwipeAnimator.start();
    }

    public void cancelFakeSwipe() {
        if (this.fakeSwipeAnimator != null) {
            this.fakeSwipeAnimator.cancel();
        }
        if (isFakeDragging()) {
            endFakeDrag();
        }
    }

    @Override // android.support.v4.view.ViewPager, android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent event) {
        cancelFakeSwipe();
        if (this.swipeEnabled) {
            return super.onInterceptTouchEvent(event);
        }
        return false;
    }

    @Override // android.support.v4.view.ViewPager, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        cancelFakeSwipe();
        if (this.swipeEnabled) {
            return super.onTouchEvent(event);
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.View
    public void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        this.handler.post(new Runnable() { // from class: com.vk.attachpicker.widget.FiltersViewPager.3
            @Override // java.lang.Runnable
            public void run() {
                if (!FiltersViewPager.this.isFakeDragging()) {
                    FiltersViewPager.this.beginFakeDrag();
                    if (FiltersViewPager.this.isFakeDragging()) {
                        FiltersViewPager.this.endFakeDrag();
                    }
                }
            }
        });
    }

    public boolean isSwipeEnabled() {
        return this.swipeEnabled;
    }

    public void setSwipeEnabled(boolean swipeEnabled) {
        this.swipeEnabled = swipeEnabled;
    }
}
