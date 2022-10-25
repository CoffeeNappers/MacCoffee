package me.grishka.appkit.preloading;

import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.widget.AbsListView;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public final class RecyclerToListViewScrollListener extends RecyclerView.OnScrollListener {
    public static final int SCROLL_STATE_SLOWDOWN = 3;
    public static final int UNKNOWN_SCROLL_STATE = Integer.MIN_VALUE;
    private int lastDY;
    private final List<AbsListView.OnScrollListener> listeners = new ArrayList();
    private int lastFirstVisible = -1;
    private int lastVisibleCount = -1;
    private int lastItemCount = -1;
    private int lastScrollState = Integer.MIN_VALUE;

    public RecyclerToListViewScrollListener(AbsListView.OnScrollListener scrollListener) {
        this.listeners.add(scrollListener);
    }

    public void addScrollListener(AbsListView.OnScrollListener scrollListener) {
        this.listeners.add(scrollListener);
    }

    public void removeScrollListener(AbsListView.OnScrollListener scrollListener) {
        this.listeners.remove(scrollListener);
    }

    @Override // android.support.v7.widget.RecyclerView.OnScrollListener
    public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
        switch (newState) {
            case 0:
                this.lastScrollState = 0;
                break;
            case 1:
                this.lastScrollState = 1;
                break;
            case 2:
                this.lastScrollState = 2;
                break;
            default:
                this.lastScrollState = Integer.MIN_VALUE;
                break;
        }
        for (AbsListView.OnScrollListener listener : this.listeners) {
            listener.onScrollStateChanged(null, this.lastScrollState);
        }
    }

    @Override // android.support.v7.widget.RecyclerView.OnScrollListener
    public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
        if (this.lastScrollState == 2 && dy < 35 && this.lastDY > 0 && this.lastDY - dy < 100) {
            this.lastScrollState = 3;
            for (AbsListView.OnScrollListener listener : this.listeners) {
                listener.onScrollStateChanged(null, this.lastScrollState);
            }
        }
        this.lastDY = dy;
        RecyclerView.LayoutManager lm = recyclerView.getLayoutManager();
        if (lm instanceof LinearLayoutManager) {
            LinearLayoutManager layoutManager = (LinearLayoutManager) lm;
            int firstVisible = layoutManager.findFirstVisibleItemPosition();
            int visibleCount = Math.abs(firstVisible - layoutManager.findLastVisibleItemPosition());
            int itemCount = recyclerView.mo1204getAdapter().getItemCount();
            if (firstVisible != this.lastFirstVisible || visibleCount != this.lastVisibleCount || itemCount != this.lastItemCount) {
                for (AbsListView.OnScrollListener listener2 : this.listeners) {
                    listener2.onScroll(null, firstVisible, visibleCount, itemCount);
                }
                this.lastFirstVisible = firstVisible;
                this.lastVisibleCount = visibleCount;
                this.lastItemCount = itemCount;
            }
        } else if (lm instanceof GridLayoutManager) {
            GridLayoutManager layoutManager2 = (GridLayoutManager) lm;
            int firstVisible2 = layoutManager2.findFirstVisibleItemPosition();
            int visibleCount2 = Math.abs(firstVisible2 - layoutManager2.findLastVisibleItemPosition());
            int itemCount2 = recyclerView.mo1204getAdapter().getItemCount();
            if (firstVisible2 != this.lastFirstVisible || visibleCount2 != this.lastVisibleCount || itemCount2 != this.lastItemCount) {
                for (AbsListView.OnScrollListener listener3 : this.listeners) {
                    listener3.onScroll(null, firstVisible2, visibleCount2, itemCount2);
                }
                this.lastFirstVisible = firstVisible2;
                this.lastVisibleCount = visibleCount2;
                this.lastItemCount = itemCount2;
            }
        }
    }
}
