package com.vk.lists;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.ObservableTransformer;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
/* loaded from: classes2.dex */
public class PaginateHelper {
    public static final int DEFAULT_PAGE_SIZE = 30;
    private static final int MSG_HIDE_SWIPE_REFRESH = 0;
    private PaginatedView bindedView;
    private final DataInfoProvider dataInfoProvider;
    private boolean isInErrorState;
    private boolean loadingEnabled;
    private boolean loadingInProgress;
    private final int loadingStartOffset;
    private final NextFromHolder nextFromHolder;
    private final PagedDataProviderWithOffset pagedDataProviderWithOffset;
    private final PagedDataProviderWithStartFrom pagedDataProviderWithStartFrom;
    private final PreloadScrollListener preloadScrollListener;
    private final ObservableTransformer<Observable<?>, Observable<?>> requestObservableTransform;
    private final InfiniteOnScrollListener scrollListener;
    private final UIControl uiControl;
    private final Handler uiHandler;

    /* loaded from: classes2.dex */
    public interface DataInfoProvider {
        int getItemsCount();

        boolean isListEmpty();
    }

    /* loaded from: classes2.dex */
    public interface PagedDataProvider<T> {
        void onNewData(Observable<T> observable, PaginateHelper paginateHelper);

        Observable<T> reload(PaginateHelper paginateHelper);
    }

    /* loaded from: classes2.dex */
    public interface PagedDataProviderWithOffset<T> extends PagedDataProvider<T> {
        Observable<T> loadNext(int i, PaginateHelper paginateHelper);
    }

    /* loaded from: classes2.dex */
    public interface PagedDataProviderWithStartFrom<T> extends PagedDataProvider<T> {
        Observable<T> loadNext(String str, PaginateHelper paginateHelper);
    }

    /* loaded from: classes2.dex */
    public interface PaginatedView {
        void addOnScrollListener(RecyclerView.OnScrollListener onScrollListener);

        void removeOnScrollListener(RecyclerView.OnScrollListener onScrollListener);

        void setDataObserver(RecyclerView.AdapterDataObserver adapterDataObserver);

        void setOnLoadNextRetryClickListener(OnRetryClickListener onRetryClickListener);

        void setOnRefreshListener(SwipeRefreshLayout.OnRefreshListener onRefreshListener);

        void setOnReloadRetryClickListener(OnRetryClickListener onRetryClickListener);
    }

    /* loaded from: classes2.dex */
    public interface UIControl {
        void clearSwipeRefreshing();

        void showBigError();

        void showBigLoading();

        void showNoItems();

        void showRecycler();

        void showSmallError();

        void showSmallLoading();
    }

