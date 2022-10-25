package com.vkontakte.android.ui.navigation;

import android.app.Activity;
import android.app.Fragment;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SearchView;
import com.vkontakte.android.FragmentWrapperActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.ui.FitSystemWindowsFragmentWrapperFrameLayout;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.ui.widget.MenuListView;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.ReentrantReadWriteLock;
/* loaded from: classes3.dex */
public abstract class NavigationDelegateLeftMenu<M extends ViewGroup> extends NavigationDelegate {
    private boolean isOpened;
    private final ReentrantReadWriteLock lock;
    @Nullable
    protected M menu;
    MenuListView menuList;
    private final List<MenuStateListener> menuStateListeners;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public interface MenuStateListener {
        void onMenuClosed();

        void onMenuOpened();
    }

    public abstract void closeMenu();

    abstract void initializeLeftMenu(View view);

    public abstract void openMenu();

    public abstract void setStatusBarColor(int i);

    /* JADX INFO: Access modifiers changed from: package-private */
    public NavigationDelegateLeftMenu(@NonNull Activity activity, boolean isTopLevel) {
        super(activity, isTopLevel);
        this.isOpened = false;
        this.lock = new ReentrantReadWriteLock();
        this.menuStateListeners = new ArrayList();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void updateUserInfo() {
        if (this.menuList != null) {
            this.menuList.updateUserInfo();
        }
    }

    private void addMenuStateListener(MenuStateListener listener) {
        this.lock.writeLock().lock();
        try {
            synchronized (this.menuStateListeners) {
                this.menuStateListeners.add(listener);
            }
        } finally {
            this.lock.writeLock().unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeMenuStateListener(MenuStateListener listener) {
        this.lock.writeLock().lock();
        try {
            synchronized (this.menuStateListeners) {
                this.menuStateListeners.remove(listener);
            }
        } finally {
            this.lock.writeLock().unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onMenuOpened() {
        this.isOpened = true;
        this.lock.readLock().lock();
        for (int i = 0; i < this.menuStateListeners.size(); i++) {
            try {
                this.menuStateListeners.get(i).onMenuOpened();
            } finally {
                this.lock.readLock().unlock();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onMenuClosed() {
        this.isOpened = false;
        this.lock.readLock().lock();
        for (int i = 0; i < this.menuStateListeners.size(); i++) {
            try {
                this.menuStateListeners.get(i).onMenuClosed();
            } finally {
                this.lock.readLock().unlock();
            }
        }
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegate
    public boolean onBackPressed() {
        if (isMenuOpened()) {
            closeMenu();
            return true;
        }
        return false;
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegate
    public Resources getResources(Resources originResources) {
        return null;
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegate
    public void onConfigurationChanged(Configuration cfg) {
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegate
    public void onPrepareOptionsMenu(Menu m) {
        Object tag;
        for (int i = 0; i < m.size(); i++) {
            MenuItem item = m.getItem(i);
            if (item.getActionView() != null) {
                View actionView = item.getActionView();
                if ((actionView instanceof SearchView) && (tag = item.getActionView().getTag()) != null && (tag instanceof SearchViewWrapper)) {
                    ((SearchViewWrapper) tag).onVisibilityChanged(!isMenuOpened());
                }
            }
        }
        if (isMenuOpened()) {
            m.setGroupVisible(0, false);
        }
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegate
    public boolean onOptionsItemSelected(MenuItem item) {
        return false;
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegate
    public void setContentView(View contentView) {
        if (!VKAccountManager.getCurrent().isReal() && (this.activity instanceof FragmentWrapperActivity)) {
            if (Build.VERSION.SDK_INT >= 21 && (contentView instanceof FitSystemWindowsFragmentWrapperFrameLayout)) {
                this.activity.getWindow().setStatusBarColor(-12886137);
                ((FitSystemWindowsFragmentWrapperFrameLayout) contentView).setStatusBarColor(this.activity.getResources().getColor(R.color.brand_primary));
                ((FitSystemWindowsFragmentWrapperFrameLayout) contentView).setDrawStatusBar(true);
                contentView.setFitsSystemWindows(true);
            }
            this.activity.setContentView(contentView);
            return;
        }
        this.menuList = new MenuListView(this.activity, this);
        initializeLeftMenu(contentView);
        this.activity.setContentView(this.menu);
        if (this.isTopLevel) {
            this.menuList.setCurrentItem(1);
        }
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegate
    public void onResume() {
        updateUserInfo();
    }

    private boolean isMenuOpened() {
        return this.isOpened;
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegate
    public boolean onNavigateUp() {
        if (isMenuOpened()) {
            closeMenu();
            return true;
        }
        openMenu();
        return true;
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegate
    public void openFragment(Class<? extends Fragment> fClass, @NonNull Bundle args, boolean back) {
        args.putBoolean("_from_left_menu", true);
        if (isMenuOpened()) {
            addMenuStateListener(new AnonymousClass1(fClass, args, back));
            closeMenu();
            return;
        }
        openFragmentInner(fClass, args, back);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu$1  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass1 implements MenuStateListener {
        boolean called = false;
        final /* synthetic */ Bundle val$args;
        final /* synthetic */ boolean val$back;
        final /* synthetic */ Class val$fClass;

        AnonymousClass1(Class cls, Bundle bundle, boolean z) {
            this.val$fClass = cls;
            this.val$args = bundle;
            this.val$back = z;
        }

        @Override // com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu.MenuStateListener
        public void onMenuOpened() {
        }

        @Override // com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu.MenuStateListener
        public void onMenuClosed() {
            if (!this.called) {
                NavigationDelegateLeftMenu.this.openFragmentInner(this.val$fClass, this.val$args, this.val$back);
                this.called = true;
            }
            ViewUtils.post(NavigationDelegateLeftMenu$1$$Lambda$1.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onMenuClosed$0() {
            NavigationDelegateLeftMenu.this.removeMenuStateListener(this);
        }
    }
}
