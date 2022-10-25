package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import com.vkontakte.android.Global;
/* loaded from: classes3.dex */
public class FormFieldsLayout extends LinearLayout {
    public FormFieldsLayout(Context context) {
        super(context);
        init();
    }

    public FormFieldsLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public FormFieldsLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    public void init() {
        setOrientation(1);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public void onMeasure(int wms, int hms) {
        super.onMeasure(View.MeasureSpec.getMode(wms) | Math.min(View.MeasureSpec.getSize(wms), Global.scale(500.0f)), hms);
    }
}
