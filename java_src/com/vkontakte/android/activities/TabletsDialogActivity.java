package com.vkontakte.android.activities;

import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.LayoutRes;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import com.vkontakte.android.R;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.ui.FitSystemWindowsFragmentWrapperFrameLayout;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class TabletsDialogActivity extends VKActivity {
    private int mGravity = 17;
    private int mMinSpacing = V.dp(32.0f);
    private int mMaxWidth = V.dp(760.0f);
    private int mInputMode = 32;
    private int mWindowBackgroundResource = 17170443;

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.app.Activity
    public void onPostCreate(@Nullable Bundle savedInstanceState) {
        super.onPostCreate(savedInstanceState);
        adjustSize(getWindow(), this.isTablet);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        adjustSize(getWindow(), this.isTablet);
    }

    @Override // android.support.v7.app.AppCompatActivity, android.app.Activity
    public void setContentView(@LayoutRes int layoutResID) {
        setContentView(getLayoutInflater().inflate(layoutResID, (ViewGroup) null));
    }

    public void setDialogGravity(int gravity) {
        this.mGravity = gravity;
    }

    public void setDialogMinSpacing(int minSpacing) {
        this.mMinSpacing = minSpacing;
    }

    public void setDialogMaxWidth(int maxWidth) {
        this.mMaxWidth = maxWidth;
    }

    public void setDialogInputMode(int inputMode) {
        this.mInputMode = inputMode;
    }

    public void setDialogWindowBackgroundResource(int windowBackgroundResource) {
        this.mWindowBackgroundResource = windowBackgroundResource;
    }

    protected void adjustSize(Window window, boolean isTablet) {
        if (isTablet) {
            WindowManager.LayoutParams params = window.getAttributes();
            int width = getResources().getDisplayMetrics().widthPixels;
            params.width = Math.min(this.mMaxWidth, width - (this.mMinSpacing << 1));
            params.height = -1;
            params.softInputMode = this.mInputMode;
            params.gravity = this.mGravity;
            window.setAttributes(params);
            window.setSoftInputMode(this.mInputMode);
        }
        window.setBackgroundDrawableResource(this.mWindowBackgroundResource);
    }

    @Override // android.support.v7.app.AppCompatActivity, android.app.Activity
    public void setContentView(View view) {
        FitSystemWindowsFragmentWrapperFrameLayout contentView = new FitSystemWindowsFragmentWrapperFrameLayout(this);
        if (Build.VERSION.SDK_INT >= 21 && !this.isTablet) {
            getWindow().setStatusBarColor(1140850688);
            contentView.setFitsSystemWindows(true);
            contentView.setDrawStatusBar(true);
            contentView.setStatusBarColor(getResources().getColor(R.color.brand_primary));
            contentView.setClipToPadding(true);
            contentView.setSystemUiVisibility(1280);
        }
        contentView.addView(view);
        super.setContentView(contentView);
    }
}
