package com.vkontakte.android.fragments;

import android.app.DialogFragment;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import com.vk.core.util.Screen;
import com.vkontakte.android.ui.FABHelper;
import com.vkontakte.android.ui.StubListAdapter;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
/* loaded from: classes2.dex */
public class VKFragment extends DialogFragment implements FABHelper.OnOptionItemSelectedListener {
    private final CompositeDisposable compositeDisposable = new CompositeDisposable();
    protected boolean isTablet = false;
    private CharSequence subtitle;
    private CharSequence title;
    private boolean viewCreated;

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        if (Build.VERSION.SDK_INT == 15) {
            setUserVisibleHint(true);
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        this.isTablet = Screen.isTablet(context);
    }

    @Override // android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        this.isTablet = Screen.isTablet(getActivity());
    }

    @Override // android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.viewCreated = true;
        if (this.title != null && (getArguments() == null || !getArguments().getBoolean("_dialog"))) {
            getActivity().setTitle(this.title);
        }
        if (getActivity().getActionBar() != null) {
            if (getArguments() == null || !getArguments().getBoolean("_dialog")) {
                if (this.title != null) {
                    if (getActivity().getActionBar().getNavigationMode() != 0) {
                        getActivity().getActionBar().setListNavigationCallbacks(StubListAdapter.getInstance(), null);
                        getActivity().getActionBar().setDisplayShowTitleEnabled(true);
                    }
                    getActivity().getActionBar().setNavigationMode(0);
                }
                if (this.subtitle != null) {
                    getActivity().getActionBar().setSubtitle(this.subtitle);
                }
            }
        }
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        this.compositeDisposable.dispose();
        super.onDestroy();
    }

    protected void setTitle(CharSequence title) {
        this.title = title;
        if (this.viewCreated) {
            if (getArguments() == null || !getArguments().getBoolean("_dialog")) {
                getActivity().setTitle(title);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTitle(int res) {
        setTitle(getString(res));
    }

    protected void setSubtitle(CharSequence subtitle) {
        this.subtitle = subtitle;
        if (this.viewCreated && getActivity().getActionBar() != null) {
            getActivity().getActionBar().setSubtitle(subtitle);
        }
    }

    protected void setSubtitle(int res) {
        setSubtitle(getString(res));
    }

    public Disposable registerDisposable(Disposable disposable) {
        this.compositeDisposable.add(disposable);
        return disposable;
    }
}
