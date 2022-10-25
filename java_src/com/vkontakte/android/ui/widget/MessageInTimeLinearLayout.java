package com.vkontakte.android.ui.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class MessageInTimeLinearLayout extends LinearLayout {
    private View time;

    public MessageInTimeLinearLayout(Context context) {
        super(context);
    }

    public MessageInTimeLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public MessageInTimeLinearLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @TargetApi(21)
    public MessageInTimeLinearLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        this.time = findViewById(R.id.msg_time);
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        super.onLayout(changed, l, t, r, b);
        if (this.time != null) {
            this.time.layout(((r - l) - this.time.getWidth()) - getPaddingRight(), this.time.getTop(), (r - l) - getPaddingRight(), this.time.getBottom());
        }
    }
}
