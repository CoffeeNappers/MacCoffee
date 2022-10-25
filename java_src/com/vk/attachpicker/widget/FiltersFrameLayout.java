package com.vk.attachpicker.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vk.attachpicker.stickers.StickersDrawingView;
/* loaded from: classes2.dex */
public class FiltersFrameLayout extends FrameLayout {
    private StickersDrawingView stickersView;

    public FiltersFrameLayout(Context context) {
        super(context);
    }

    public FiltersFrameLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public FiltersFrameLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent ev) {
        if (this.stickersView != null) {
            this.stickersView.dispatchTouchEvent(ev);
            return true;
        }
        this.stickersView = findStickersView(this);
        if (this.stickersView != null) {
            this.stickersView.dispatchTouchEvent(ev);
            return true;
        }
        return false;
    }

    private static StickersDrawingView findStickersView(ViewGroup view) {
        StickersDrawingView p;
        for (int i = 0; i < view.getChildCount(); i++) {
            View v = view.getChildAt(i);
            if (v.getClass() == StickersDrawingView.class) {
                return (StickersDrawingView) v;
            }
            if ((v instanceof ViewGroup) && (p = findStickersView((ViewGroup) v)) != null) {
                return p;
            }
        }
        return null;
    }
}
