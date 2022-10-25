package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.v7.widget.AppCompatSeekBar;
import android.util.AttributeSet;
import android.view.MotionEvent;
/* loaded from: classes3.dex */
public class SeekBarSamsungFixed extends AppCompatSeekBar {
    boolean enabled;

    public SeekBarSamsungFixed(Context context) {
        super(context);
        this.enabled = true;
    }

    public SeekBarSamsungFixed(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.enabled = true;
    }

    public SeekBarSamsungFixed(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.enabled = true;
    }

    @Override // android.view.View
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Override // android.widget.AbsSeekBar, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        return this.enabled && super.onTouchEvent(event);
    }
}
