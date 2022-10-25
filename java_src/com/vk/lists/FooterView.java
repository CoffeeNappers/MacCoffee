package com.vk.lists;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
/* loaded from: classes2.dex */
public class FooterView extends FrameLayout {
    private AbstractErrorView errorView;
    private View loadingView;

    public FooterView(Context context) {
        super(context);
    }

    public FooterView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public FooterView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public void setLoadingView(View loadingView) {
        if (this.loadingView != null) {
            removeView(this.loadingView);
        }
        this.loadingView = loadingView;
        addView(this.loadingView);
    }

    public void setErrorView(AbstractErrorView errorView) {
        if (this.errorView != null) {
            removeView(this.errorView);
        }
        this.errorView = errorView;
        addView(this.errorView);
    }

    public void setErrorRetryClickListener(OnRetryClickListener clickListener) {
        this.errorView.setRetryClickListener(clickListener);
    }

    public void showLoading() {
        this.loadingView.setVisibility(0);
        this.errorView.setVisibility(4);
    }

    public void showError() {
        this.errorView.setVisibility(0);
        this.loadingView.setVisibility(4);
    }
}
