package com.vkontakte.android.fragments;

import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.navigation.ToolbarHelper;
import com.vkontakte.android.ui.Font;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.fragments.BaseRecyclerFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public abstract class VKRecyclerFragment<T> extends BaseRecyclerFragment<T> {
    public VKRecyclerFragment(int perPage) {
        super(perPage);
    }

    public VKRecyclerFragment(int layoutId, int perPage) {
        super(layoutId, perPage);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = super.onCreateContentView(inflater, container, savedInstanceState);
        this.list.setPadding(0, V.dp(8.0f), 0, V.dp(8.0f));
        this.list.setSelector(R.drawable.highlight);
        this.refreshLayout.setColorSchemeResources(R.color.brand_primary);
        return v;
    }

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
