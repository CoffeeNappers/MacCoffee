package com.vk.lists;

import android.content.Context;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.StaggeredGridLayoutManager;
import android.util.AttributeSet;
import android.view.View;
import com.vk.lists.AbstractPaginatedView;
import com.vk.lists.PaginateHelper;
/* loaded from: classes2.dex */
public class RecyclerPaginatedView extends AbstractPaginatedView {
    private int columnWidth;
    private final PaginateHelper.DataInfoProvider dataInfoProvider;
    private final PaginateHelper.PaginatedView paginatedView;
    private RecyclerView recyclerView;
    private int spanCount;
    private final GridLayoutManager.SpanSizeLookup spanSizeLookup;
    private SwipeRefreshLayout swipeRefreshLayout;
    private PaginatedRecyclerAdapter wrapperAdapter;

    public RecyclerPaginatedView(Context context) {
        super(context);
        this.columnWidth = -1;
        this.spanCount = -1;
        this.paginatedView = new PaginateHelper.PaginatedView() { // from class: com.vk.lists.RecyclerPaginatedView.1
            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void setOnReloadRetryClickListener(OnRetryClickListener onRetryClickListener) {
                RecyclerPaginatedView.this.setReloadRetryClickListener(onRetryClickListener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void setOnLoadNextRetryClickListener(OnRetryClickListener onRetryClickListener) {
                RecyclerPaginatedView.this.setLoadNextRetryClickListener(onRetryClickListener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void addOnScrollListener(RecyclerView.OnScrollListener listener) {
                RecyclerPaginatedView.this.recyclerView.addOnScrollListener(listener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void removeOnScrollListener(RecyclerView.OnScrollListener listener) {
                RecyclerPaginatedView.this.recyclerView.removeOnScrollListener(listener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void setOnRefreshListener(SwipeRefreshLayout.OnRefreshListener listener) {
                RecyclerPaginatedView.this.swipeRefreshLayout.setOnRefreshListener(listener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void setDataObserver(RecyclerView.AdapterDataObserver dataObserver) {
                if (RecyclerPaginatedView.this.dataObserver != null && RecyclerPaginatedView.this.wrapperAdapter != null) {
                    RecyclerPaginatedView.this.wrapperAdapter.unregisterAdapterDataObserver(RecyclerPaginatedView.this.dataObserver);
                    RecyclerPaginatedView.this.dataObserver = null;
                }
                RecyclerPaginatedView.this.dataObserver = dataObserver;
                if (RecyclerPaginatedView.this.wrapperAdapter != null && RecyclerPaginatedView.this.dataObserver != null) {
                    RecyclerPaginatedView.this.wrapperAdapter.registerAdapterDataObserver(RecyclerPaginatedView.this.dataObserver);
                }
            }
        };
        this.dataInfoProvider = new PaginateHelper.DataInfoProvider() { // from class: com.vk.lists.RecyclerPaginatedView.2
            @Override // com.vk.lists.PaginateHelper.DataInfoProvider
            public boolean isListEmpty() {
                return RecyclerPaginatedView.this.wrapperAdapter == null || RecyclerPaginatedView.this.wrapperAdapter.getContentItemsCount() == 0;
            }

            @Override // com.vk.lists.PaginateHelper.DataInfoProvider
            public int getItemsCount() {
                if (RecyclerPaginatedView.this.wrapperAdapter == null) {
                    return 0;
                }
                return RecyclerPaginatedView.this.wrapperAdapter.getContentItemsCount();
            }
        };
        this.spanSizeLookup = new GridLayoutManager.SpanSizeLookup() { // from class: com.vk.lists.RecyclerPaginatedView.3
            @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
            public int getSpanSize(int position) {
                if (RecyclerPaginatedView.this.wrapperAdapter == null || !RecyclerPaginatedView.this.wrapperAdapter.isFooterRow(position)) {
                    return 1;
                }
                return RecyclerPaginatedView.this.spanCount;
            }
        };
    }

    public RecyclerPaginatedView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.columnWidth = -1;
        this.spanCount = -1;
        this.paginatedView = new PaginateHelper.PaginatedView() { // from class: com.vk.lists.RecyclerPaginatedView.1
            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void setOnReloadRetryClickListener(OnRetryClickListener onRetryClickListener) {
                RecyclerPaginatedView.this.setReloadRetryClickListener(onRetryClickListener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void setOnLoadNextRetryClickListener(OnRetryClickListener onRetryClickListener) {
                RecyclerPaginatedView.this.setLoadNextRetryClickListener(onRetryClickListener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void addOnScrollListener(RecyclerView.OnScrollListener listener) {
                RecyclerPaginatedView.this.recyclerView.addOnScrollListener(listener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void removeOnScrollListener(RecyclerView.OnScrollListener listener) {
                RecyclerPaginatedView.this.recyclerView.removeOnScrollListener(listener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void setOnRefreshListener(SwipeRefreshLayout.OnRefreshListener listener) {
                RecyclerPaginatedView.this.swipeRefreshLayout.setOnRefreshListener(listener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void setDataObserver(RecyclerView.AdapterDataObserver dataObserver) {
                if (RecyclerPaginatedView.this.dataObserver != null && RecyclerPaginatedView.this.wrapperAdapter != null) {
                    RecyclerPaginatedView.this.wrapperAdapter.unregisterAdapterDataObserver(RecyclerPaginatedView.this.dataObserver);
                    RecyclerPaginatedView.this.dataObserver = null;
                }
                RecyclerPaginatedView.this.dataObserver = dataObserver;
                if (RecyclerPaginatedView.this.wrapperAdapter != null && RecyclerPaginatedView.this.dataObserver != null) {
                    RecyclerPaginatedView.this.wrapperAdapter.registerAdapterDataObserver(RecyclerPaginatedView.this.dataObserver);
                }
            }
        };
        this.dataInfoProvider = new PaginateHelper.DataInfoProvider() { // from class: com.vk.lists.RecyclerPaginatedView.2
            @Override // com.vk.lists.PaginateHelper.DataInfoProvider
            public boolean isListEmpty() {
                return RecyclerPaginatedView.this.wrapperAdapter == null || RecyclerPaginatedView.this.wrapperAdapter.getContentItemsCount() == 0;
            }

            @Override // com.vk.lists.PaginateHelper.DataInfoProvider
            public int getItemsCount() {
                if (RecyclerPaginatedView.this.wrapperAdapter == null) {
                    return 0;
                }
                return RecyclerPaginatedView.this.wrapperAdapter.getContentItemsCount();
            }
        };
        this.spanSizeLookup = new GridLayoutManager.SpanSizeLookup() { // from class: com.vk.lists.RecyclerPaginatedView.3
            @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
            public int getSpanSize(int position) {
                if (RecyclerPaginatedView.this.wrapperAdapter == null || !RecyclerPaginatedView.this.wrapperAdapter.isFooterRow(position)) {
                    return 1;
                }
                return RecyclerPaginatedView.this.spanCount;
            }
        };
    }

    public RecyclerPaginatedView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.columnWidth = -1;
        this.spanCount = -1;
        this.paginatedView = new PaginateHelper.PaginatedView() { // from class: com.vk.lists.RecyclerPaginatedView.1
            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void setOnReloadRetryClickListener(OnRetryClickListener onRetryClickListener) {
                RecyclerPaginatedView.this.setReloadRetryClickListener(onRetryClickListener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void setOnLoadNextRetryClickListener(OnRetryClickListener onRetryClickListener) {
                RecyclerPaginatedView.this.setLoadNextRetryClickListener(onRetryClickListener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void addOnScrollListener(RecyclerView.OnScrollListener listener) {
                RecyclerPaginatedView.this.recyclerView.addOnScrollListener(listener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void removeOnScrollListener(RecyclerView.OnScrollListener listener) {
                RecyclerPaginatedView.this.recyclerView.removeOnScrollListener(listener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void setOnRefreshListener(SwipeRefreshLayout.OnRefreshListener listener) {
                RecyclerPaginatedView.this.swipeRefreshLayout.setOnRefreshListener(listener);
            }

            @Override // com.vk.lists.PaginateHelper.PaginatedView
            public void setDataObserver(RecyclerView.AdapterDataObserver dataObserver) {
                if (RecyclerPaginatedView.this.dataObserver != null && RecyclerPaginatedView.this.wrapperAdapter != null) {
                    RecyclerPaginatedView.this.wrapperAdapter.unregisterAdapterDataObserver(RecyclerPaginatedView.this.dataObserver);
                    RecyclerPaginatedView.this.dataObserver = null;
                }
                RecyclerPaginatedView.this.dataObserver = dataObserver;
                if (RecyclerPaginatedView.this.wrapperAdapter != null && RecyclerPaginatedView.this.dataObserver != null) {
                    RecyclerPaginatedView.this.wrapperAdapter.registerAdapterDataObserver(RecyclerPaginatedView.this.dataObserver);
                }
            }
        };
        this.dataInfoProvider = new PaginateHelper.DataInfoProvider() { // from class: com.vk.lists.RecyclerPaginatedView.2
            @Override // com.vk.lists.PaginateHelper.DataInfoProvider
            public boolean isListEmpty() {
                return RecyclerPaginatedView.this.wrapperAdapter == null || RecyclerPaginatedView.this.wrapperAdapter.getContentItemsCount() == 0;
            }

            @Override // com.vk.lists.PaginateHelper.DataInfoProvider
            public int getItemsCount() {
                if (RecyclerPaginatedView.this.wrapperAdapter == null) {
                    return 0;
                }
                return RecyclerPaginatedView.this.wrapperAdapter.getContentItemsCount();
            }
        };
        this.spanSizeLookup = new GridLayoutManager.SpanSizeLookup() { // from class: com.vk.lists.RecyclerPaginatedView.3
            @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
            public int getSpanSize(int position) {
                if (RecyclerPaginatedView.this.wrapperAdapter == null || !RecyclerPaginatedView.this.wrapperAdapter.isFooterRow(position)) {
                    return 1;
                }
                return RecyclerPaginatedView.this.spanCount;
            }
        };
    }

    @Override // com.vk.lists.AbstractPaginatedView
    public PaginateHelper.PaginatedView getPaginatedView() {
        return this.paginatedView;
    }

    @Override // com.vk.lists.AbstractPaginatedView
    protected View onCreateListView() {
        this.recyclerView = new RecyclerView(getContext());
        this.swipeRefreshLayout = new SwipeRefreshLayout(getContext());
        this.swipeRefreshLayout.addView(this.recyclerView);
        return this.swipeRefreshLayout;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.lists.AbstractPaginatedView
    public PaginateHelper.DataInfoProvider getDataInfoProvider() {
        return this.dataInfoProvider;
    }

    @Override // com.vk.lists.AbstractPaginatedView
    public void clearSwipeRefreshing() {
        this.swipeRefreshLayout.setRefreshing(false);
    }

    @Override // com.vk.lists.AbstractPaginatedView
    protected void setLayoutManagerFromBuilder(AbstractPaginatedView.LayoutBuilder layoutBuilder) {
        if (layoutBuilder.getLayoutType() == AbstractPaginatedView.LayoutType.STAGGERED_GRID) {
            this.recyclerView.setLayoutManager(new StaggeredGridLayoutManager(layoutBuilder.getSpanCount(), layoutBuilder.getOrientation()));
        } else if (layoutBuilder.getLayoutType() == AbstractPaginatedView.LayoutType.GRID) {
            GridLayoutManager lm = new GridLayoutManager(getContext(), layoutBuilder.getSpanCount(), layoutBuilder.getOrientation(), layoutBuilder.isReverseLayout());
            lm.setSpanSizeLookup(this.spanSizeLookup);
            this.recyclerView.setLayoutManager(lm);
            setFixedSpanCount(layoutBuilder.getSpanCount());
        } else {
            this.recyclerView.setLayoutManager(new LinearLayoutManager(getContext(), layoutBuilder.getOrientation(), layoutBuilder.isReverseLayout()));
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.lists.AbstractPaginatedView
    public void setSwipeRefreshEnabled(boolean enabled) {
        this.swipeRefreshLayout.setEnabled(enabled);
    }

    @Override // com.vk.lists.AbstractPaginatedView
    protected void doShowFooterLoading() {
        if (this.wrapperAdapter != null) {
            this.wrapperAdapter.displayLoadingRow(true);
        }
    }

    @Override // com.vk.lists.AbstractPaginatedView
    protected void doShowFooterError() {
        if (this.wrapperAdapter != null) {
            this.wrapperAdapter.displayErrorRow(true);
        }
    }

    @Override // com.vk.lists.AbstractPaginatedView
    protected void hideFooter() {
        if (this.wrapperAdapter != null) {
            this.wrapperAdapter.hideFooter();
        }
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (this.columnWidth > 0) {
            updateSpanCountFromColumnWidth(w);
        }
    }

    public void setFixedSpanCount(int spanCount) {
        this.spanCount = spanCount;
        this.columnWidth = -1;
        setSpanCountToLayoutManager(spanCount);
    }

    public void setColumnWidth(int columnWidth) {
        this.columnWidth = columnWidth;
        if (getMeasuredWidth() > 0 && columnWidth > 0) {
            updateSpanCountFromColumnWidth(getMeasuredWidth());
        }
    }

    private void updateSpanCountFromColumnWidth(int w) {
        this.spanCount = Math.max(1, w / this.columnWidth);
        setSpanCountToLayoutManager(this.spanCount);
    }

    private void setSpanCountToLayoutManager(int spanCount) {
        if (this.recyclerView.getLayoutManager() != null && (this.recyclerView.getLayoutManager() instanceof GridLayoutManager)) {
            ((GridLayoutManager) this.recyclerView.getLayoutManager()).setSpanCount(spanCount);
            ((GridLayoutManager) this.recyclerView.getLayoutManager()).setSpanSizeLookup(this.spanSizeLookup);
        }
    }

    public RecyclerView getRecyclerView() {
        return this.recyclerView;
    }

    public <T extends RecyclerView.ViewHolder> void setAdapter(RecyclerView.Adapter<T> adapter) {
        if (this.wrapperAdapter != null && this.dataObserver != null) {
            this.wrapperAdapter.unregisterAdapterDataObserver(this.dataObserver);
        }
        this.wrapperAdapter = new PaginatedRecyclerAdapter(adapter, this.footerViewProvider, this.internalLoadNextRetryListener);
        this.recyclerView.setAdapter(this.wrapperAdapter);
        if (this.wrapperAdapter != null && this.dataObserver != null) {
            this.wrapperAdapter.registerAdapterDataObserver(this.dataObserver);
        }
        if (this.dataObserver != null) {
            this.dataObserver.onChanged();
        }
    }
}
