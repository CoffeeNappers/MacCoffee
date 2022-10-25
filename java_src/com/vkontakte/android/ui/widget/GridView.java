package com.vkontakte.android.ui.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class GridView extends ViewGroup {
    protected int columns;
    protected int divider;

    public GridView(Context context) {
        super(context);
        this.divider = 0;
        this.columns = -1;
    }

    public GridView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.divider = 0;
        this.columns = -1;
        init(attrs);
    }

    public GridView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.divider = 0;
        this.columns = -1;
        init(attrs);
    }

    @TargetApi(21)
    public GridView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.divider = 0;
        this.columns = -1;
        init(attrs);
    }

    protected void init(AttributeSet attrs) {
        TypedArray a = getContext().obtainStyledAttributes(attrs, R.styleable.GridView);
        if (a != null) {
            this.divider = a.getDimensionPixelSize(0, this.divider);
            a.recycle();
        }
    }

    public void setColumns(int columns) {
        if (columns > 1 && columns < 16) {
            this.columns = columns;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int columns = this.columns < 0 ? getChildCount() : this.columns;
        int childCount = getChildCount();
        int height = b - t;
        int leftPadding = getPaddingLeft();
        int width = ((r - l) - leftPadding) - getPaddingRight();
        int widthItem = (width - ((columns - 1) * this.divider)) / columns;
        for (int i = 0; i < childCount; i++) {
            getChildAt(i).layout(((this.divider + widthItem) * i) + leftPadding, 0, ((this.divider + widthItem) * i) + leftPadding + widthItem, height);
        }
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int columns = this.columns < 0 ? getChildCount() : this.columns;
        int width = (View.MeasureSpec.getSize(widthMeasureSpec) - getPaddingLeft()) - getPaddingRight();
        int childCount = getChildCount();
        int widthItem = (width - ((columns - 1) * this.divider)) / columns;
        int childWidthMeasureSpec = View.MeasureSpec.makeMeasureSpec(widthItem, 1073741824);
        int childHeightMeasureSpec = View.MeasureSpec.makeMeasureSpec(4000, Integer.MIN_VALUE);
        int height = 0;
        for (int i = 0; i < childCount; i++) {
            getChildAt(i).measure(childWidthMeasureSpec, childHeightMeasureSpec);
            height = Math.max(height, getChildAt(i).getMeasuredHeight());
        }
        int childHeightMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(height, 1073741824);
        for (int i2 = 0; i2 < childCount; i2++) {
            getChildAt(i2).measure(childWidthMeasureSpec, childHeightMeasureSpec2);
        }
        setMeasuredDimension(getPaddingLeft() + width + getPaddingRight(), getPaddingTop() + height + getPaddingBottom());
    }
}
