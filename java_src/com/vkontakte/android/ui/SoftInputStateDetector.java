package com.vkontakte.android.ui;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.ViewUtils;
import io.fabric.sdk.android.services.events.EventsFilesManager;
/* loaded from: classes3.dex */
public abstract class SoftInputStateDetector implements View.OnLayoutChangeListener {
    private Activity activity;
    private int lastHeight = 0;
    private boolean lastState = false;

    public abstract void onKeyboardStateChanged(boolean z, int i);

    public SoftInputStateDetector(Activity act) {
        this.activity = act;
    }

    public void onContentViewResize(int w, int h, int oldw, int oldh) {
        boolean z = true;
        Rect rect = new Rect();
        this.activity.getWindow().getDecorView().getWindowVisibleDisplayFrame(rect);
        Log.i("vk", "Visible rect=" + rect);
        int i = rect.top;
        int scrH = this.activity.getWindow().getDecorView().getHeight();
        if (Build.VERSION.SDK_INT >= 20) {
            scrH -= ViewUtils.getNavigationBarHeight(this.activity);
        }
        int diff = scrH - rect.bottom;
        this.lastHeight = diff;
        this.lastState = diff > Global.scale(100.0f);
        if (diff > Global.scale(100.0f)) {
            this.activity.getSharedPreferences("emoji", 0).edit().putInt("kbd_height" + this.activity.getResources().getDisplayMetrics().widthPixels + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.activity.getResources().getDisplayMetrics().heightPixels, diff).commit();
        }
        if (diff <= Global.scale(100.0f)) {
            z = false;
        }
        onKeyboardStateChanged(z, diff);
    }

    public int getHeight() {
        return this.lastHeight;
    }

    public boolean isShown() {
        return this.lastState;
    }

    public int getSoftInputHeight() {
        return this.lastHeight > 0 ? this.lastHeight : this.activity.getSharedPreferences("emoji", 0).getInt("kbd_height" + this.activity.getResources().getDisplayMetrics().widthPixels + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.activity.getResources().getDisplayMetrics().heightPixels, 0);
    }

    @Override // android.view.View.OnLayoutChangeListener
    public void onLayoutChange(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
        onContentViewResize(right - left, bottom - top, oldRight - oldLeft, oldBottom - oldTop);
    }
}
