package com.vk.attachpicker.widget;

import android.app.Activity;
import android.support.annotation.IdRes;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
/* loaded from: classes2.dex */
public abstract class VKWindow implements View.OnKeyListener, View.OnAttachStateChangeListener {
    protected final Activity mActivity;
    boolean mAttached;
    protected final View mRootView;
    final WindowManager mWindowManager;

    public VKWindow(@NonNull Activity activity, @LayoutRes int layout) {
        this(activity, activity.getLayoutInflater().inflate(layout, (ViewGroup) null));
    }

    public VKWindow(@NonNull Activity activity, @LayoutRes View view) {
        this.mAttached = false;
        this.mActivity = activity;
        this.mWindowManager = activity.getWindowManager();
        this.mRootView = view;
        this.mRootView.setOnKeyListener(this);
        this.mRootView.addOnAttachStateChangeListener(this);
    }

    public void show() {
        onViewCreated(this.mRootView);
        this.mWindowManager.addView(this.mRootView, onCreateWindowLayoutParams());
    }

    public void finish() {
        RuntimeException runtimeException;
        if (this.mAttached) {
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

    public void onViewCreated(@NonNull View root) {
    }

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

    public boolean isAttached() {
        return this.mAttached;
    }
}
