package com.vkontakte.android.fragments;

import android.app.Activity;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.ui.EmptyView;
import com.vkontakte.android.ui.FABHelper;
import com.vkontakte.android.ui.FixedScrollListView;
import com.vkontakte.android.ui.ScrollListenerComposer;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.preloading.PrefetchInfoProvider;
import me.grishka.appkit.views.UsableRecyclerView;
import uk.co.senab.actionbarpulltorefresh.library.ActionBarPullToRefresh;
import uk.co.senab.actionbarpulltorefresh.library.PullToRefreshLayout;
import uk.co.senab.actionbarpulltorefresh.library.listeners.OnRefreshListener;
/* loaded from: classes2.dex */
public abstract class BaseListFragment<T> extends LoaderFragment implements AdapterView.OnItemClickListener, AdapterView.OnItemLongClickListener, OnRefreshListener, UsableRecyclerView.Listener {
    protected PullToRefreshLayout contentWrap;
    protected EmptyView emptyView;
    protected ListView list;
    protected ArrayList<T> data = new ArrayList<>();
    protected boolean refreshing = false;
    private boolean refreshEnabled = true;
    private boolean refreshAfterCreate = false;
    private ScrollListenerComposer mOnScrollListeners = new ScrollListenerComposer();
    private FABHelper mFabHelper = FABHelper.newInstance();

    protected abstract ListAdapter getAdapter();

    protected ListView createListView() {
        return new FixedScrollListView(getActivity());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setListViewAppearance(ListView l) {
        l.setSelector(R.drawable.highlight);
        l.setDivider(new ColorDrawable(-2104603));
        l.setDividerHeight(1);
    }

    @Override // android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
    }

    @Override // com.vkontakte.android.fragments.LoaderFragment
    public View createContentView() {
        this.contentWrap = new PullToRefreshLayout(getActivity());
        this.list = createListView();
        setListViewAppearance(this.list);
        beforeSetAdapter();
        this.list.setAdapter(getAdapter());
        this.list.setId(16908298);
        this.contentWrap.addView(this.list);
        this.emptyView = EmptyView.create(getActivity());
        this.emptyView.setText(getEmptyText());
        this.emptyView.setId(16908292);
        this.emptyView.setOnBtnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.BaseListFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                BaseListFragment.this.onEmptyViewBtnClick();
            }
        });
        this.contentWrap.addView(this.emptyView);
        this.list.setEmptyView(this.emptyView);
        this.list.setOnItemClickListener(this);
        this.list.setOnItemLongClickListener(this);
        ActionBarPullToRefresh.from(getActivity()).theseChildrenArePullable(16908298, 16908292).listener(this).setup(this.contentWrap);
        this.contentWrap.setEnabled(this.refreshEnabled);
        if (this.refreshAfterCreate) {
            refresh();
        }
        return this.contentWrap;
    }

    protected void beforeSetAdapter() {
    }

    protected void onEmptyViewBtnClick() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setRefreshEnabled(boolean enabled) {
        this.refreshEnabled = enabled;
        if (this.contentWrap != null) {
            this.contentWrap.setEnabled(enabled);
        }
    }

    protected void cancelLoading() {
        if (this.currentRequest != null) {
            this.currentRequest.cancel();
            this.currentRequest = null;
        }
    }

    public void reload() {
        this.refreshing = true;
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
            ViewUtils.setVisibilityAnimated(this.contentWrap, 0);
            ViewUtils.setVisibilityAnimated(this.progress, 8);
        }
    }

    public void updateList() {
        ((BaseAdapter) getAdapter()).notifyDataSetChanged();
    }

    protected PrefetchInfoProvider getImageLoaderAdapter() {
        return null;
    }

    @Override // com.vkontakte.android.fragments.LoaderFragment
    public void onError(int code, String msg) {
        this.dataLoading = false;
        this.currentRequest = null;
        if (this.errorView != null) {
            if (this.refreshing) {
                APIUtils.showErrorToast(getActivity(), code, msg);
                refreshDone();
                return;
            }
            super.onError(code, msg);
        }
    }

    @Override // com.vkontakte.android.fragments.LoaderFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.contentWrap = null;
        this.contentView = null;
        this.list = null;
        this.emptyView = null;
        this.progress = null;
        this.errorView = null;
    }

    protected String getEmptyText() {
        return getString(R.string.empty_list);
    }

    protected void refresh() {
        if (!this.loaded) {
            loadData();
        } else if (this.contentWrap != null) {
            this.contentWrap.setRefreshing(true);
            onRefreshStarted(this.contentWrap);
            this.refreshAfterCreate = false;
        } else {
            this.refreshAfterCreate = true;
        }
    }

    public void setFloatingMenuItem(MenuItem item) {
        if (this.mFabHelper != null) {
            this.mFabHelper.attach(this.contentWrap);
            this.mFabHelper.setData(item, this);
            addOnScrollListener(this.mFabHelper.attachToScroll());
        }
    }

    @Override // android.widget.AdapterView.OnItemLongClickListener
    public boolean onItemLongClick(AdapterView<?> parent, View view, int position, long id) {
        return false;
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
    }

    @Override // com.vkontakte.android.fragments.VKFragment, android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        if (Build.VERSION.SDK_INT == 15) {
            setUserVisibleHint(true);
        }
    }

    @Override // uk.co.senab.actionbarpulltorefresh.library.listeners.OnRefreshListener
    public void onRefreshStarted(View view) {
        this.refreshing = true;
        doLoadData();
    }

    public void refreshDone() {
        if (this.contentWrap != null) {
            this.contentWrap.setRefreshComplete();
        }
        this.refreshing = false;
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Listener
    public void onScrollStarted() {
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Listener
    public void onScrolledToLastItem() {
    }

    public void addOnScrollListener(AbsListView.OnScrollListener listener) {
        this.mOnScrollListeners.addOnScrollListener(listener);
    }

    public void removeOnScrollListener(AbsListView.OnScrollListener listener) {
        this.mOnScrollListeners.removeOnScrollListener(listener);
    }
}
