package com.vkontakte.android.ui.navigation;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.v4.widget.DrawerLayout;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.media.VideoPools;
import com.vkontakte.android.stickers.KeyboardPopup;
import com.vkontakte.android.ui.widget.MenuListView;
/* loaded from: classes3.dex */
class NavigationDelegateDrawer extends NavigationDelegateLeftMenu<DrawerLayout> implements DrawerLayout.DrawerListener {
    private boolean mStartDragging;

    /* JADX INFO: Access modifiers changed from: package-private */
    public NavigationDelegateDrawer(@NonNull Activity activity, boolean isTopLevel) {
        super(activity, isTopLevel);
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu
    void initializeLeftMenu(View contentView) {
        this.menu = (DrawerLayout) View.inflate(this.activity, R.layout.drawer_wrapper_normal, null);
        ((DrawerLayout) this.menu).addView(contentView);
        ((DrawerLayout) this.menu).setDrawerShadow(R.drawable.navigation_drawer_shadow, 3);
        if (Build.VERSION.SDK_INT >= 21) {
            this.activity.getWindow().setStatusBarColor(1140850688);
            ((DrawerLayout) this.menu).setStatusBarBackgroundColor(ViewUtils.fetchSystemColor(this.activity, R.attr.colorPrimary));
            this.menuList.setFitsSystemWindows(true);
        }
        ((DrawerLayout) this.menu).addView(this.menuList, new DrawerLayout.LayoutParams(MenuListView.getRecommendedWidth(this.activity), -1, 3));
        ((DrawerLayout) this.menu).setDrawerListener(this);
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu
    public void openMenu() {
        if (this.menu != 0) {
            ((DrawerLayout) this.menu).openDrawer(this.menuList);
        }
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu
    public void closeMenu() {
        if (this.menu != 0) {
            ((DrawerLayout) this.menu).closeDrawers();
        }
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu
    public void setStatusBarColor(int color) {
        if (this.menu != 0) {
            ((DrawerLayout) this.menu).setStatusBarBackgroundColor(color);
        }
    }

    @Override // android.support.v4.widget.DrawerLayout.DrawerListener
    public void onDrawerSlide(View drawerView, float offset) {
        if (offset == 0.0f || offset == 1.0f) {
            this.mStartDragging = false;
        } else if (!this.mStartDragging) {
            this.mStartDragging = true;
            hideKeyboard();
            this.menuList.prepare();
        }
    }

    @Override // android.support.v4.widget.DrawerLayout.DrawerListener
    public void onDrawerOpened(View drawerView) {
        onMenuOpened();
    }

    @Override // android.support.v4.widget.DrawerLayout.DrawerListener
    public void onDrawerClosed(View drawerView) {
        onMenuClosed();
    }

    @Override // android.support.v4.widget.DrawerLayout.DrawerListener
    public void onDrawerStateChanged(int newState) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu
    public void onMenuOpened() {
        super.onMenuOpened();
        VideoPools.onPause(this.activity);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu
    public void onMenuClosed() {
        super.onMenuClosed();
        VideoPools.onResume(this.activity);
    }

    private void hideKeyboard() {
        if (this.activity.getCurrentFocus() != null) {
            InputMethodManager imm = (InputMethodManager) this.activity.getSystemService("input_method");
            imm.hideSoftInputFromWindow(this.activity.getCurrentFocus().getWindowToken(), 0);
            this.activity.getCurrentFocus().clearFocus();
        }
        this.activity.sendBroadcast(new Intent(KeyboardPopup.ACTION_HIDE_POPUP), "com.vkontakte.android.permission.ACCESS_DATA");
    }
}
