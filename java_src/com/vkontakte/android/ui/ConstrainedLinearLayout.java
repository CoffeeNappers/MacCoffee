package com.vkontakte.android.ui;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class ConstrainedLinearLayout extends LinearLayout {
    private int maxHeight;
    private int maxWidth;

    public ConstrainedLinearLayout(Context context) {
        super(context);
        this.maxWidth = Integer.MAX_VALUE;
        this.maxHeight = Integer.MAX_VALUE;
    }

    public ConstrainedLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.maxWidth = Integer.MAX_VALUE;
        this.maxHeight = Integer.MAX_VALUE;
        applyAttrs(attrs, 0);
    }

    public ConstrainedLinearLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.maxWidth = Integer.MAX_VALUE;
        this.maxHeight = Integer.MAX_VALUE;
        applyAttrs(attrs, defStyle);
    }

    private void applyAttrs(AttributeSet attrs, int defStyle) {
        if (attrs != null) {
            TypedArray a = getContext().obtainStyledAttributes(attrs, R.styleable.ConstrainedLinearLayout, defStyle, 0);
            this.maxWidth = a.getDimensionPixelSize(0, Integer.MAX_VALUE);
            this.maxHeight = a.getDimensionPixelSize(1, Integer.MAX_VALUE);
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    public void onMeasure(int wms, int hms) {
        if (View.MeasureSpec.getMode(wms) == Integer.MIN_VALUE || View.MeasureSpec.getMode(wms) == 1073741824) {
            wms = Math.min(View.MeasureSpec.getSize(wms), this.maxWidth) | View.MeasureSpec.getMode(wms);
        }
        if (View.MeasureSpec.getMode(hms) == Integer.MIN_VALUE || View.MeasureSpec.getMode(hms) == 1073741824) {
            hms = Math.min(View.MeasureSpec.getSize(hms), this.maxHeight) | View.MeasureSpec.getMode(hms);
        }
        super.onMeasure(wms, hms);
    }
}
