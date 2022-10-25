package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class MishkPlayerLayout extends LinearLayout {
    public MishkPlayerLayout(Context context) {
        super(context);
    }

    public MishkPlayerLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public MishkPlayerLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public MishkPlayerLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int h = View.MeasureSpec.getSize(heightMeasureSpec);
        int w = View.MeasureSpec.getSize(widthMeasureSpec);
        setMeasuredDimension(View.MeasureSpec.getSize(widthMeasureSpec), h);
        getChildAt(0).measure(w | 1073741824, (h - V.dp(168.0f)) | Integer.MIN_VALUE);
        getChildAt(1).measure(w | 1073741824, h | Integer.MIN_VALUE);
        getChildAt(3).measure(w | 1073741824, h | Integer.MIN_VALUE);
        getChildAt(2).measure(w | 1073741824, Math.max(Math.min(((h - getChildAt(0).getMeasuredHeight()) - getChildAt(1).getMeasuredHeight()) - getChildAt(3).getMeasuredHeight(), V.dp(96.0f)), V.dp(64.0f)) | 1073741824);
    }
}
