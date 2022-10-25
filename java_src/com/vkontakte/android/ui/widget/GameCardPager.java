package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewTreeObserver;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class GameCardPager extends ViewPager {
    int maxItemWidth;
    int minPadding;

    public GameCardPager(Context context) {
        super(context);
        this.minPadding = 0;
        this.maxItemWidth = 0;
    }

    public GameCardPager(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.minPadding = 0;
        this.maxItemWidth = 0;
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.GameCardPager);
        if (a != null) {
            this.minPadding = a.getDimensionPixelSize(0, this.minPadding);
            this.maxItemWidth = a.getDimensionPixelSize(1, this.maxItemWidth);
            setPageMargin(a.getDimensionPixelSize(2, 0));
            a.recycle();
        }
    }

    @Override // android.support.v4.view.ViewPager
    public void setOnPageChangeListener(ViewPager.OnPageChangeListener listener) {
        super.setOnPageChangeListener(listener);
    }

    @Override // android.support.v4.view.ViewPager
    public void addOnPageChangeListener(ViewPager.OnPageChangeListener listener) {
        super.addOnPageChangeListener(listener);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.View
    public void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        ViewTreeObserver.OnPreDrawListener onPreDrawListener = new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.widget.GameCardPager.1
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                GameCardPager.this.requestLayout();
                GameCardPager.this.getViewTreeObserver().removeOnPreDrawListener(this);
                return true;
            }
        };
        getViewTreeObserver().addOnPreDrawListener(onPreDrawListener);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (this.maxItemWidth != 0 || this.minPadding != 0) {
            int extPadding = Math.max(0, (View.MeasureSpec.getSize(widthMeasureSpec) - (this.minPadding * 2)) - this.maxItemWidth);
            int padding = this.minPadding + (extPadding / 2);
            if (getPaddingLeft() != padding || getPaddingRight() != padding) {
                setPadding(padding, 0, padding, 0);
            }
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }
}
