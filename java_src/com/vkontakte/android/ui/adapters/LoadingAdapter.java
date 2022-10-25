package com.vkontakte.android.ui.adapters;

import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.utils.Preloader;
import me.grishka.appkit.views.UsableRecyclerView;
import me.grishka.appkit.views.UsableRecyclerView.ViewHolder;
/* loaded from: classes3.dex */
public abstract class LoadingAdapter<H, T extends UsableRecyclerView.ViewHolder> extends UsableRecyclerView.Adapter<T> implements Preloader.Callback<H>, UsableRecyclerView.Listener {
    protected UsableRecyclerView list;
    protected Preloader<H> preloader;
    protected ArrayList<H> displayItems = new ArrayList<>();
    protected boolean dataLoading = false;

    public LoadingAdapter(List<H> initialList, UsableRecyclerView list, int countForLoad) {
        this.preloader = new Preloader<>(this, countForLoad);
        this.preloader.onDataLoaded(initialList, true);
        this.list = list;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.displayItems.size();
    }

    @Override // me.grishka.appkit.utils.Preloader.Callback
    public void updateList() {
        notifyDataSetChanged();
    }

    @Override // me.grishka.appkit.utils.Preloader.Callback
    public void onClearItems() {
        this.displayItems.clear();
    }

    @Override // me.grishka.appkit.utils.Preloader.Callback
    public boolean isDataLoading() {
        return this.dataLoading;
    }

    @Override // me.grishka.appkit.utils.Preloader.Callback
    public boolean isRefreshing() {
        return false;
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Listener
    public void onScrolledToLastItem() {
        this.preloader.onScrolledToLastItem();
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Listener
    public void onScrollStarted() {
    }
}
