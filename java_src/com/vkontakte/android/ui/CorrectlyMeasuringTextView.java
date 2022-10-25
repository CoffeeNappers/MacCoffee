package com.vkontakte.android.ui;

import android.content.Context;
import android.text.Layout;
import android.util.AttributeSet;
/* loaded from: classes3.dex */
public class CorrectlyMeasuringTextView extends LinkedTextView {
    public CorrectlyMeasuringTextView(Context context) {
        super(context);
    }

    public CorrectlyMeasuringTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public CorrectlyMeasuringTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.widget.TextView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        Layout layout = getLayout();
        if (layout != null) {
            int width = ((int) Math.ceil(getMaxLineWidth(layout))) + getCompoundPaddingLeft() + getCompoundPaddingRight();
            int height = getMeasuredHeight();
            setMeasuredDimension(width, height);
        }
    }

    private float getMaxLineWidth(Layout layout) {
        float max_width = (getMinWidth() - getPaddingLeft()) - getPaddingRight();
        int lines = layout.getLineCount();
        for (int i = 0; i < lines; i++) {
            if (layout.getLineWidth(i) > max_width) {
                max_width = layout.getLineWidth(i);
            }
        }
        return max_width;
    }
}
