package com.vkontakte.android.fragments;

import android.os.Bundle;
import android.view.View;
import com.vkontakte.android.navigation.ToolbarHelper;
import me.grishka.appkit.fragments.ToolbarFragment;
/* loaded from: classes2.dex */
public abstract class VKToolbarFragment extends ToolbarFragment {
    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ToolbarHelper.onViewCreated(getToolbar());
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    public boolean hasNavigationDrawer() {
        return ToolbarHelper.hasNavigationDrawer(this);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void onToolbarNavigationClick() {
        ToolbarHelper.onToolbarNavigationClick(this);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    protected boolean canGoBack() {
        return ToolbarHelper.canGoBack(this);
    }
}
