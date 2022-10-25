package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vkontakte.android.R;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.execute.ExecuteGetAccountSettings;
import com.vkontakte.android.navigation.ToolbarHelper;
/* loaded from: classes2.dex */
public class SettingsAccountFragment extends me.grishka.appkit.fragments.LoaderFragment {
    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        loadData();
        setTitle(R.string.sett_account);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View content = new FrameLayout(getActivity());
        content.setId(R.id.id);
        return content;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateView(inflater, container, savedInstanceState);
        Toolbar toolbar = (Toolbar) view.findViewById(R.id.toolbar);
        toolbar.setNavigationIcon(R.drawable.ic_ab_back);
        ToolbarHelper.onViewCreated(toolbar);
        return view;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void onToolbarNavigationClick() {
        if (getFragmentManager().getBackStackEntryCount() > 0) {
            getFragmentManager().popBackStack();
        } else if (getActivity() != null) {
            getActivity().onBackPressed();
        }
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
        loadData();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void doLoadData() {
        new ExecuteGetAccountSettings().setCallback(new SimpleCallback<ExecuteGetAccountSettings.Result>(this) { // from class: com.vkontakte.android.fragments.SettingsAccountFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(ExecuteGetAccountSettings.Result result) {
                SettingsAccountInnerFragment inner = new SettingsAccountInnerFragment();
                Bundle args = SettingsAccountFragment.this.getArguments() == null ? new Bundle() : SettingsAccountFragment.this.getArguments();
                args.putSerializable("api_result", result);
                inner.setArguments(args);
                SettingsAccountFragment.this.getInnerFragmentManager().beginTransaction().add(R.id.id, inner).commit();
                SettingsAccountFragment.this.showContent();
            }
        }).exec((Context) getActivity());
    }
}
