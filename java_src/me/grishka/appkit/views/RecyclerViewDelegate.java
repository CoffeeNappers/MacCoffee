package me.grishka.appkit.views;

import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.widget.AbsListView;
/* loaded from: classes3.dex */
public class RecyclerViewDelegate {
    private RecyclerView view;

    public RecyclerViewDelegate(RecyclerView view) {
        this.view = view;
    }

    public int getVisibleItemCount() {
        return getLastVisiblePosition() - getFirstVisiblePosition();
    }

    public int getFirstVisiblePosition() {
        RecyclerView.LayoutManager lm = this.view.getLayoutManager();
        if (lm instanceof LinearLayoutManager) {
            return ((LinearLayoutManager) lm).findFirstVisibleItemPosition();
        }
        if (this.view.mo1204getAdapter() != null && this.view.getChildCount() != 0) {
            return this.view.getChildAdapterPosition(this.view.getChildAt(0));
        }
        return 0;
    }

    public int getLastVisiblePosition() {
        RecyclerView.LayoutManager lm = this.view.getLayoutManager();
        if (lm instanceof LinearLayoutManager) {
            return ((LinearLayoutManager) lm).findLastVisibleItemPosition();
        }
        if (this.view.mo1204getAdapter() != null && this.view.getChildCount() != 0) {
            return this.view.getChildAdapterPosition(this.view.getChildAt(this.view.getChildCount() - 1));
        }
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getCount() {
        if (this.view.mo1204getAdapter() == null) {
            return 0;
        }
        return this.view.mo1204getAdapter().getItemCount();
    }

    public void setOnScrollListener(final AbsListView.OnScrollListener listener) {
        this.view.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: me.grishka.appkit.views.RecyclerViewDelegate.1
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                int listViewState = -1;
                switch (newState) {
                    case 0:
                        listViewState = 0;
                        break;
                    case 1:
                        listViewState = 1;
                        break;
                    case 2:
                        listViewState = 2;
                        break;
                }
                if (listViewState != -1) {
                    listener.onScrollStateChanged(null, listViewState);
                }
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                listener.onScroll(null, RecyclerViewDelegate.this.getFirstVisiblePosition(), RecyclerViewDelegate.this.getVisibleItemCount(), RecyclerViewDelegate.this.getCount());
            }
        });
    }
}
