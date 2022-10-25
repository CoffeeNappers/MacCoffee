package com.vk.lists;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vk.lists.PaginateHelper;
/* loaded from: classes2.dex */
public abstract class AbstractPaginatedView extends FrameLayout {
    protected RecyclerView.AdapterDataObserver dataObserver;
    protected View emptyView;
    protected AbstractErrorView errorView;
    protected FooterViewProvider footerViewProvider;
    protected final OnRetryClickListener internalLoadNextRetryListener;
    protected final OnRetryClickListener internalReloadRetryListener;
    protected FullScreenLayout listContainer;
    private OnRetryClickListener loadNextRetryClickListener;
    protected View loadingView;
    private OnRetryClickListener reloadRetryClickListener;
    private final PaginateHelper.UIControl uiControl;

    /* loaded from: classes2.dex */
    public enum LayoutType {
        LINEAR,
        GRID,
        STAGGERED_GRID
    }

    protected abstract void clearSwipeRefreshing();

    protected abstract void doShowFooterError();

    protected abstract void doShowFooterLoading();

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract PaginateHelper.DataInfoProvider getDataInfoProvider();

    public abstract PaginateHelper.PaginatedView getPaginatedView();

    protected abstract void hideFooter();

    protected abstract View onCreateListView();

    protected abstract void setLayoutManagerFromBuilder(LayoutBuilder layoutBuilder);

    protected abstract void setSwipeRefreshEnabled(boolean z);

    public AbstractPaginatedView(Context context) {
        this(context, null, 0);
    }

