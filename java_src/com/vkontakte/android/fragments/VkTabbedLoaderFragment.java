package com.vkontakte.android.fragments;

import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.vkontakte.android.navigation.ToolbarHelper;
import com.vkontakte.android.ui.Font;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.fragments.TabbedLoaderFragment;
/* loaded from: classes2.dex */
public abstract class VkTabbedLoaderFragment extends TabbedLoaderFragment {
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

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.AppKitFragment
    public boolean canGoBack() {
        return ToolbarHelper.canGoBack(this);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    /* renamed from: onCreateNavigationSpinnerAdapter */
    protected ArrayAdapter mo1003onCreateNavigationSpinnerAdapter() {
        return new NavigatonSpinnerAdapter(getActivity());
    }

    /* loaded from: classes2.dex */
    protected class NavigatonSpinnerAdapter extends AppKitFragment.NavigationSpinnerAdapter {
        public NavigatonSpinnerAdapter(Context context) {
            super(context);
        }

        @Override // android.widget.ArrayAdapter, android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = super.getView(position, convertView, parent);
            if (Build.VERSION.SDK_INT < 21) {
                ((TextView) view.findViewById(16908308)).setTypeface(Font.Medium.typeface);
            }
            return view;
        }
    }
}
