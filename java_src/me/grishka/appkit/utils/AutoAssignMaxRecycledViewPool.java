package me.grishka.appkit.utils;

import android.support.v7.widget.RecyclerView;
import android.util.SparseIntArray;
/* loaded from: classes3.dex */
public class AutoAssignMaxRecycledViewPool extends RecyclerView.RecycledViewPool {
    private final SparseIntArray mMaxScrap = new SparseIntArray();
    private final int mMaxSize;

    public AutoAssignMaxRecycledViewPool(int maxSize) {
        this.mMaxSize = maxSize;
    }

    @Override // android.support.v7.widget.RecyclerView.RecycledViewPool
    public void setMaxRecycledViews(int viewType, int max) {
        this.mMaxScrap.put(viewType, max);
        super.setMaxRecycledViews(viewType, max);
    }

    @Override // android.support.v7.widget.RecyclerView.RecycledViewPool
    public void putRecycledView(RecyclerView.ViewHolder scrap) {
        int viewType = scrap.getItemViewType();
        int max = this.mMaxScrap.get(viewType, -1);
        if (max == -1) {
            setMaxRecycledViews(viewType, this.mMaxSize);
        }
        super.putRecycledView(scrap);
    }

    @Override // android.support.v7.widget.RecyclerView.RecycledViewPool
    public void clear() {
        this.mMaxScrap.clear();
        super.clear();
    }
}
