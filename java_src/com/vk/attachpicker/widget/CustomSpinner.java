package com.vk.attachpicker.widget;

import android.content.Context;
import android.support.v7.widget.AppCompatSpinner;
import android.util.AttributeSet;
import android.view.View;
import com.vk.core.util.Screen;
import com.vkontakte.android.ui.SearchViewWrapper;
/* loaded from: classes2.dex */
public class CustomSpinner extends AppCompatSpinner {
    public static final int MAX_WIDTH = Screen.dp((int) SearchViewWrapper.CONFIRM_TIMEOUT);

    public CustomSpinner(Context context) {
        super(context);
    }

    public CustomSpinner(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public CustomSpinner(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.AppCompatSpinner, android.widget.Spinner, android.widget.AbsSpinner, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (View.MeasureSpec.getSize(widthMeasureSpec) > MAX_WIDTH) {
            widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(MAX_WIDTH, 1073741824);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }
}
