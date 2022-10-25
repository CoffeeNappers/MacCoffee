package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;
/* loaded from: classes3.dex */
public class FixedSizeFrameLayout extends FrameLayout {
    private int h;
    private int w;

    public FixedSizeFrameLayout(Context context) {
        super(context);
    }

    public FixedSizeFrameLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public FixedSizeFrameLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    public void setSize(int w, int h) {
        this.w = w;
        this.h = h;
        requestLayout();
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int wms, int hms) {
        super.onMeasure(this.w | 1073741824, this.h | 1073741824);
    }
}
