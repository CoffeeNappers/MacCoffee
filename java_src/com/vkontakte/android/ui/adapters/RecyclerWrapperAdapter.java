package com.vkontakte.android.ui.adapters;

import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.ViewGroup;
/* loaded from: classes3.dex */
public class RecyclerWrapperAdapter<T extends RecyclerView.ViewHolder> extends RecyclerView.Adapter<T> {
    protected final RecyclerView.Adapter<T> wrappedAdapter;

    public RecyclerWrapperAdapter(RecyclerView.Adapter<T> wrappedAdapter) {
        this.wrappedAdapter = wrappedAdapter;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder */
    public T mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        return this.wrappedAdapter.mo1206onCreateViewHolder(parent, viewType);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(T holder, int position) {
        this.wrappedAdapter.onBindViewHolder(holder, position);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.wrappedAdapter.getItemCount();
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        return this.wrappedAdapter.getItemViewType(position);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void setHasStableIds(boolean hasStableIds) {
        super.setHasStableIds(hasStableIds);
        this.wrappedAdapter.setHasStableIds(hasStableIds);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public long getItemId(int position) {
        return this.wrappedAdapter.getItemId(position);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onViewRecycled(T holder) {
        this.wrappedAdapter.onViewRecycled(holder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public boolean onFailedToRecycleView(T holder) {
        return this.wrappedAdapter.onFailedToRecycleView(holder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onViewAttachedToWindow(T holder) {
        this.wrappedAdapter.onViewAttachedToWindow(holder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onViewDetachedFromWindow(T holder) {
        this.wrappedAdapter.onViewDetachedFromWindow(holder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void registerAdapterDataObserver(RecyclerView.AdapterDataObserver observer) {
        this.wrappedAdapter.registerAdapterDataObserver(observer);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void unregisterAdapterDataObserver(RecyclerView.AdapterDataObserver observer) {
        this.wrappedAdapter.unregisterAdapterDataObserver(observer);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        this.wrappedAdapter.onAttachedToRecyclerView(recyclerView);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        this.wrappedAdapter.onDetachedFromRecyclerView(recyclerView);
    }
}
