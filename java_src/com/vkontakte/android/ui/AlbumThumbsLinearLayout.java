package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
/* loaded from: classes3.dex */
public class AlbumThumbsLinearLayout extends LinearLayout {
    public AlbumThumbsLinearLayout(Context context) {
        super(context);
    }

    public AlbumThumbsLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public AlbumThumbsLinearLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public void onMeasure(int wms, int hms) {
        super.onMeasure(wms, 1073741824 | (View.MeasureSpec.getSize(wms) / 3));
    }
}
