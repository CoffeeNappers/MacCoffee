package com.vk.lists;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class PaginatedRecyclerAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    private static final int ITEM_VIEW_TYPE_LOADING = 2147483597;
    private final RecyclerView.AdapterDataObserver adapterDataObserver = new RecyclerView.AdapterDataObserver() { // from class: com.vk.lists.PaginatedRecyclerAdapter.1
        @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
        public void onChanged() {
            PaginatedRecyclerAdapter.this.notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
        public void onItemRangeChanged(int positionStart, int itemCount) {
            PaginatedRecyclerAdapter.this.notifyItemRangeChanged(positionStart, itemCount);
        }

        @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
        public void onItemRangeInserted(int positionStart, int itemCount) {
            PaginatedRecyclerAdapter.this.notifyItemRangeInserted(positionStart, itemCount);
        }

        @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
        public void onItemRangeRemoved(int positionStart, int itemCount) {
            PaginatedRecyclerAdapter.this.notifyItemRangeRemoved(positionStart, itemCount);
        }

        @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
        public void onItemRangeMoved(int fromPosition, int toPosition, int itemCount) {
            PaginatedRecyclerAdapter.this.notifyDataSetChanged();
        }
    };
    private boolean displayError;
    private boolean displayLoading;
    private final FooterViewProvider footerViewProvider;
    private final OnRetryClickListener onRetryClickListener;
    private final RecyclerView.Adapter wrappedAdapter;

    public PaginatedRecyclerAdapter(RecyclerView.Adapter adapter, FooterViewProvider footerViewProvider, OnRetryClickListener onRetryClickListener) {
        this.onRetryClickListener = onRetryClickListener;
        this.wrappedAdapter = adapter;
        this.wrappedAdapter.registerAdapterDataObserver(this.adapterDataObserver);
        this.footerViewProvider = footerViewProvider;
    }

    public int getContentItemsCount() {
        return this.wrappedAdapter.getItemCount();
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder */
    public RecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        return viewType == ITEM_VIEW_TYPE_LOADING ? new FooterHolder(parent.getContext(), this.footerViewProvider, this.onRetryClickListener) : this.wrappedAdapter.mo1206onCreateViewHolder(parent, viewType);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        if (isFooterRow(position)) {
            ((FooterHolder) holder).onBindViewHolder(this.displayLoading);
        } else {
            this.wrappedAdapter.onBindViewHolder(holder, position);
        }
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return isDisplayFooterRow() ? this.wrappedAdapter.getItemCount() + 1 : this.wrappedAdapter.getItemCount();
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        return isFooterRow(position) ? ITEM_VIEW_TYPE_LOADING : this.wrappedAdapter.getItemViewType(position);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public long getItemId(int position) {
        if (isFooterRow(position)) {
            return -1L;
        }
        return this.wrappedAdapter.getItemId(position);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void setHasStableIds(boolean hasStableIds) {
        super.setHasStableIds(hasStableIds);
        this.wrappedAdapter.setHasStableIds(hasStableIds);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onViewRecycled(RecyclerView.ViewHolder holder) {
        this.wrappedAdapter.onViewRecycled(holder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onViewAttachedToWindow(RecyclerView.ViewHolder holder) {
        this.wrappedAdapter.onViewAttachedToWindow(holder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onViewDetachedFromWindow(RecyclerView.ViewHolder holder) {
        this.wrappedAdapter.onViewDetachedFromWindow(holder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        this.wrappedAdapter.onAttachedToRecyclerView(recyclerView);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        this.wrappedAdapter.onDetachedFromRecyclerView(recyclerView);
    }

    public RecyclerView.Adapter getWrappedAdapter() {
        return this.wrappedAdapter;
    }

    public boolean isDisplayFooterRow() {
        return this.displayLoading || this.displayError;
    }

    public void displayLoadingRow(boolean displayLoadingRow) {
        if (this.displayLoading != displayLoadingRow) {
            this.displayLoading = displayLoadingRow;
            this.displayError = false;
            notifyDataSetChanged();
        }
    }

    public void displayErrorRow(boolean displayErrorRow) {
        if (this.displayError != displayErrorRow) {
            this.displayError = displayErrorRow;
            this.displayLoading = false;
            notifyDataSetChanged();
        }
    }

    public void hideFooter() {
        if (this.displayError || this.displayLoading) {
            this.displayError = false;
            this.displayLoading = false;
            notifyDataSetChanged();
        }
    }

    public boolean isFooterRow(int position) {
        return isDisplayFooterRow() && position == getFooterRowPosition();
    }

    private int getFooterRowPosition() {
        if (isDisplayFooterRow()) {
            return getItemCount() - 1;
        }
        return -1;
    }

    /* loaded from: classes2.dex */
    private final class FooterHolder extends RecyclerView.ViewHolder {
        private final FooterView footerView;

        public FooterHolder(Context context, FooterViewProvider provider, OnRetryClickListener onRetryClickListener) {
            super(provider.createFooterView(context));
            this.footerView = (FooterView) this.itemView;
            this.footerView.setErrorRetryClickListener(onRetryClickListener);
        }

        public void onBindViewHolder(boolean showLoading) {
            if (showLoading) {
                this.footerView.showLoading();
            } else {
                this.footerView.showError();
            }
        }
    }
}
