package com.vkontakte.android.ui;

import android.widget.AbsListView;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public class ScrollListenerComposer implements AbsListView.OnScrollListener {
    private List<AbsListView.OnScrollListener> mOnScrollListeners;

    @Override // android.widget.AbsListView.OnScrollListener
    public final void onScrollStateChanged(AbsListView view, int scrollState) {
        if (this.mOnScrollListeners != null && !this.mOnScrollListeners.isEmpty()) {
            for (AbsListView.OnScrollListener listener : this.mOnScrollListeners) {
                listener.onScrollStateChanged(view, scrollState);
            }
        }
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public final void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        if (this.mOnScrollListeners != null && !this.mOnScrollListeners.isEmpty()) {
            for (AbsListView.OnScrollListener listener : this.mOnScrollListeners) {
                listener.onScroll(view, firstVisibleItem, visibleItemCount, totalItemCount);
            }
        }
    }

    public void addOnScrollListener(AbsListView.OnScrollListener listener) {
        if (this.mOnScrollListeners == null) {
            this.mOnScrollListeners = new ArrayList(1);
        }
        this.mOnScrollListeners.add(listener);
    }

    public void removeOnScrollListener(AbsListView.OnScrollListener listener) {
        if (this.mOnScrollListeners != null) {
            this.mOnScrollListeners.remove(listener);
        }
    }
}
