package com.vk.core.util;

import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
/* loaded from: classes2.dex */
public class AndroidBug5497Workaround2 {
    private View contentView;
    private View decorView;
    ViewTreeObserver.OnGlobalLayoutListener onGlobalLayoutListener = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.vk.core.util.AndroidBug5497Workaround2.1
        @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
        public void onGlobalLayout() {
            Rect r = new Rect();
            AndroidBug5497Workaround2.this.decorView.getWindowVisibleDisplayFrame(r);
            int height = AndroidBug5497Workaround2.this.decorView.getContext().getResources().getDisplayMetrics().heightPixels;
            int diff = height - r.bottom;
            if (diff != 0) {
                if (AndroidBug5497Workaround2.this.contentView.getPaddingBottom() != diff) {
                    AndroidBug5497Workaround2.this.contentView.setPadding(0, 0, 0, diff);
                }
            } else if (AndroidBug5497Workaround2.this.contentView.getPaddingBottom() != 0) {
                AndroidBug5497Workaround2.this.contentView.setPadding(0, 0, 0, 0);
            }
        }
    };

    public AndroidBug5497Workaround2(Window window, View contentView) {
        this.decorView = window.getDecorView();
        this.contentView = contentView;
        if (Build.VERSION.SDK_INT >= 19) {
            this.decorView.getViewTreeObserver().addOnGlobalLayoutListener(this.onGlobalLayoutListener);
        }
    }

    public void enable() {
        if (Build.VERSION.SDK_INT >= 19) {
            this.decorView.getViewTreeObserver().addOnGlobalLayoutListener(this.onGlobalLayoutListener);
        }
    }

    public void disable() {
        if (Build.VERSION.SDK_INT >= 19) {
            this.decorView.getViewTreeObserver().removeOnGlobalLayoutListener(this.onGlobalLayoutListener);
        }
    }
}
