package com.tonicartos.superslim;

import android.support.v7.widget.RecyclerView;
import android.util.SparseArray;
import com.tonicartos.superslim.LayoutManager;
/* loaded from: classes.dex */
public class LayoutState {
    public final boolean isLTR;
    public final RecyclerView.Recycler recycler;
    private final RecyclerView.State recyclerState;
    public final SparseArray<android.view.View> viewCache;

    public LayoutState(RecyclerView.LayoutManager layoutManager, RecyclerView.Recycler recycler, RecyclerView.State recyclerState) {
        this.viewCache = new SparseArray<>(layoutManager.getChildCount());
        this.recyclerState = recyclerState;
        this.recycler = recycler;
        this.isLTR = layoutManager.getLayoutDirection() == 0;
    }

    public void cacheView(int position, android.view.View view) {
        this.viewCache.put(position, view);
    }

    public void decacheView(int position) {
        this.viewCache.remove(position);
    }

    public android.view.View getCachedView(int position) {
        return this.viewCache.get(position);
    }

    public RecyclerView.State getRecyclerState() {
        return this.recyclerState;
    }

    public View getView(int position) {
        android.view.View child = getCachedView(position);
        boolean wasCached = child != null;
        if (child == null) {
            child = this.recycler.getViewForPosition(position);
        }
        return new View(child, wasCached);
    }

    public void recycleCache() {
        for (int i = 0; i < this.viewCache.size(); i++) {
            this.recycler.recycleView(this.viewCache.valueAt(i));
        }
    }

    /* loaded from: classes.dex */
    public static class View {
        public final android.view.View view;
        public final boolean wasCached;

        public View(android.view.View child, boolean wasCached) {
            this.view = child;
            this.wasCached = wasCached;
        }

        public LayoutManager.LayoutParams getLayoutParams() {
            return (LayoutManager.LayoutParams) this.view.getLayoutParams();
        }
    }
}
