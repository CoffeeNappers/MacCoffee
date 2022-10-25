package com.vk.core.util;

import android.app.Activity;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
/* loaded from: classes2.dex */
public class AndroidBug5497Workaround implements ViewTreeObserver.OnGlobalLayoutListener {
    private FrameLayout.LayoutParams frameLayoutParams;
    private View mChildOfContent;
    private int usableHeightPrevious;

    public static AndroidBug5497Workaround assist(Activity activity) {
        return new AndroidBug5497Workaround((FrameLayout) ((FrameLayout) activity.findViewById(16908290)).getChildAt(0));
    }

    public static AndroidBug5497Workaround assist(FrameLayout parentLayout) {
        return new AndroidBug5497Workaround(parentLayout);
    }

    private AndroidBug5497Workaround(FrameLayout content) {
        this.mChildOfContent = content;
        this.mChildOfContent.getViewTreeObserver().addOnGlobalLayoutListener(this);
        this.frameLayoutParams = (FrameLayout.LayoutParams) this.mChildOfContent.getLayoutParams();
    }

    private void possiblyResizeChildOfContent() {
        int usableHeightNow = computeUsableHeight();
        if (usableHeightNow != this.usableHeightPrevious) {
            this.frameLayoutParams.height = usableHeightNow;
            this.usableHeightPrevious = usableHeightNow;
            this.mChildOfContent.requestLayout();
        }
    }

    private int computeUsableHeight() {
        Rect r = new Rect();
        this.mChildOfContent.getWindowVisibleDisplayFrame(r);
        return r.bottom - r.top;
    }

    public void destroy() {
        if (this.mChildOfContent != null) {
            CompatUtils.removeOnGlobalLayoutListener(this.mChildOfContent, this);
        }
        this.mChildOfContent = null;
        this.frameLayoutParams = null;
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public void onGlobalLayout() {
        possiblyResizeChildOfContent();
    }
}
