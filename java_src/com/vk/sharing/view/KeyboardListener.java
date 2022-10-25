package com.vk.sharing.view;

import android.content.res.Resources;
import android.support.annotation.NonNull;
import android.view.ViewTreeObserver;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class KeyboardListener implements ViewTreeObserver.OnGlobalLayoutListener {
    private int prevHeight = -1;
    private final int screenHeight;
    private final int statusBarHeight;
    @NonNull
    private final SharingView view;

    /* JADX INFO: Access modifiers changed from: package-private */
    public KeyboardListener(@NonNull SharingView view) {
        this.view = view;
        this.view.getViewTreeObserver().addOnGlobalLayoutListener(this);
        Resources res = view.getResources();
        int resId = res.getIdentifier("status_bar_height", "dimen", AbstractSpiCall.ANDROID_CLIENT_TYPE);
        if (resId != 0) {
            this.statusBarHeight = res.getDimensionPixelSize(resId);
        } else {
            this.statusBarHeight = 0;
        }
        this.screenHeight = res.getDisplayMetrics().heightPixels;
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public void onGlobalLayout() {
        if (this.prevHeight == -1) {
            this.prevHeight = this.view.getHeight();
        }
        if (this.prevHeight != this.view.getHeight()) {
            int keyboardHeight = Math.abs(this.prevHeight - this.view.getHeight());
            this.prevHeight = this.view.getHeight();
            if (this.prevHeight + this.statusBarHeight == this.screenHeight) {
                this.view.onHiddenKeyboard(keyboardHeight);
            } else {
                this.view.onOpenedKeyboard(keyboardHeight);
            }
        }
    }
}
