package me.grishka.appkit.fragments;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.annotation.LayoutRes;
import android.support.v4.widget.SwipeRefreshLayout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import me.grishka.appkit.api.APIRequest;
import me.grishka.appkit.api.ErrorResponse;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public abstract class LoaderFragment extends ContainerFragment implements SwipeRefreshLayout.OnRefreshListener {
    private boolean autoRetry;
    protected View content;
    protected ViewGroup contentView;
    protected APIRequest currentRequest;
    protected boolean dataLoading;
    private boolean errorReceiverRegistered;
    protected View errorView;
    private int layoutID;
    public boolean loaded;
    protected View progress;
    private BroadcastReceiver receiver;

    protected abstract void doLoadData();

    public abstract View onCreateContentView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle);

    public LoaderFragment() {
        this(R.layout.appkit_loader_fragment);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public LoaderFragment(@LayoutRes int layout) {
        this.receiver = new BroadcastReceiver() { // from class: me.grishka.appkit.fragments.LoaderFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                boolean isConnected = false;
                if (!isInitialStickyBroadcast() && "android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
                    if (!intent.getBooleanExtra("noConnectivity", false)) {
                        isConnected = true;
                    }
                    if (isConnected) {
                        LoaderFragment.this.onErrorRetryClick();
                    }
                }
            }
        };
        this.errorReceiverRegistered = false;
        this.autoRetry = true;
        this.layoutID = layout;
    }

    @LayoutRes
    protected int getLayout() {
        return this.layoutID;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setLayout(int id) {
        if (this.content != null) {
            throw new IllegalStateException("Can't set layout when view is already created");
        }
        this.layoutID = id;
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        int i = 8;
        this.contentView = (ViewGroup) inflater.inflate(this.layoutID, (ViewGroup) null);
        View stub = this.contentView.findViewById(R.id.content_stub);
        ViewGroup stubParent = (ViewGroup) stub.getParent();
        this.content = onCreateContentView(inflater, stubParent, savedInstanceState);
        this.content.setLayoutParams(stub.getLayoutParams());
        stubParent.addView(this.content, stubParent.indexOfChild(stub));
        stubParent.removeView(stub);
        this.progress = this.contentView.findViewById(R.id.loading);
        this.errorView = this.contentView.findViewById(R.id.error);
        this.content.setVisibility(this.loaded ? 0 : 8);
        View view = this.progress;
        if (!this.loaded) {
            i = 0;
        }
        view.setVisibility(i);
        View retryBtn = this.errorView.findViewById(R.id.error_retry);
        if (retryBtn != null) {
            retryBtn.setOnClickListener(new View.OnClickListener() { // from class: me.grishka.appkit.fragments.LoaderFragment.2
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    LoaderFragment.this.onErrorRetryClick();
                }
            });
        }
        return this.contentView;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.content = null;
        this.errorView = null;
        this.progress = null;
        this.contentView = null;
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        if (this.currentRequest != null) {
            this.currentRequest.cancel();
            this.currentRequest = null;
        }
        if (this.errorReceiverRegistered) {
            try {
                getActivity().unregisterReceiver(this.receiver);
            } catch (Exception e) {
            }
            this.errorReceiverRegistered = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onErrorRetryClick() {
        V.setVisibilityAnimated(this.errorView, 8);
        V.setVisibilityAnimated(this.progress, 0);
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

    /* JADX INFO: Access modifiers changed from: protected */
    public void showContent() {
        if (this.content != null) {
            V.setVisibilityAnimated(this.content, 0);
            V.setVisibilityAnimated(this.errorView, 8);
            V.setVisibilityAnimated(this.progress, 8);
        }
        if (this.errorReceiverRegistered) {
            try {
                getActivity().unregisterReceiver(this.receiver);
            } catch (Exception e) {
            }
            this.errorReceiverRegistered = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void showProgress() {
        if (this.content != null) {
            V.setVisibilityAnimated(this.content, 8);
            V.setVisibilityAnimated(this.errorView, 8);
            V.setVisibilityAnimated(this.progress, 0);
        }
        if (this.errorReceiverRegistered) {
            try {
                getActivity().unregisterReceiver(this.receiver);
            } catch (Exception e) {
            }
            this.errorReceiverRegistered = false;
        }
    }

    public void onError(ErrorResponse error) {
        this.dataLoading = false;
        this.currentRequest = null;
        if (this.errorView != null) {
            error.bindErrorView(this.errorView);
            V.setVisibilityAnimated(this.errorView, 0);
            V.setVisibilityAnimated(this.progress, 8);
            V.setVisibilityAnimated(this.content, 8);
            if (!this.errorReceiverRegistered && this.autoRetry) {
                getActivity().registerReceiver(this.receiver, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
                this.errorReceiverRegistered = true;
            }
        }
    }

    public void setRetryOnNetworkConnect(boolean retry) {
        this.autoRetry = retry;
    }

    public boolean isRetryInNetworkConnect() {
        return this.autoRetry;
    }
}
