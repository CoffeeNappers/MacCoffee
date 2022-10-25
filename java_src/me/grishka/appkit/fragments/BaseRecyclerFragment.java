package me.grishka.appkit.fragments;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.StringRes;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.vkontakte.android.R;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
import me.grishka.appkit.api.PaginatedList;
import me.grishka.appkit.utils.Preloader;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.SwipeRefreshLayoutI;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public abstract class BaseRecyclerFragment<T> extends LoaderFragment implements SwipeRefreshLayout.OnRefreshListener, UsableRecyclerView.Listener, Preloader.Callback<T> {
    protected ViewGroup contentWrap;
    protected ArrayList<T> data;
    protected Button emptyButton;
    protected CharSequence emptyButtonText;
    protected boolean emptyButtonVisible;
    protected CharSequence emptyText;
    protected View emptyView;
    protected View footerError;
    protected View footerProgress;
    protected View footerView;
    private final Handler handler;
    protected int itemsPerPage;
    protected UsableRecyclerView list;
    private int listLayoutId;
    protected ArrayList<T> preloadedData;
    protected Preloader<T> preloader;
    protected boolean preloadingFailed;
    private boolean refreshAfterCreate;
    private boolean refreshEnabled;
    protected SwipeRefreshLayoutI refreshLayout;
    protected boolean refreshing;
    private final Runnable updateListRunnable;

    protected abstract void doLoadData(int i, int i2);

    /* renamed from: getAdapter */
    protected abstract RecyclerView.Adapter mo1066getAdapter();

    public void setListLayoutId(int listLayoutId) {
        this.listLayoutId = listLayoutId;
    }

    public BaseRecyclerFragment(int perPage) {
        this.handler = new Handler(Looper.getMainLooper());
        this.refreshing = false;
        this.refreshEnabled = true;
        this.refreshAfterCreate = false;
        this.preloadingFailed = false;
        this.listLayoutId = R.layout.appkit_recycler_fragment;
        this.updateListRunnable = new Runnable() { // from class: me.grishka.appkit.fragments.BaseRecyclerFragment.4
            @Override // java.lang.Runnable
            public void run() {
                RecyclerView list = BaseRecyclerFragment.this.list;
                if (list != null && list.mo1204getAdapter() != null) {
                    if (list.isComputingLayout()) {
                        BaseRecyclerFragment.this.handler.removeCallbacks(this);
                        BaseRecyclerFragment.this.handler.post(this);
                        return;
                    }
                    list.mo1204getAdapter().notifyDataSetChanged();
                }
            }
        };
        this.itemsPerPage = perPage;
        this.preloader = new Preloader<>(this, perPage);
        this.data = this.preloader.getData();
        this.preloadedData = this.preloader.getPreloadedData();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        if (TextUtils.isEmpty(this.emptyText)) {
            this.emptyText = activity.getString(R.string.empty_list);
        }
        super.onAttach(activity);
    }

    public BaseRecyclerFragment(int layout, int perPage) {
        super(layout);
        this.handler = new Handler(Looper.getMainLooper());
        this.refreshing = false;
        this.refreshEnabled = true;
        this.refreshAfterCreate = false;
        this.preloadingFailed = false;
        this.listLayoutId = R.layout.appkit_recycler_fragment;
        this.updateListRunnable = new Runnable() { // from class: me.grishka.appkit.fragments.BaseRecyclerFragment.4
            @Override // java.lang.Runnable
            public void run() {
                RecyclerView list = BaseRecyclerFragment.this.list;
                if (list != null && list.mo1204getAdapter() != null) {
                    if (list.isComputingLayout()) {
                        BaseRecyclerFragment.this.handler.removeCallbacks(this);
                        BaseRecyclerFragment.this.handler.post(this);
                        return;
                    }
                    list.mo1204getAdapter().notifyDataSetChanged();
                }
            }
        };
        this.itemsPerPage = perPage;
        this.preloader = new Preloader<>(this, perPage);
        this.data = this.preloader.getData();
        this.preloadedData = this.preloader.getPreloadedData();
    }

    protected View onCreateFooterView(LayoutInflater inflater) {
        return inflater.inflate(R.layout.appkit_load_more, (ViewGroup) null);
    }

    protected int getSpanCount() {
        return 1;
    }

    /* renamed from: onCreateLayoutManager */
    protected RecyclerView.LayoutManager mo1032onCreateLayoutManager() {
        return new GridLayoutManager(getActivity(), getSpanCount());
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(this.listLayoutId, (ViewGroup) null);
        this.list = (UsableRecyclerView) view.findViewById(R.id.list);
        this.list.setListener(this);
        this.emptyView = view.findViewById(R.id.empty);
        this.refreshLayout = (SwipeRefreshLayoutI) view.findViewById(R.id.refresh_layout);
        this.contentWrap = (ViewGroup) view.findViewById(R.id.content_wrap);
        ((TextView) this.emptyView.findViewById(R.id.empty_text)).setText(this.emptyText);
        this.emptyButton = (Button) this.emptyView.findViewById(R.id.empty_button);
        this.emptyButton.setText(this.emptyButtonText);
        this.emptyButton.setVisibility(this.emptyButtonVisible ? 0 : 8);
        this.emptyButton.setOnClickListener(new View.OnClickListener() { // from class: me.grishka.appkit.fragments.BaseRecyclerFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                BaseRecyclerFragment.this.onEmptyViewBtnClick();
            }
        });
        RecyclerView.LayoutManager lmgr = mo1032onCreateLayoutManager();
        if (lmgr instanceof GridLayoutManager) {
            final GridLayoutManager.SpanSizeLookup prevLookup = ((GridLayoutManager) lmgr).getSpanSizeLookup();
            ((GridLayoutManager) lmgr).setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() { // from class: me.grishka.appkit.fragments.BaseRecyclerFragment.2
                @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
                public int getSpanSize(int pos) {
                    if (BaseRecyclerFragment.this.list == null) {
                        return 1;
                    }
                    if (pos == BaseRecyclerFragment.this.list.mo1204getAdapter().getItemCount() - 1 && BaseRecyclerFragment.this.preloader.isFooterVisible() && BaseRecyclerFragment.this.footerView != null) {
                        return ((GridLayoutManager) BaseRecyclerFragment.this.list.getLayoutManager()).getSpanCount();
                    }
                    if (prevLookup == null) {
                        return 1;
                    }
                    return prevLookup.getSpanSize(pos);
                }
            });
        }
        this.list.setLayoutManager(lmgr);
        this.list.setHasFixedSize(true);
        this.refreshLayout.setOnRefreshListener(this);
        this.refreshLayout.setEnabled(this.refreshEnabled);
        this.list.setEmptyView(this.emptyView);
        RecyclerView.Adapter adapter = mo1066getAdapter();
        this.footerView = onCreateFooterView(inflater);
        this.list.setAdapter(adapter);
        if (this.footerView != null) {
            this.footerProgress = this.footerView.findViewById(R.id.load_more_progress);
            this.footerError = this.footerView.findViewById(R.id.load_more_error);
            this.footerError.setVisibility(8);
            this.list.addFooterView(this.footerView);
            this.footerError.findViewById(R.id.error_retry).setOnClickListener(new View.OnClickListener() { // from class: me.grishka.appkit.fragments.BaseRecyclerFragment.3
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    BaseRecyclerFragment.this.onErrorRetryClick();
                }
            });
            this.preloader.setFooterViews(this.footerProgress, this.footerError);
        }
        if (this.refreshAfterCreate) {
            refresh();
        }
        return view;
    }

    protected void beforeSetAdapter() {
    }

    public void onAppendItems(List<T> items) {
    }

    protected void onPrependItems(List<T> items) {
    }

    public void onClearItems() {
    }

    public void onScrolledToLastItem() {
        if (!this.refreshing && !this.preloadingFailed) {
            this.preloader.onScrolledToLastItem();
        }
    }

    public void onScrollStarted() {
    }

    protected void onEmptyViewBtnClick() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setRefreshEnabled(boolean enabled) {
        this.refreshEnabled = enabled;
        if (this.refreshLayout != null) {
            this.refreshLayout.setEnabled(enabled);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void cancelLoading() {
        if (this.currentRequest != null) {
            this.currentRequest.cancel();
            this.currentRequest = null;
        }
    }

    public void reload() {
        this.loaded = false;
        this.data.clear();
        onClearItems();
        showProgress();
        loadData();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onDataLoaded(List<T> d) {
        this.dataLoading = false;
        this.currentRequest = null;
        this.loaded = true;
        this.data.clear();
        this.data.addAll(d);
        updateList();
        if (this.list != null) {
            if (this.refreshing) {
                refreshDone();
            }
            V.setVisibilityAnimated((View) this.refreshLayout, 0);
            V.setVisibilityAnimated(this.progress, 8);
        }
    }

    public void updateList() {
        this.updateListRunnable.run();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        if (this.list != null) {
            this.list.setAdapter(null);
        }
        this.list = null;
        this.emptyView = null;
        this.emptyButton = null;
        this.progress = null;
        this.errorView = null;
        this.contentWrap = null;
        this.footerError = null;
        this.footerProgress = null;
        this.footerView = null;
        this.refreshLayout = null;
    }

    public void onRefresh() {
        this.refreshing = true;
        if (this.footerView != null) {
            this.footerError.setVisibility(8);
            this.footerProgress.setVisibility(0);
        }
        this.preloadingFailed = false;
        doLoadData();
    }

    public void onDataLoaded(PaginatedList<T> d) {
        boolean z = false;
        int curSize = this.refreshing ? 0 : this.data.size() + this.preloadedData.size();
        if (d.size() + curSize < d.total()) {
            z = true;
        }
        onDataLoaded(d, z);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onDataLoaded(List<T> d, boolean more) {
        this.loaded = true;
        this.currentRequest = null;
        if (this.refreshing) {
            this.data.clear();
            this.preloadedData.clear();
            onClearItems();
        }
        this.dataLoading = false;
        this.preloader.onDataLoaded(d, more);
        if (this.refreshing) {
            refreshDone();
        }
        V.setVisibilityAnimated((View) this.refreshLayout, 0);
        V.setVisibilityAnimated(this.progress, 8);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setEmptyText(@StringRes int text) {
        setEmptyText(getString(text));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setEmptyText(CharSequence text) {
        this.emptyText = text;
        if (this.emptyView != null) {
            ((TextView) this.emptyView.findViewById(R.id.empty_text)).setText(text);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setEmptyButtonText(@StringRes int text) {
        setEmptyButtonText(getString(text));
    }

    protected void setEmptyButtonText(CharSequence text) {
        this.emptyButtonText = text;
        if (this.emptyButton != null) {
            this.emptyButton.setText(text);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setEmptyButtonVisible(boolean visible) {
        this.emptyButtonVisible = visible;
        if (this.emptyButton != null) {
            this.emptyButton.setVisibility(visible ? 0 : 8);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void refresh() {
        if (!this.loaded) {
            loadData();
        } else if (this.refreshLayout != null) {
            this.refreshLayout.post(new Runnable() { // from class: me.grishka.appkit.fragments.BaseRecyclerFragment.5
                @Override // java.lang.Runnable
                public void run() {
                    if (BaseRecyclerFragment.this.refreshLayout != null) {
                        BaseRecyclerFragment.this.refreshLayout.setRefreshing(true);
                        BaseRecyclerFragment.this.refreshLayout.setEnabled(false);
                    }
                }
            });
            onRefresh();
            this.refreshAfterCreate = false;
        } else {
            this.refreshAfterCreate = true;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void doLoadData() {
        doLoadData(0, this.itemsPerPage * 2);
    }

    @Override // me.grishka.appkit.utils.Preloader.Callback
    public void loadData(int offset, int count) {
        this.dataLoading = true;
        doLoadData(offset, count);
    }

    @Override // me.grishka.appkit.utils.Preloader.Callback
    public boolean isDataLoading() {
        return this.dataLoading;
    }

    @Override // me.grishka.appkit.utils.Preloader.Callback
    public boolean isRefreshing() {
        return this.refreshing;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void onError(ErrorResponse error) {
        this.dataLoading = false;
        this.currentRequest = null;
        if (this.errorView != null) {
            if (this.refreshing) {
                refreshDone();
            }
            if (this.refreshing) {
                error.showToast(getActivity());
            } else if (this.data.size() > 0) {
                this.preloadingFailed = true;
                error.bindErrorView(this.footerError);
                V.setVisibilityAnimated(this.footerError, 0);
                V.setVisibilityAnimated(this.footerProgress, 8);
            } else {
                super.onError(error);
            }
        }
    }

    public void refreshDone() {
        this.refreshing = false;
        if (this.refreshLayout != null) {
            this.refreshLayout.setRefreshing(false);
            this.refreshLayout.setEnabled(this.refreshEnabled);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void onErrorRetryClick() {
        if (this.preloadingFailed) {
            this.preloadingFailed = false;
            V.setVisibilityAnimated(this.footerProgress, 0);
            V.setVisibilityAnimated(this.footerError, 8);
            onScrolledToLastItem();
            return;
        }
        super.onErrorRetryClick();
    }
}
