package com.vkontakte.android.ui.layout;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class MaxHeightLinearLayout extends LinearLayout {
    private int mMaxHeight;

    public MaxHeightLinearLayout(Context context) {
        super(context);
        this.mMaxHeight = 0;
    }

    public MaxHeightLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mMaxHeight = 0;
        init(context, attrs);
    }

    public MaxHeightLinearLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mMaxHeight = 0;
        init(context, attrs);
    }

    @TargetApi(21)
    public MaxHeightLinearLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mMaxHeight = 0;
        init(context, attrs);
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (this.mMaxHeight > 0) {
            heightMeasureSpec = View.MeasureSpec.makeMeasureSpec(this.mMaxHeight, Integer.MIN_VALUE);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    public int getMaxHeight() {
        return this.mMaxHeight;
    }

    public void setMaxHeight(int mMaxHeight) {
        this.mMaxHeight = mMaxHeight;
    }

    private void init(Context context, AttributeSet attrs) {
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.MaxHeightLinearLayout);
        if (a != null) {
            this.mMaxHeight = a.getDimensionPixelSize(0, this.mMaxHeight);
            a.recycle();
        }
    }
}
