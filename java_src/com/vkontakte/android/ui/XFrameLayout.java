package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import com.vkontakte.android.utils.Utils;
/* loaded from: classes3.dex */
public class XFrameLayout extends FrameLayout {
    private OnKeyboardStateChangeListener listener;
    private int prevh;
    private int prevw;

    /* loaded from: classes3.dex */
    public interface OnKeyboardStateChangeListener {
        void onKeyboardStateChanged(boolean z);
    }

    public XFrameLayout(Context context) {
        super(context);
        this.prevw = -1;
        this.prevh = -1;
        this.listener = null;
    }

    public XFrameLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.prevw = -1;
        this.prevh = -1;
        this.listener = null;
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int wm, int hm) {
        if (isInEditMode()) {
            super.onMeasure(wm, hm);
            return;
        }
        int w = View.MeasureSpec.getSize(wm);
        int h = View.MeasureSpec.getSize(hm);
        if (this.prevh != -1 && this.prevw != -1 && this.prevw == w) {
            Rect rect = new Rect();
            Utils.castToActivity(getContext()).getWindow().getDecorView().getWindowVisibleDisplayFrame(rect);
            int statusBarHeight = rect.top;
            int screenHeight = Utils.castToActivity(getContext()).getWindowManager().getDefaultDisplay().getHeight();
            int diff = (screenHeight - statusBarHeight) - h;
            if (this.listener != null) {
                this.listener.onKeyboardStateChanged(diff >= 128);
            }
        }
        this.prevw = w;
        this.prevh = h;
        super.onMeasure(wm, hm);
    }

    public void setOnKeyboardStateListener(OnKeyboardStateChangeListener listener) {
        this.listener = listener;
    }
}
