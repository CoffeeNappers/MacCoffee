package com.vk.attachpicker.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import com.vk.core.util.Screen;
import com.vkontakte.android.ui.SearchViewWrapper;
/* loaded from: classes2.dex */
public class MaxWidthFrameLayout extends FrameLayout {
    public static final int MAX_WIDTH = Screen.dp((int) SearchViewWrapper.CONFIRM_TIMEOUT);

    public MaxWidthFrameLayout(Context context) {
        super(context);
    }

    public MaxWidthFrameLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public MaxWidthFrameLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (View.MeasureSpec.getSize(widthMeasureSpec) > MAX_WIDTH) {
            widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(MAX_WIDTH, 1073741824);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }
}
