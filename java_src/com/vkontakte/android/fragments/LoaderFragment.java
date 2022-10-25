package com.vkontakte.android.fragments;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.ui.ErrorView;
/* loaded from: classes2.dex */
public abstract class LoaderFragment extends ContainerFragment {
    protected View content;
    protected ViewGroup contentView;
    protected VKAPIRequest currentRequest;
    protected ErrorView errorView;
    protected ProgressBar progress;
    protected boolean dataLoading = false;
    protected boolean loaded = false;

    public abstract View createContentView();

    public abstract void doLoadData();

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.contentView = createContentViewContainer();
        this.contentView.setBackgroundColor(-1);
        this.content = createContentView();
        ViewGroup contentViewContainer = getContentViewContainer(this.contentView);
        contentViewContainer.addView(this.content);
        this.progress = new ProgressBar(getActivity());
        contentViewContainer.addView(this.progress, new FrameLayout.LayoutParams(Global.scale(40.0f), Global.scale(40.0f), 17));
        this.errorView = (ErrorView) View.inflate(getActivity(), R.layout.error, null);
        contentViewContainer.addView(this.errorView);
        if (!this.loaded) {
            this.content.setVisibility(8);
            this.progress.setVisibility(0);
        } else {
            this.content.setVisibility(0);
            this.progress.setVisibility(8);
        }
        this.errorView.setVisibility(8);
        this.errorView.setOnRetryListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.LoaderFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                LoaderFragment.this.onErrorRetryClick();
            }
        });
        return this.contentView;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.content = null;
    }

    public void onErrorRetryClick() {
        ViewUtils.setVisibilityAnimated(this.errorView, 8);
        ViewUtils.setVisibilityAnimated(this.progress, 0);
        loadData();
    }

    public void loadData() {
        showProgress();
        this.dataLoading = true;
        doLoadData();
    }

    public void dataLoaded() {
        this.loaded = true;
        showContent();
    }

    public void showContent() {
        if (this.content != null) {
            ViewUtils.setVisibilityAnimated(this.content, 0);
            ViewUtils.setVisibilityAnimated(this.errorView, 8);
            ViewUtils.setVisibilityAnimated(this.progress, 8);
        }
    }

    public void showProgress() {
        if (this.content != null) {
            ViewUtils.setVisibilityAnimated(this.content, 8);
            ViewUtils.setVisibilityAnimated(this.errorView, 8);
            ViewUtils.setVisibilityAnimated(this.progress, 0);
        }
    }

    public void onError(VKAPIRequest.VKErrorResponse error) {
        onError(error.getCode(), error.message);
    }

    public void onError(int code, String msg) {
        this.dataLoading = false;
        this.currentRequest = null;
        if (this.errorView != null) {
            this.errorView.setErrorInfo(code, msg);
            ViewUtils.setVisibilityAnimated(this.errorView, 0);
            ViewUtils.setVisibilityAnimated(this.progress, 8);
            ViewUtils.setVisibilityAnimated(this.content, 8);
        }
    }

    public boolean isLoaded() {
        return this.loaded;
    }

    protected ViewGroup createContentViewContainer() {
        return new FrameLayout(getActivity());
    }

    protected FrameLayout getContentViewContainer(ViewGroup contentView) {
        return (FrameLayout) contentView;
    }
}