    private PaginateHelper(@Nullable PagedDataProviderWithOffset pagedDataProviderWithOffset, @Nullable PagedDataProviderWithStartFrom pagedDataProviderWithStartFrom, @NonNull DataInfoProvider dataInfoProvider, @NonNull UIControl uiControl, @Nullable PreloadScrollListener preloadScrollListener, int loadingStartOffset, boolean loadingEnabledByDefault, int pageSize, @NonNull String defaultNextFrom) {
        this.uiHandler = new Handler(Looper.getMainLooper()) { // from class: com.vk.lists.PaginateHelper.1
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg.what == 0) {
                    PaginateHelper.this.uiControl.clearSwipeRefreshing();
                }
            }
        };
        this.scrollListener = new InfiniteOnScrollListener();
        this.nextFromHolder = new NextFromHolder();
        this.loadingInProgress = false;
        this.loadingEnabled = true;
        this.requestObservableTransform = new ObservableTransformer<Observable<?>, Observable<?>>() { // from class: com.vk.lists.PaginateHelper.7
            @Override // io.reactivex.ObservableTransformer
            public ObservableSource<Observable<?>> apply(Observable<Observable<?>> upstream) {
                return upstream.doOnError(new Consumer<Throwable>() { // from class: com.vk.lists.PaginateHelper.7.3
                    @Override // io.reactivex.functions.Consumer
                    public void accept(Throwable throwable) throws Exception {
                        PaginateHelper.this.isInErrorState = true;
                        PaginateHelper.this.stopLoading();
                        PaginateHelper.this.checkState();
                    }
                }).doOnComplete(new Action() { // from class: com.vk.lists.PaginateHelper.7.2
                    @Override // io.reactivex.functions.Action
                    public void run() throws Exception {
                        PaginateHelper.this.isInErrorState = false;
                        PaginateHelper.this.stopLoading();
                        PaginateHelper.this.checkState();
                    }
                }).doOnDispose(new Action() { // from class: com.vk.lists.PaginateHelper.7.1
                    @Override // io.reactivex.functions.Action
                    public void run() throws Exception {
                        PaginateHelper.this.stopLoading();
                        PaginateHelper.this.checkState();
                    }
                });
            }
        };
        if (pagedDataProviderWithOffset == null && pagedDataProviderWithStartFrom == null) {
            throw new IllegalArgumentException("You should provide PagedDataProvider");
        }
        this.loadingStartOffset = loadingStartOffset;
        this.pagedDataProviderWithOffset = pagedDataProviderWithOffset;
        this.pagedDataProviderWithStartFrom = pagedDataProviderWithStartFrom;
        this.dataInfoProvider = dataInfoProvider;
        this.uiControl = uiControl;
        this.preloadScrollListener = preloadScrollListener;
        this.nextFromHolder.setPageSize(pageSize);
        this.nextFromHolder.setNextFrom(defaultNextFrom);
        setLoadingEnabled(loadingEnabledByDefault);
    }

    public void bind(PaginatedView view, boolean reloadOnBind) {
        this.bindedView = view;
        if (this.preloadScrollListener != null) {
            this.bindedView.addOnScrollListener(this.preloadScrollListener);
        }
        this.bindedView.addOnScrollListener(this.scrollListener);
        this.bindedView.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() { // from class: com.vk.lists.PaginateHelper.2
            @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
            public void onRefresh() {
                PaginateHelper.this.reload(true);
            }
        });
        this.bindedView.setOnReloadRetryClickListener(new OnRetryClickListener() { // from class: com.vk.lists.PaginateHelper.3
            @Override // com.vk.lists.OnRetryClickListener
            public void onRetryClick() {
                PaginateHelper.this.reload();
            }
        });
        this.bindedView.setOnLoadNextRetryClickListener(new OnRetryClickListener() { // from class: com.vk.lists.PaginateHelper.4
            @Override // com.vk.lists.OnRetryClickListener
            public void onRetryClick() {
                PaginateHelper.this.isInErrorState = false;
                PaginateHelper.this.loadNext();
            }
        });
        this.bindedView.setDataObserver(new RecyclerView.AdapterDataObserver() { // from class: com.vk.lists.PaginateHelper.5
            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onChanged() {
                PaginateHelper.this.checkState();
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeRemoved(int positionStart, int itemCount) {
                PaginateHelper.this.checkState();
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeInserted(int positionStart, int itemCount) {
                PaginateHelper.this.checkState();
            }
        });
        if (this.loadingEnabled) {
            if (reloadOnBind || isListEmpty()) {
                reload();
            }
        }
    }

    public void unbind() {
        if (this.bindedView != null) {
            if (this.preloadScrollListener != null) {
                this.bindedView.removeOnScrollListener(this.preloadScrollListener);
            }
            this.bindedView.removeOnScrollListener(this.scrollListener);
            this.bindedView.setOnRefreshListener(null);
            this.bindedView.setDataObserver(null);
            this.bindedView.setOnReloadRetryClickListener(null);
            this.bindedView.setOnLoadNextRetryClickListener(null);
            this.bindedView = null;
        }
    }

    public void setIntNextFrom(int nextFrom) {
        this.nextFromHolder.setIntNextFrom(nextFrom);
    }

    public int getIntNextFrom() {
        return this.nextFromHolder.getIntNextFrom();
    }

    public void incrementPage(int totalCount) {
        if (this.pagedDataProviderWithOffset == null) {
            throw new IllegalStateException("You shouldn't call incrementPage with pagedDataProviderWithStartFrom");
        }
        this.nextFromHolder.incrementNextFrom(totalCount);
    }

    public String getNextFrom() {
        return this.nextFromHolder.getNextFrom();
    }

    public void setNextFrom(String nextFrom) {
        if (this.pagedDataProviderWithStartFrom == null) {
            throw new IllegalStateException("You shouldn't call setNextFrom with pagedDataProviderWithOffset");
        }
        this.nextFromHolder.setNextFrom(nextFrom);
    }

    public int getPageSize() {
        return this.nextFromHolder.getPageSize();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isListEmpty() {
        return this.dataInfoProvider.isListEmpty();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showList() {
        this.uiControl.showRecycler();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showNoItems() {
        this.uiControl.showNoItems();
    }

    private void showSmallLoading() {
        this.uiControl.showSmallLoading();
    }

    private void showBigLoading() {
        this.uiControl.showBigLoading();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showSmallError() {
        this.uiControl.showSmallError();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showBigError() {
        this.uiControl.showBigError();
    }

    private void hideRefreshIndicator() {
        this.uiHandler.removeMessages(0);
        this.uiHandler.sendMessage(Message.obtain(this.uiHandler, 0));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkState() {
        Runnable checkStateRunnable = new Runnable() { // from class: com.vk.lists.PaginateHelper.6
            @Override // java.lang.Runnable
            public void run() {
                if (PaginateHelper.this.isInErrorState) {
                    if (PaginateHelper.this.isListEmpty()) {
                        PaginateHelper.this.showBigError();
                    } else {
                        PaginateHelper.this.showSmallError();
                    }
                } else if (!PaginateHelper.this.isLoadingInProgress()) {
                    if (PaginateHelper.this.isListEmpty()) {
                        PaginateHelper.this.showNoItems();
                    } else {
                        PaginateHelper.this.showList();
                    }
                }
            }
        };
        if (Looper.getMainLooper() == Looper.myLooper()) {
            checkStateRunnable.run();
        } else {
            this.uiHandler.post(checkStateRunnable);
        }
    }

    public void reload() {
        reload(false);
    }

    public void reload(boolean isPullToRefreshReload) {
        if (!isLoadingInProgress()) {
            startLoading(isPullToRefreshReload);
            if (this.pagedDataProviderWithStartFrom != null) {
                setNextFrom(AppEventsConstants.EVENT_PARAM_VALUE_NO);
                this.pagedDataProviderWithStartFrom.onNewData(this.pagedDataProviderWithStartFrom.reload(this).compose(this.requestObservableTransform), this);
                return;
            }
            setIntNextFrom(0);
            this.pagedDataProviderWithOffset.onNewData(this.pagedDataProviderWithOffset.reload(this).compose(this.requestObservableTransform), this);
        }
    }

    public void setLoadingEnabled(boolean enabled) {
        this.loadingEnabled = enabled;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isLoadingInProgress() {
        return this.loadingInProgress;
    }

    private void startLoading(boolean isPullToRefreshReload) {
        this.loadingInProgress = true;
        if (isListEmpty()) {
            if (!isPullToRefreshReload) {
                showBigLoading();
                return;
            }
            return;
        }
        showSmallLoading();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void stopLoading() {
        this.loadingInProgress = false;
        hideRefreshIndicator();
    }

    public void loadNext() {
        String nf = getNextFrom();
        if (!isLoadingInProgress() && !TextUtils.isEmpty(nf)) {
            startLoading(false);
            if (this.pagedDataProviderWithStartFrom != null) {
                this.pagedDataProviderWithStartFrom.onNewData(this.pagedDataProviderWithStartFrom.loadNext(nf, this).compose(this.requestObservableTransform), this);
            } else {
                this.pagedDataProviderWithOffset.onNewData(this.pagedDataProviderWithOffset.loadNext(getIntNextFrom(), this).compose(this.requestObservableTransform), this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class InfiniteOnScrollListener extends RecyclerView.OnScrollListener {
        private InfiniteOnScrollListener() {
        }

        @Override // android.support.v7.widget.RecyclerView.OnScrollListener
        public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
            int totalItemCount = recyclerView.mo1204getAdapter().getItemCount();
            boolean loadMore = totalItemCount - PaginationUtil.getLastVisiblePosition(recyclerView) < PaginateHelper.this.loadingStartOffset;
            if (loadMore && PaginateHelper.this.loadingEnabled && !PaginateHelper.this.isInErrorState) {
                PaginateHelper.this.loadNext();
            }
        }
    }

    public static Builder createWithOffset(PagedDataProviderWithOffset pagedDataProviderWithOffset) {
        return new Builder(pagedDataProviderWithOffset);
    }

    public static Builder createWithStartFrom(PagedDataProviderWithStartFrom pagedDataProviderWithStartFrom) {
        return new Builder(pagedDataProviderWithStartFrom);
    }

    /* loaded from: classes2.dex */
    public static class Builder {
        private DataInfoProvider dataInfoProvider;
        private String defaultNextFrom;
        private boolean loadingEnabledByDefault;
        private int loadingStartOffset;
        private int pageSize;
        private final PagedDataProviderWithOffset pagedDataProviderWithOffset;
        private final PagedDataProviderWithStartFrom pagedDataProviderWithStartFrom;
        private PreloadCallback preloadCallback;
        private int preloadCount;
        private boolean reloadOnBind;
        private UIControl uiControl;

        public Builder(PagedDataProviderWithOffset pagedDataProviderWithOffset) {
            this.loadingStartOffset = 10;
            this.loadingEnabledByDefault = true;
            this.pageSize = 30;
            this.defaultNextFrom = AppEventsConstants.EVENT_PARAM_VALUE_NO;
            this.reloadOnBind = true;
            this.preloadCount = 3;
            this.pagedDataProviderWithOffset = pagedDataProviderWithOffset;
            this.pagedDataProviderWithStartFrom = null;
        }

        public Builder(PagedDataProviderWithStartFrom pagedDataProviderWithStartFrom) {
            this.loadingStartOffset = 10;
            this.loadingEnabledByDefault = true;
            this.pageSize = 30;
            this.defaultNextFrom = AppEventsConstants.EVENT_PARAM_VALUE_NO;
            this.reloadOnBind = true;
            this.preloadCount = 3;
            this.pagedDataProviderWithOffset = null;
            this.pagedDataProviderWithStartFrom = pagedDataProviderWithStartFrom;
        }

        public Builder setLoadingStartOffset(int offset) {
            this.loadingStartOffset = offset;
            return this;
        }

        public Builder setLoadingEnabledByDefault(boolean enabledByDefault) {
            this.loadingEnabledByDefault = enabledByDefault;
            return this;
        }

        public Builder setPageSize(int pageSize) {
            this.pageSize = pageSize;
            return this;
        }

        public Builder setDefaultNextFrom(String nextFrom) {
            this.defaultNextFrom = nextFrom;
            return this;
        }

        public Builder setDefaultOffset(int offset) {
            this.defaultNextFrom = String.valueOf(offset);
            return this;
        }

        public Builder setReloadOnBind(boolean reloadOnBind) {
            this.reloadOnBind = reloadOnBind;
            return this;
        }

        public Builder setUIControl(UIControl uiControl) {
            this.uiControl = uiControl;
            return this;
        }

        public Builder setDataInfoProvider(DataInfoProvider dataInfoProvider) {
            this.dataInfoProvider = dataInfoProvider;
            return this;
        }

        public Builder setPreloadCallback(PreloadCallback preloadCallback) {
            this.preloadCallback = preloadCallback;
            return this;
        }

        public Builder setPreloadCount(int preloadCount) {
            this.preloadCount = preloadCount;
            return this;
        }

        public PaginateHelper buildAndBind(PaginatedView paginatedView) {
            PaginateHelper helper = new PaginateHelper(this.pagedDataProviderWithOffset, this.pagedDataProviderWithStartFrom, this.dataInfoProvider, this.uiControl, this.preloadCallback != null ? new PreloadScrollListener(this.preloadCount, this.preloadCallback, this.dataInfoProvider) : null, this.loadingStartOffset, this.loadingEnabledByDefault, this.pageSize, this.defaultNextFrom);
            helper.bind(paginatedView, this.reloadOnBind);
            return helper;
        }

        public PaginateHelper buildAndBind(AbstractPaginatedView abstractPaginatedView) {
            setUIControl(abstractPaginatedView.getUIControl());
            setDataInfoProvider(abstractPaginatedView.getDataInfoProvider());
            return buildAndBind(abstractPaginatedView.getPaginatedView());
        }
    }
}
