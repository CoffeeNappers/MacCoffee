package com.vkontakte.android.gifs;

import android.app.Activity;
import android.support.annotation.CallSuper;
import android.support.annotation.IdRes;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
/* loaded from: classes3.dex */
public abstract class VKWindow implements View.OnKeyListener, View.OnAttachStateChangeListener {
    final Activity mActivity;
    boolean mAttached = false;
    boolean mFinished = false;
    final View mRootView;
    final WindowManager mWindowManager;

    public VKWindow(@NonNull Activity activity, @LayoutRes int layout) {
        this.mActivity = activity;
        this.mWindowManager = activity.getWindowManager();
        this.mRootView = activity.getLayoutInflater().inflate(layout, (ViewGroup) null);
        this.mRootView.setOnKeyListener(this);
        this.mRootView.addOnAttachStateChangeListener(this);
    }

    @CallSuper
    public void show() {
        onViewCreated(this.mRootView);
        this.mWindowManager.addView(this.mRootView, onCreateWindowLayoutParams());
    }

    @CallSuper
    public void finish() {
        RuntimeException runtimeException;
        if (this.mAttached && !this.mFinished) {
            this.mFinished = true;
            onViewDestroyed();
            try {
                this.mWindowManager.removeView(this.mRootView);
            } finally {
                try {
                } catch (Throwable t) {
                }
            }
        }
    }

    @CallSuper
    public void onViewCreated(@NonNull View root) {
    }

    @CallSuper
    public void onViewDestroyed() {
    }

    public WindowManager.LayoutParams onCreateWindowLayoutParams() {
        return new WindowManager.LayoutParams(-1, -1, 2, 0, 1);
    }

    public final <T extends View> T $(@IdRes int id) {
        return (T) this.mRootView.findViewById(id);
    }

    public final Activity getActivity() {
        return this.mActivity;
    }

    @Override // android.view.View.OnKeyListener
    public final boolean onKey(View v, int keyCode, KeyEvent event) {
        if (!onKeyEvent(keyCode, event)) {
            if (keyCode == 4) {
                if (event.getAction() != 1) {
                    return true;
                }
                finish();
                return true;
            }
            return false;
        }
        return true;
    }

    public boolean onKeyEvent(int keyCode, KeyEvent event) {
        return false;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View v) {
        this.mAttached = true;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View v) {
        this.mAttached = false;
    }
}
