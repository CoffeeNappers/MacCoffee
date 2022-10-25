package com.vkontakte.android.navigation;

import android.app.Activity;
import android.app.Fragment;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.Toolbar;
import com.vk.core.util.Screen;
import com.vkontakte.android.ui.navigation.NavigationDelegate;
import com.vkontakte.android.ui.navigation.NavigationDelegateProvider;
/* loaded from: classes3.dex */
public class ToolbarHelper {
    private ToolbarHelper() {
    }

    public static void onViewCreated(Toolbar toolbar) {
        if (toolbar != null && Screen.isTablet(toolbar.getContext())) {
            toolbar.setNavigationIcon((Drawable) null);
        }
    }

    public static boolean hasNavigationDrawer(Fragment fragment) {
        return true;
    }

    public static boolean canGoBack(Fragment fragment) {
        return !fragment.getActivity().isTaskRoot();
    }

    public static void onToolbarNavigationClick(Fragment fragment) {
        if (!canGoBack(fragment)) {
            Activity activity = fragment.getActivity();
            if (activity instanceof NavigationDelegateProvider) {
                NavigationDelegate delegate = ((NavigationDelegateProvider) activity).getNavigationDelegate();
                delegate.onNavigateUp();
                return;
            }
            return;
        }
        fragment.getActivity().finish();
    }
}
