package me.grishka.appkit.views;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class RecyclerViewAdapterWrapper extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> {
    @NonNull
    final UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> wrapped;

    public RecyclerViewAdapterWrapper(@NonNull UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> wrapped) {
        this.wrapped = wrapped;
        super.setHasStableIds(wrapped.hasStableIds());
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder  reason: collision with other method in class */
    public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        return (UsableRecyclerView.ViewHolder) this.wrapped.mo1206onCreateViewHolder(parent, viewType);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
        this.wrapped.onBindViewHolder(holder, position);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.wrapped.getItemCount();
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        this.wrapped.onAttachedToRecyclerView(recyclerView);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        this.wrapped.onDetachedFromRecyclerView(recyclerView);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public long getItemId(int position) {
        return this.wrapped.getItemId(position);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        return this.wrapped.getItemViewType(position);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public boolean onFailedToRecycleView(UsableRecyclerView.ViewHolder holder) {
        return this.wrapped.onFailedToRecycleView(holder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onViewAttachedToWindow(UsableRecyclerView.ViewHolder holder) {
        this.wrapped.onViewAttachedToWindow(holder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onViewDetachedFromWindow(UsableRecyclerView.ViewHolder holder) {
        this.wrapped.onViewDetachedFromWindow(holder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onViewRecycled(UsableRecyclerView.ViewHolder holder) {
        this.wrapped.onViewRecycled(holder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void registerAdapterDataObserver(RecyclerView.AdapterDataObserver observer) {
        super.registerAdapterDataObserver(observer);
        this.wrapped.registerAdapterDataObserver(observer);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void setHasStableIds(boolean hasStableIds) {
        this.wrapped.setHasStableIds(hasStableIds);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void unregisterAdapterDataObserver(RecyclerView.AdapterDataObserver observer) {
        super.unregisterAdapterDataObserver(observer);
        this.wrapped.unregisterAdapterDataObserver(observer);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
    public int getImageCountForItem(int position) {
        return this.wrapped.getImageCountForItem(position);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
    public String getImageURL(int position, int image) {
        return this.wrapped.getImageURL(position, image);
    }
}
