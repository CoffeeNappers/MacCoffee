package me.grishka.appkit.fragments;

import android.app.Activity;
import android.app.Fragment;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.LayoutRes;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import java.util.List;
import me.grishka.appkit.fragments.TabbedScreen;
/* loaded from: classes3.dex */
public abstract class TabbedLoaderFragment extends LoaderFragment implements TabbedScreen {
    private TabbedScreen.Delegate delegate = new TabbedScreen.Delegate(this) { // from class: me.grishka.appkit.fragments.TabbedLoaderFragment.1
        @Override // me.grishka.appkit.fragments.TabbedScreen.Delegate
        public void onPageSelected(int pos) {
            TabbedLoaderFragment.this.onPageSelected(pos);
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen.Delegate
        public void invalidateOptionsMenu() {
            TabbedLoaderFragment.this.invalidateOptionsMenu();
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen.Delegate, me.grishka.appkit.fragments.TabbedScreen
        public PagerAdapter createAdapter() {
            PagerAdapter adapter = TabbedLoaderFragment.this.createPagerAdapter();
            return adapter == null ? super.createAdapter() : adapter;
        }
    };

    public void onPageSelected(int pos) {
    }

    public PagerAdapter createPagerAdapter() {
        return null;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setHasOptionsMenu(true);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return this.delegate.createView();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.delegate.destroyView();
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public boolean isSwipeEnabled() {
        return this.delegate.isSwipeEnabled();
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void setSwipeEnabled(boolean enabled) {
        this.delegate.setSwipeEnabled(enabled);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void setTabs(List<? extends Fragment> fragments, List<? extends CharSequence> titles) {
        this.delegate.setTabs(fragments, titles);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public Fragment getTabAt(int position) {
        return this.delegate.getTabAt(position);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void setTabTitle(int position, CharSequence title) {
        this.delegate.setTabTitle(position, title);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void invalidateTabTitles() {
        this.delegate.invalidateTabTitles();
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void addTab(int position, Fragment tab, CharSequence title) {
        this.delegate.addTab(position, tab, title);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void removeTab(int position) {
        this.delegate.removeTab(position);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void removeTab(Fragment tab) {
        this.delegate.removeTab(tab);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void addOnPageChangeListener(ViewPager.OnPageChangeListener listener) {
        this.delegate.addOnPageChangeListener(listener);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void removeOnPageChangeListener(ViewPager.OnPageChangeListener listener) {
        this.delegate.removeOnPageChangeListener(listener);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void setTabsVisible(boolean visible) {
        this.delegate.setTabsVisible(visible);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void setPagerCurrentItem(int position) {
        this.delegate.setPagerCurrentItem(position);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void setPagerCurrentItem(int position, boolean scroll) {
        this.delegate.setPagerCurrentItem(position, scroll);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public int getPagerCurrentItem() {
        return this.delegate.getPagerCurrentItem();
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public View getTabView() {
        return this.delegate.getTabView();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void showContent() {
        super.showContent();
        if (getToolbar() != null && Build.VERSION.SDK_INT >= 21) {
            getToolbar().setElevation(0.0f);
        }
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        this.delegate.onCreateOptionsMenu(menu, inflater);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        return this.delegate.onOptionsItemSelected(item);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public int getTabsCount() {
        return this.delegate.getTabsCount();
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void setTabsLayout(@LayoutRes int tabsLayout) {
        this.delegate.setTabsLayout(tabsLayout);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public void setTabsAutoLoad(boolean autoLoad) {
        this.delegate.setTabsAutoLoad(autoLoad);
    }

    @Override // me.grishka.appkit.fragments.TabbedScreen
    public PagerAdapter createAdapter() {
        return this.delegate.createAdapter();
    }
}