    public AbstractPaginatedView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public AbstractPaginatedView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.footerViewProvider = FooterViewProvider.DEFAULT;
        this.uiControl = new PaginateHelper.UIControl() { // from class: com.vk.lists.AbstractPaginatedView.1
            @Override // com.vk.lists.PaginateHelper.UIControl
            public void showBigLoading() {
                AbstractPaginatedView.this.showBigLoading();
            }

            @Override // com.vk.lists.PaginateHelper.UIControl
            public void showSmallLoading() {
                AbstractPaginatedView.this.showFooterLoading();
            }

            @Override // com.vk.lists.PaginateHelper.UIControl
            public void showBigError() {
                AbstractPaginatedView.this.showError();
            }

            @Override // com.vk.lists.PaginateHelper.UIControl
            public void showSmallError() {
                AbstractPaginatedView.this.showFooterError();
            }

            @Override // com.vk.lists.PaginateHelper.UIControl
            public void showRecycler() {
                AbstractPaginatedView.this.showList();
            }

            @Override // com.vk.lists.PaginateHelper.UIControl
            public void showNoItems() {
                AbstractPaginatedView.this.showEmpty();
            }

            @Override // com.vk.lists.PaginateHelper.UIControl
            public void clearSwipeRefreshing() {
                AbstractPaginatedView.this.clearSwipeRefreshing();
            }
        };
        this.internalReloadRetryListener = new OnRetryClickListener() { // from class: com.vk.lists.AbstractPaginatedView.2
            @Override // com.vk.lists.OnRetryClickListener
            public void onRetryClick() {
                if (AbstractPaginatedView.this.reloadRetryClickListener != null) {
                    AbstractPaginatedView.this.reloadRetryClickListener.onRetryClick();
                }
            }
        };
        this.internalLoadNextRetryListener = new OnRetryClickListener() { // from class: com.vk.lists.AbstractPaginatedView.3
            @Override // com.vk.lists.OnRetryClickListener
            public void onRetryClick() {
                if (AbstractPaginatedView.this.loadNextRetryClickListener != null) {
                    AbstractPaginatedView.this.loadNextRetryClickListener.onRetryClick();
                }
            }
        };
        init();
    }

    private void init() {
        this.listContainer = new FullScreenLayout(getContext());
        this.listContainer.addView(onCreateListView());
        this.listContainer.setVisibility(8);
        addView(this.listContainer, new FrameLayout.LayoutParams(-1, -1, 17));
        this.emptyView = createEmptyView();
        this.emptyView.setVisibility(8);
        addView(this.emptyView, new FrameLayout.LayoutParams(-2, -2, 17));
        this.loadingView = createLoadingView();
        addView(this.loadingView, new FrameLayout.LayoutParams(-2, -2, 17));
        this.errorView = createErrorView();
        this.errorView.setVisibility(8);
        this.errorView.setRetryClickListener(this.internalReloadRetryListener);
        addView(this.errorView, new FrameLayout.LayoutParams(-2, -2, 17));
    }

    protected View createLoadingView() {
        return LayoutInflater.from(getContext()).inflate(R.layout.view_default_loading, (ViewGroup) null);
    }

    protected AbstractErrorView createErrorView() {
        return new DefaultErrorView(getContext());
    }

    protected View createEmptyView() {
        return LayoutInflater.from(getContext()).inflate(R.layout.view_default_empty_view, (ViewGroup) null);
    }

    public LayoutBuilder initLayoutManager(LayoutType layoutType) {
        return new LayoutBuilder(layoutType, this);
    }

    public void setFooterViewProvider(FooterViewProvider footerViewProvider) {
        this.footerViewProvider = footerViewProvider;
    }

    public void showBigLoading() {
        hideFooter();
        makeFirstNViewVisible(1, this.loadingView, this.listContainer, this.errorView, this.emptyView);
    }

    public void showError() {
        hideFooter();
        makeFirstNViewVisible(1, this.errorView, this.loadingView, this.listContainer, this.emptyView);
    }

    public void showList() {
        hideFooter();
        makeFirstNViewVisible(1, this.listContainer, this.errorView, this.loadingView, this.emptyView);
    }

    public void showEmpty() {
        hideFooter();
        makeFirstNViewVisible(2, this.listContainer, this.emptyView, this.errorView, this.loadingView);
    }

    public void showFooterLoading() {
        makeFirstNViewVisible(1, this.listContainer, this.errorView, this.loadingView, this.emptyView);
        doShowFooterLoading();
    }

    public void showFooterError() {
        makeFirstNViewVisible(1, this.listContainer, this.errorView, this.loadingView, this.emptyView);
        doShowFooterError();
    }

    public PaginateHelper.UIControl getUIControl() {
        return this.uiControl;
    }

    public OnRetryClickListener getReloadRetryClickListener() {
        return this.reloadRetryClickListener;
    }

    public void setReloadRetryClickListener(OnRetryClickListener reloadRetryClickListener) {
        this.reloadRetryClickListener = reloadRetryClickListener;
    }

    public OnRetryClickListener getLoadNextRetryClickListener() {
        return this.loadNextRetryClickListener;
    }

    public void setLoadNextRetryClickListener(OnRetryClickListener loadNextRetryClickListener) {
        this.loadNextRetryClickListener = loadNextRetryClickListener;
    }

    private static void makeFirstNViewVisible(int toVisibleCount, View... views) {
        for (int i = 0; i < toVisibleCount; i++) {
            views[i].setVisibility(0);
        }
        for (int i2 = toVisibleCount; i2 < views.length; i2++) {
            views[i2].setVisibility(8);
        }
    }

    /* loaded from: classes2.dex */
    public static class LayoutBuilder {
        private final LayoutType layoutType;
        private final AbstractPaginatedView paginatedView;
        private int spanCount = 1;
        private int orientation = 1;
        private boolean reverseLayout = false;

        public LayoutBuilder(LayoutType layoutType, AbstractPaginatedView paginatedView) {
            this.layoutType = layoutType;
            this.paginatedView = paginatedView;
        }

        public LayoutBuilder setSpanCount(int spanCount) {
            this.spanCount = spanCount;
            return this;
        }

        public LayoutBuilder setOrientation(int orientation) {
            this.orientation = orientation;
            return this;
        }

        public LayoutBuilder setReverseLayout(boolean reverseLayout) {
            this.reverseLayout = reverseLayout;
            return this;
        }

        public void buildAndSet() {
            this.paginatedView.setLayoutManagerFromBuilder(this);
        }

        public LayoutType getLayoutType() {
            return this.layoutType;
        }

        public int getSpanCount() {
            return this.spanCount;
        }

        public int getOrientation() {
            return this.orientation;
        }

        public boolean isReverseLayout() {
            return this.reverseLayout;
        }
    }
}
