package com.vkontakte.android.stickers;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class LeftDeltaLayout extends FrameLayout {
    private CalloutPopupBackgroundDrawable calloutPopupBackgroundDrawable;
    private int delta;

    public LeftDeltaLayout(Context context) {
        super(context);
        this.delta = 0;
    }

    public LeftDeltaLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.delta = 0;
    }

    public LeftDeltaLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.delta = 0;
    }

    public void setDelta(int delta) {
        this.delta = delta;
        requestLayout();
    }

    public void setCalloutPopupBackgroundDrawable(CalloutPopupBackgroundDrawable calloutPopupBackgroundDrawable) {
        this.calloutPopupBackgroundDrawable = calloutPopupBackgroundDrawable;
    }

    @TargetApi(21)
    public LeftDeltaLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.delta = 0;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        if (getChildCount() == 1) {
            int start = Math.min(this.delta, Math.max(0, (this.delta + V.dp(92.5f)) - getChildAt(0).getMeasuredWidth()));
            if (this.calloutPopupBackgroundDrawable != null) {
                this.calloutPopupBackgroundDrawable.setLeftSize(V.dp(30.0f) + (this.delta - start));
                this.calloutPopupBackgroundDrawable.setCenterSize(V.dp(32.0f));
                this.calloutPopupBackgroundDrawable.invalidateSelf();
            }
            getChildAt(0).layout(getPaddingLeft() + start, top, getPaddingLeft() + start + getChildAt(0).getMeasuredWidth(), bottom);
            return;
        }
        super.onLayout(changed, left, top, right, bottom);
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (getChildCount() == 1) {
            int start = Math.min(this.delta, Math.max(0, (this.delta + V.dp(92.5f)) - getChildAt(0).getMeasuredWidth()));
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
            setMeasuredDimension(getMeasuredWidth() + start, getMeasuredHeight());
            return;
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }
}
