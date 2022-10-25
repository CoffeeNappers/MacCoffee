package com.vkontakte.android.ui;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.AbsListView;
import com.vkontakte.android.Global;
/* loaded from: classes3.dex */
public class ListDirectionDetector extends RecyclerView.OnScrollListener implements AbsListView.OnScrollListener {
    private int mLastScrollY;
    private int mPreviousFirstVisibleItem;
    private ScrollDirectionListener mScrollDirectionListener;
    private int mScrollThreshold;

    /* loaded from: classes3.dex */
    public interface ScrollDirectionListener {
        void onScrollDown();

        void onScrollUp();
    }

    public ListDirectionDetector(int scrollThreshold) {
        this.mScrollThreshold = scrollThreshold;
    }

    public ListDirectionDetector() {
        this(Global.scale(4.0f));
    }

    private void setScrollDirectionListener(ScrollDirectionListener scrollDirectionListener) {
        this.mScrollDirectionListener = scrollDirectionListener;
    }

    public void onScrollDown() {
        if (this.mScrollDirectionListener != null) {
            this.mScrollDirectionListener.onScrollDown();
        }
    }

    public void onScrollUp() {
        if (this.mScrollDirectionListener != null) {
            this.mScrollDirectionListener.onScrollUp();
        }
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView view, int scrollState) {
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        if (totalItemCount != 0) {
            if (isSameRow(firstVisibleItem)) {
                int newScrollY = getTopItemScrollY(view);
                boolean isSignificantDelta = Math.abs(this.mLastScrollY - newScrollY) > this.mScrollThreshold;
                if (isSignificantDelta) {
                    if (this.mLastScrollY > newScrollY) {
                        onScrollUp();
                    } else {
                        onScrollDown();
                    }
                }
                this.mLastScrollY = newScrollY;
                return;
            }
            if (firstVisibleItem > this.mPreviousFirstVisibleItem) {
                onScrollUp();
            } else {
                onScrollDown();
            }
            this.mLastScrollY = getTopItemScrollY(view);
            this.mPreviousFirstVisibleItem = firstVisibleItem;
        }
    }

    @Override // android.support.v7.widget.RecyclerView.OnScrollListener
    public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
        boolean isSignificantDelta = Math.abs(dy) > this.mScrollThreshold;
        if (isSignificantDelta) {
            if (dy > 0) {
                onScrollUp();
            } else {
                onScrollDown();
            }
        }
    }

    public void setScrollThreshold(int scrollThreshold) {
        this.mScrollThreshold = scrollThreshold;
    }

    private boolean isSameRow(int firstVisibleItem) {
        return firstVisibleItem == this.mPreviousFirstVisibleItem;
    }

    private int getTopItemScrollY(AbsListView listView) {
        if (listView == null || listView.getChildAt(0) == null) {
            return 0;
        }
        View topChild = listView.getChildAt(0);
        return topChild.getTop();
    }
}
