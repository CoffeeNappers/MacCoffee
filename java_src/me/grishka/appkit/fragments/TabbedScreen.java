package me.grishka.appkit.fragments;

import android.app.Fragment;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.LayoutRes;
import android.support.design.widget.TabLayout;
import android.support.v13.app.FragmentPagerAdapter;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.views.DisableableViewPager;
/* loaded from: classes3.dex */
public interface TabbedScreen {
    void addOnPageChangeListener(ViewPager.OnPageChangeListener onPageChangeListener);

    void addTab(int i, Fragment fragment, CharSequence charSequence);

    PagerAdapter createAdapter();

    int getPagerCurrentItem();

    Fragment getTabAt(int i);

    View getTabView();

    int getTabsCount();

    void invalidateTabTitles();

    boolean isSwipeEnabled();

    void removeOnPageChangeListener(ViewPager.OnPageChangeListener onPageChangeListener);

    void removeTab(int i);

    void removeTab(Fragment fragment);

    void setPagerCurrentItem(int i);

    void setPagerCurrentItem(int i, boolean z);

    void setSwipeEnabled(boolean z);

    void setTabTitle(int i, CharSequence charSequence);

    void setTabs(List<? extends Fragment> list, List<? extends CharSequence> list2);

    void setTabsAutoLoad(boolean z);

    void setTabsLayout(@LayoutRes int i);

    void setTabsVisible(boolean z);

    /* loaded from: classes3.dex */
    public static class Delegate implements TabbedScreen {
        private final ContainerFragment host;
        private DisableableViewPager pager;
        private TabLayout tabbar;
        private View view;
        private List<Fragment> fragments = new ArrayList();
        private List<CharSequence> titles = new ArrayList();
        private List<Boolean> loaded = new ArrayList();
        private boolean mAutoLoad = true;
        private int tabsLayout = R.layout.appkit_tabs;
        private TabLayout.OnTabSelectedListener tabSelectedListener = new TabLayout.OnTabSelectedListener() { // from class: me.grishka.appkit.fragments.TabbedScreen.Delegate.1
            @Override // android.support.design.widget.TabLayout.OnTabSelectedListener
            public void onTabSelected(TabLayout.Tab tab) {
                int pos = tab.getPosition();
                Delegate.this.pager.setCurrentItem(pos);
                Fragment f = (Fragment) Delegate.this.fragments.get(pos);
                if (Delegate.this.mAutoLoad && (f instanceof LoaderFragment) && !((Boolean) Delegate.this.loaded.get(pos)).booleanValue() && !((LoaderFragment) f).loaded) {
                    ((LoaderFragment) f).loadData();
                    Delegate.this.loaded.set(pos, true);
                }
                Delegate.this.onPageSelected(pos);
                Delegate.this.invalidateOptionsMenu();
            }

            @Override // android.support.design.widget.TabLayout.OnTabSelectedListener
            public void onTabUnselected(TabLayout.Tab tab) {
            }

            @Override // android.support.design.widget.TabLayout.OnTabSelectedListener
            public void onTabReselected(TabLayout.Tab tab) {
            }
        };
        private boolean tabsVisible = true;

        public Delegate(ContainerFragment mHost) {
            this.host = mHost;
        }

        public View createView() {
            Toolbar toolbar;
            this.view = this.host.getActivity().getLayoutInflater().inflate(this.tabsLayout, (ViewGroup) null);
            this.pager = (DisableableViewPager) this.view.findViewById(R.id.viewpager);
            this.tabbar = (TabLayout) this.view.findViewById(R.id.tabs);
            this.tabbar.setTabMode(0);
            this.pager.setAdapter(createAdapter());
            this.tabbar.setupWithViewPager(this.pager);
            this.tabbar.setOnTabSelectedListener(this.tabSelectedListener);
            this.tabbar.setVisibility(this.tabsVisible ? 0 : 8);
            if (Build.VERSION.SDK_INT >= 21 && (toolbar = this.host.getToolbar()) != null) {
                toolbar.setElevation(0.0f);
            }
            return this.view;
        }

