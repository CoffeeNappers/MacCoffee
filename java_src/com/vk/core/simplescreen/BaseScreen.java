package com.vk.core.simplescreen;

import android.app.Activity;
import android.content.res.Resources;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.CallSuper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
/* loaded from: classes2.dex */
public abstract class BaseScreen {
    private final Handler handler = new Handler(Looper.getMainLooper());
    private boolean isDestroyed = false;
    private boolean isResumed = false;
    private ScreenContainer parentLayout;
    private View screenView;

    public abstract View createView(LayoutInflater layoutInflater);

    public View getView(LayoutInflater inflater) {
        if (this.screenView == null) {
            this.screenView = createView(inflater);
            this.screenView.setClickable(true);
        }
        return this.screenView;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setParentLayout(ScreenContainer layout) {
        if (this.parentLayout != layout) {
            this.parentLayout = layout;
            if (this.screenView != null) {
                ViewGroup parent = (ViewGroup) this.screenView.getParent();
                if (parent != null) {
                    parent.removeView(this.screenView);
                }
                this.screenView = null;
            }
        }
    }

    public void onTopPaddingChanged(int topPadding) {
    }

    public void finish() {
        if (!this.isDestroyed && this.parentLayout != null) {
            this.parentLayout.closeLastScreen();
        }
    }

    @CallSuper
    public void onDestroy() {
        this.isDestroyed = true;
    }

    @CallSuper
    public void onResume() {
        this.isResumed = true;
    }

    @CallSuper
    public void onPause() {
        this.isResumed = false;
    }

    public boolean onBackPressed() {
        return false;
    }

    public void showScreen(BaseScreen fragment) {
        if (fragment != null) {
            this.parentLayout.showScreen(fragment);
        }
    }

    public boolean isAdded() {
        return getActivity() != null && !this.isDestroyed;
    }

    public Activity getActivity() {
        if (this.parentLayout != null) {
            return this.parentLayout.parentActivity;
        }
        return null;
    }

    public Resources getResources() {
        return getActivity().getResources();
    }

    public String getString(int id) {
        try {
            return getResources().getString(id);
        } catch (Exception e) {
            return "";
        }
    }

    public ScreenContainer getContainer() {
        return this.parentLayout;
    }

    public View getScreenView() {
        return this.screenView;
    }

    public boolean isDestroyed() {
        return this.isDestroyed;
    }

    public boolean isResumed() {
        return this.isResumed;
    }

    public void post(Runnable r) {
        this.handler.post(r);
    }

    public void postDelayed(Runnable r, long delay) {
        this.handler.postDelayed(r, delay);
    }

    public void cancel(Runnable r) {
        this.handler.removeCallbacks(r);
    }
}
