package com.vkontakte.android.ui;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.LinearLayout;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
/* loaded from: classes3.dex */
public class MaxWidthLinearLayout extends LinearLayout {
    private int maxHeight;
    private int maxWidth;

    public MaxWidthLinearLayout(Context context) {
        super(context);
    }

    public MaxWidthLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(attrs);
    }

    public MaxWidthLinearLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(attrs);
    }

    public MaxWidthLinearLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init(attrs);
    }

    private void init(AttributeSet attrs) {
        TypedArray ta = getContext().obtainStyledAttributes(attrs, new int[]{16843039, 16843040});
        this.maxWidth = ta.getDimensionPixelSize(0, 0);
        this.maxHeight = ta.getDimensionPixelSize(1, 0);
        ta.recycle();
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        Log.d("vk", "onMeasure, " + View.MeasureSpec.toString(widthMeasureSpec) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.maxWidth + " | " + View.MeasureSpec.toString(heightMeasureSpec) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.maxHeight);
        if (this.maxWidth > 0) {
            int w = View.MeasureSpec.getSize(widthMeasureSpec);
            if (w > this.maxWidth) {
                widthMeasureSpec = 1073741824 | this.maxWidth;
            }
        }
        if (this.maxHeight > 0) {
            int h = View.MeasureSpec.getSize(heightMeasureSpec);
            if (h > this.maxHeight) {
                heightMeasureSpec = 1073741824 | this.maxHeight;
            }
        }
        Log.d("vk", "-> " + View.MeasureSpec.toString(widthMeasureSpec) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.maxWidth + " | " + View.MeasureSpec.toString(heightMeasureSpec) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.maxHeight);
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int w2 = getMeasuredWidth();
        int h2 = getMeasuredHeight();
        Log.d("vk", "-> " + w2 + " x " + h2);
    }
}
