package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.LinearLayout;
/* loaded from: classes3.dex */
public class MessageLinearLayout extends LinearLayout {
    public MessageLinearLayout(Context context) {
        super(context);
    }

    public MessageLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public MessageLinearLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent ev) {
        return isEnabled() && super.dispatchTouchEvent(ev);
    }
}