        public void destroyView() {
            this.pager = null;
            this.view = null;
            this.tabbar = null;
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void setTabs(List<? extends Fragment> fragments, List<? extends CharSequence> titles) {
            if (titles.size() != fragments.size()) {
                throw new IllegalArgumentException("Fragments and titles arrays must be the same size");
            }
            this.fragments.clear();
            this.fragments.addAll(fragments);
            this.titles.clear();
            this.titles.addAll(titles);
            this.loaded.clear();
            for (Fragment f : fragments) {
                if (f instanceof LoaderFragment) {
                    this.loaded.add(Boolean.valueOf(((LoaderFragment) f).loaded));
                } else {
                    this.loaded.add(true);
                }
                if (!isActive(f)) {
                    Bundle args = f.getArguments();
                    if (args == null) {
                        args = new Bundle();
                    }
                    args.putBoolean(AppKitFragment.EXTRA_IS_TAB, true);
                    f.setArguments(args);
                }
            }
            invalidate();
        }

        private static boolean isActive(Fragment f) {
            return (f.isAdded() || (f.getView() != null && f.getView().isShown())) && !f.isDetached() && !f.isRemoving();
        }

        private void invalidate() {
            boolean z = true;
            if (this.pager != null) {
                this.pager.mo1110getAdapter().notifyDataSetChanged();
                this.tabbar.setupWithViewPager(this.pager);
                this.tabbar.setOnTabSelectedListener(this.tabSelectedListener);
                if (this.fragments.size() <= 1) {
                    z = false;
                }
                setTabsVisible(z);
            }
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public boolean isSwipeEnabled() {
            return this.pager.isSwipeEnabled();
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void setSwipeEnabled(boolean enabled) {
            this.pager.setSwipeEnabled(enabled);
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public Fragment getTabAt(int position) {
            return this.fragments.get(position);
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void setTabTitle(int position, CharSequence title) {
            this.titles.set(position, title);
            this.tabbar.getTabAt(position).setText(title);
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void invalidateTabTitles() {
            this.tabbar.setupWithViewPager(this.pager);
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void addTab(int position, Fragment f, CharSequence title) {
            this.fragments.add(position, f);
            this.titles.add(position, title);
            if (f instanceof LoaderFragment) {
                this.loaded.add(Boolean.valueOf(((LoaderFragment) f).loaded));
            } else {
                this.loaded.add(true);
            }
            Bundle args = f.getArguments();
            if (args == null) {
                args = new Bundle();
            }
            args.putBoolean(AppKitFragment.EXTRA_IS_TAB, true);
            f.setArguments(args);
            invalidate();
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void removeTab(int position) {
            this.fragments.remove(position);
            this.titles.remove(position);
            this.loaded.remove(position);
            invalidate();
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void removeTab(Fragment tab) {
            removeTab(this.fragments.indexOf(tab));
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void addOnPageChangeListener(ViewPager.OnPageChangeListener listener) {
            this.pager.addOnPageChangeListener(listener);
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void removeOnPageChangeListener(ViewPager.OnPageChangeListener listener) {
            this.pager.removeOnPageChangeListener(listener);
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public int getPagerCurrentItem() {
            return this.pager.getCurrentItem();
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void setPagerCurrentItem(int position) {
            this.pager.setCurrentItem(position);
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void setPagerCurrentItem(int position, boolean scroll) {
            this.pager.setCurrentItem(position, scroll);
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void setTabsVisible(boolean visible) {
            int i = 0;
            boolean visible2 = visible && this.fragments.size() > 1;
            if (this.tabsVisible != visible2) {
                this.tabsVisible = visible2;
                if (this.tabbar != null) {
                    TabLayout tabLayout = this.tabbar;
                    if (!this.tabsVisible) {
                        i = 8;
                    }
                    tabLayout.setVisibility(i);
                }
            }
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public View getTabView() {
            return this.tabbar;
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void setTabsLayout(@LayoutRes int tabsLayout) {
            this.tabsLayout = tabsLayout;
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public void setTabsAutoLoad(boolean autoLoad) {
            this.mAutoLoad = autoLoad;
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public int getTabsCount() {
            return this.fragments.size();
        }

        @Override // me.grishka.appkit.fragments.TabbedScreen
        public PagerAdapter createAdapter() {
            return new TabAdapter();
        }

        public void onPageSelected(int pos) {
        }

        public void invalidateOptionsMenu() {
        }

        public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
            if (this.fragments != null && !this.fragments.isEmpty()) {
                Fragment activeFragment = this.fragments.get(getPagerCurrentItem());
                activeFragment.onCreateOptionsMenu(menu, inflater);
            }
        }

        public boolean onOptionsItemSelected(MenuItem item) {
            Fragment activeFragment = this.fragments.get(getPagerCurrentItem());
            return activeFragment.onOptionsItemSelected(item);
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes3.dex */
        public class TabAdapter extends FragmentPagerAdapter {
            public TabAdapter() {
                super(Delegate.this.host.getInnerFragmentManager());
            }

            @Override // android.support.v13.app.FragmentPagerAdapter
            public Fragment getItem(int i) {
                return (Fragment) Delegate.this.fragments.get(i);
            }

            @Override // android.support.v4.view.PagerAdapter
            public int getCount() {
                return Delegate.this.fragments.size();
            }

            @Override // android.support.v4.view.PagerAdapter
            public CharSequence getPageTitle(int position) {
                return (CharSequence) Delegate.this.titles.get(position);
            }
        }
    }
}
