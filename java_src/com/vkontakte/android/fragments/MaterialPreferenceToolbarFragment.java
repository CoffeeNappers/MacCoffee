package com.vkontakte.android.fragments;

import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.navigation.ToolbarHelper;
/* loaded from: classes2.dex */
public class MaterialPreferenceToolbarFragment extends MaterialPreferenceFragment {
    @Override // com.vkontakte.android.fragments.preference.PreferenceFragmentCompat, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateView(inflater, container, savedInstanceState);
        View wrapView = inflater.inflate(R.layout.appkit_toolbar_fragment, container, false);
        ViewGroup viewGroup = (ViewGroup) wrapView.findViewById(R.id.appkit_content);
        viewGroup.addView(view);
        Toolbar toolbar = (Toolbar) wrapView.findViewById(R.id.toolbar);
        toolbar.setTitle(getTitle());
        toolbar.setNavigationIcon(R.drawable.ic_ab_back);
        toolbar.setNavigationOnClickListener(MaterialPreferenceToolbarFragment$$Lambda$1.lambdaFactory$(this));
        toolbar.setOnMenuItemClickListener(MaterialPreferenceToolbarFragment$$Lambda$2.lambdaFactory$(this));
        ToolbarHelper.onViewCreated(toolbar);
        return wrapView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateView$0(View view1) {
        onToolbarNavigationClick();
    }

    public void onToolbarNavigationClick() {
        ToolbarHelper.onToolbarNavigationClick(this);
    }

    protected String getTitle() {
        return getString(getTitleRes());
    }

    protected int getTitleRes() {
        return R.string.app_name;
    }
}
