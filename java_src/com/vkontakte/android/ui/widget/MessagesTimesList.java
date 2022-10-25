package com.vkontakte.android.ui.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
/* loaded from: classes3.dex */
public class MessagesTimesList extends FrameLayout {
    public static int DX = VKApplication.context.getResources().getDimensionPixelSize(R.dimen.message_time);
    private View list;

    public MessagesTimesList(Context context) {
        super(context);
    }

    public MessagesTimesList(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public MessagesTimesList(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @TargetApi(21)
    public MessagesTimesList(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public void setList(View list) {
        this.list = list;
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int h = View.MeasureSpec.getSize(heightMeasureSpec);
        int w = View.MeasureSpec.getSize(widthMeasureSpec);
        for (int i = getChildCount() - 1; i >= 0; i--) {
            View view = getChildAt(i);
            view.measure(View.MeasureSpec.makeMeasureSpec((view == this.list ? DX : 0) + w, 1073741824), View.MeasureSpec.makeMeasureSpec(h, 1073741824));
        }
        setMeasuredDimension(w, h);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        for (int i = getChildCount() - 1; i >= 0; i--) {
            View view = getChildAt(i);
            if (view == this.list) {
                view.layout(l, t, DX + r, b);
            } else {
                view.layout(l, t, r, b);
            }
        }
    }
}
