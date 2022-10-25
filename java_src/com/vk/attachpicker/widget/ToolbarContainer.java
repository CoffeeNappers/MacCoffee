package com.vk.attachpicker.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class ToolbarContainer extends FrameLayout {
    public ToolbarContainer(Context context) {
        super(context);
    }

    public ToolbarContainer(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public ToolbarContainer(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, View.MeasureSpec.makeMeasureSpec((int) getResources().getDimension(R.dimen.picker_toolbar_height), 1073741824));
    }
}
