package com.vkontakte.android.ui.navigation;

import android.app.Activity;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.v4.view.ViewCompat;
import android.support.v4.widget.SlidingPaneLayout;
import android.view.View;
import android.view.ViewTreeObserver;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.EdgeSlidingPaneLayout;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
class NavigationDelegateSlider extends NavigationDelegateLeftMenu<EdgeSlidingPaneLayout> implements SlidingPaneLayout.PanelSlideListener {
    /* JADX INFO: Access modifiers changed from: package-private */
    public NavigationDelegateSlider(@NonNull Activity activity, boolean isTopLevel) {
        super(activity, isTopLevel);
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu
    void initializeLeftMenu(View contentView) {
        this.menu = (EdgeSlidingPaneLayout) View.inflate(this.activity, R.layout.drawer_wrapper_tablet, null);
        ((EdgeSlidingPaneLayout) this.menu).addView(contentView);
        ((EdgeSlidingPaneLayout) this.menu).setFitsSystemWindows(true);
        ((EdgeSlidingPaneLayout) this.menu).addView(this.menuList, 0, new SlidingPaneLayout.LayoutParams(V.dp(288.0f), -1));
        SlidingPaneLayout.LayoutParams lp = new SlidingPaneLayout.LayoutParams(-1, -1);
        lp.leftMargin = V.dp(84.0f);
        contentView.setLayoutParams(lp);
        ((EdgeSlidingPaneLayout) this.menu).setPanelSlideListener(this);
        ((EdgeSlidingPaneLayout) this.menu).setSliderFadeColor(ViewCompat.MEASURED_STATE_MASK);
        if (Build.VERSION.SDK_INT >= 21) {
            this.activity.getWindow().setStatusBarColor(1140850688);
            this.menuList.setFitsSystemWindows(true);
            ((EdgeSlidingPaneLayout) this.menu).setClipToPadding(false);
            ((EdgeSlidingPaneLayout) this.menu).setSystemUiVisibility(1280);
        }
        this.menuList.setExpansion(0.0f);
        this.menuList.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.navigation.NavigationDelegateSlider.1
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                NavigationDelegateSlider.this.menuList.getViewTreeObserver().removeOnPreDrawListener(this);
                NavigationDelegateSlider.this.menuList.setExpansion(0.0f);
                return true;
            }
        });
        this.menuList.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.vkontakte.android.ui.navigation.NavigationDelegateSlider.2
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                NavigationDelegateSlider.this.menuList.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                NavigationDelegateSlider.this.menuList.setExpansion(0.0f);
            }
        });
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu
    public void openMenu() {
        if (this.menu != 0) {
            ((EdgeSlidingPaneLayout) this.menu).openPane();
        }
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu
    public void closeMenu() {
        if (this.menu != 0) {
            ((EdgeSlidingPaneLayout) this.menu).closePane();
        }
    }

    @Override // com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu
    public void setStatusBarColor(int color) {
        if (this.menu != 0) {
            ((EdgeSlidingPaneLayout) this.menu).setStatusBarColor(color);
        }
    }

    @Override // android.support.v4.widget.SlidingPaneLayout.PanelSlideListener
    public void onPanelSlide(View panel, float slideOffset) {
        this.menuList.setExpansion(slideOffset);
    }

    @Override // android.support.v4.widget.SlidingPaneLayout.PanelSlideListener
    public void onPanelOpened(View panel) {
        onMenuOpened();
    }

    @Override // android.support.v4.widget.SlidingPaneLayout.PanelSlideListener
    public void onPanelClosed(View panel) {
        onMenuClosed();
    }
}
