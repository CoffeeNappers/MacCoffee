package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
/* loaded from: classes3.dex */
public class FullWidthLinearLayout extends LinearLayout {
    public FullWidthLinearLayout(Context context) {
        super(context);
    }

    public FullWidthLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public FullWidthLinearLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public void onMeasure(int wms, int hms) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(wms), 1073741824), hms);
    }
}
