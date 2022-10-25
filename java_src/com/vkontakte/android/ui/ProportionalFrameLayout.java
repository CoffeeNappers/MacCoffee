package com.vkontakte.android.ui;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.RelativeLayout;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class ProportionalFrameLayout extends RelativeLayout {
    private float heightRatio;

    public ProportionalFrameLayout(Context context) {
        super(context);
        this.heightRatio = 1.0f;
    }

    public ProportionalFrameLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.heightRatio = 1.0f;
        init(attrs);
    }

    public ProportionalFrameLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.heightRatio = 1.0f;
        init(attrs);
    }

    public ProportionalFrameLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.heightRatio = 1.0f;
        init(attrs);
    }

    private void init(AttributeSet attrs) {
        TypedArray ta = getContext().obtainStyledAttributes(attrs, new int[]{R.attr.heightRatio});
        this.heightRatio = ta.getFloat(0, 1.0f);
        ta.recycle();
    }

    public float getHeightRatio() {
        return this.heightRatio;
    }

    public void setHeightRatio(float heightRatio) {
        this.heightRatio = heightRatio;
        requestLayout();
    }

    @Override // android.widget.RelativeLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int heightMeasureSpec2 = ((int) (View.MeasureSpec.getSize(widthMeasureSpec) * this.heightRatio)) | 1073741824;
        super.onMeasure(widthMeasureSpec, heightMeasureSpec2);
    }
}
