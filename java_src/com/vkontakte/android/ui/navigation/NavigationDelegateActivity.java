package com.vkontakte.android.ui.navigation;

import android.app.Fragment;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.view.Menu;
import android.view.MenuItem;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.fragments.BackListener;
/* loaded from: classes3.dex */
public abstract class NavigationDelegateActivity extends VKActivity implements NavigationDelegateProvider {
    private NavigationDelegate navigationDelegate;

    protected abstract boolean isTopLevel();

    private NavigationDelegate createNavigationDelegate(NavigationDelegateActivity act) {
        return Screen.isTablet(act) ? new NavigationDelegateSlider(act, act.isTopLevel()) : new NavigationDelegateDrawer(act, act.isTopLevel());
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.navigationDelegate = createNavigationDelegate(this);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        this.navigationDelegate.onResume();
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration cfg) {
        super.onConfigurationChanged(cfg);
        this.navigationDelegate.onConfigurationChanged(cfg);
    }

    @Override // android.app.Activity
    public boolean onPrepareOptionsMenu(Menu m) {
        this.navigationDelegate.onPrepareOptionsMenu(m);
        return super.onPrepareOptionsMenu(m);
    }

    @Override // com.vkontakte.android.VKActivity, android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        return this.navigationDelegate.onOptionsItemSelected(item) || super.onOptionsItemSelected(item);
    }

    @Override // android.support.v7.app.AppCompatActivity, android.view.ContextThemeWrapper, android.content.ContextWrapper, android.content.Context
    public Resources getResources() {
        Resources resOrigin = super.getResources();
        Resources res = this.navigationDelegate == null ? null : this.navigationDelegate.getResources(resOrigin);
        return res == null ? resOrigin : res;
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        if (!this.navigationDelegate.onBackPressed()) {
            Fragment f = getFragmentManager().findFragmentById(R.id.fragment_wrapper);
            if (f == null || !(f instanceof BackListener) || !((BackListener) f).onBackPressed()) {
                super.onBackPressed();
            }
        }
    }

    public void updateUserInfo() {
        if (this.navigationDelegate instanceof NavigationDelegateLeftMenu) {
            ((NavigationDelegateLeftMenu) this.navigationDelegate).updateUserInfo();
        }
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateProvider
    @NonNull
    public NavigationDelegate getNavigationDelegate() {
        return this.navigationDelegate;
    }

    @Override // android.app.Activity
    public boolean onNavigateUp() {
        return getNavigationDelegate().onNavigateUp();
    }
}
