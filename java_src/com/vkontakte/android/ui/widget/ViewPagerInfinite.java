package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.widget.AbsListView;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class ViewPagerInfinite extends ViewPagerRatio implements Runnable, AbsListView.OnScrollListener {
    private boolean isAttachedToWindow;
    private boolean isResumed;
    private int nextPeriod;
    private int pageMargin;
    private int scrollStateList;
    private int scrollStatePage;

    public ViewPagerInfinite(Context context) {
        super(context);
        this.nextPeriod = 0;
        this.pageMargin = 0;
        this.isAttachedToWindow = false;
        this.isResumed = false;
        this.scrollStatePage = 0;
        this.scrollStateList = 0;
    }

    public ViewPagerInfinite(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.nextPeriod = 0;
        this.pageMargin = 0;
        this.isAttachedToWindow = false;
        this.isResumed = false;
        this.scrollStatePage = 0;
        this.scrollStateList = 0;
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ViewPagerInfinite);
        if (a != null) {
            this.nextPeriod = a.getInteger(0, this.nextPeriod);
            this.pageMargin = a.getDimensionPixelOffset(1, this.pageMargin);
            a.recycle();
        }
        setPageMargin(this.pageMargin);
        addOnPageChangeListener(new ViewPager.OnPageChangeListener() { // from class: com.vkontakte.android.ui.widget.ViewPagerInfinite.1
            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageSelected(int position) {
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrollStateChanged(int state) {
                if (ViewPagerInfinite.this.scrollStatePage = state == 0) {
                    ViewPagerInfinite.this.startNextRunnable();
                } else {
                    ViewPagerInfinite.this.stopNextRunnable();
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.View
    public void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (mo1110getAdapter() != null && getCurrentItem() + 1 >= mo1110getAdapter().getCount()) {
            setCurrentItem(getCurrentItem() - 1, false);
            setCurrentItem(getCurrentItem() + 1, false);
            return;
        }
        setCurrentItem(getCurrentItem() + 1, false);
        setCurrentItem(getCurrentItem() - 1, false);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.isAttachedToWindow = true;
        startNextRunnable();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        this.isAttachedToWindow = false;
        super.onDetachedFromWindow();
        removeCallbacks(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startNextRunnable() {
        if (this.nextPeriod > 0 && this.scrollStateList == 0 && this.scrollStatePage == 0 && this.isResumed) {
            stopNextRunnable();
            postDelayed(this, this.nextPeriod * 1000);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void stopNextRunnable() {
        removeCallbacks(this);
    }

    public void onResume() {
        this.isResumed = true;
        startNextRunnable();
    }

    public void onPause() {
        this.isResumed = false;
        stopNextRunnable();
    }

    @Override // java.lang.Runnable
    public void run() {
        if (this.isAttachedToWindow) {
            setCurrentItem(getCurrentItem() + 1, true);
            startNextRunnable();
        }
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView view, int state) {
        this.scrollStateList = state;
        if (state == 0) {
            startNextRunnable();
        } else {
            stopNextRunnable();
        }
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
    }
}
