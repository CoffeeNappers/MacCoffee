package com.vkontakte.android.ui;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import java.util.ArrayList;
/* loaded from: classes3.dex */
public class MultiColumnLayoutManager extends RecyclerView.LayoutManager {
    private static final String TAG = "MCLM";
    private int topPixelOffset = 0;
    private Column[] cols = {new Column(0, -1, 0)};

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public RecyclerView.LayoutParams generateDefaultLayoutParams() {
        return new RecyclerView.LayoutParams(-1, -2);
    }

    public void setColumnCount(int count) {
        this.cols = new Column[count];
        for (int i = 0; i < count; i++) {
            this.cols[i] = new Column(0, -1, 0);
            this.cols[i].order = i;
        }
        requestLayout();
    }

    public void setColumnRange(int col, int start, int end) {
        this.cols[col].startIndex = start;
        this.cols[col].endIndex = end;
        requestLayout();
    }

    public void setColumnWidth(int col, int w) {
        this.cols[col].width = w;
        requestLayout();
    }

    public void setColumnOrder(int col, int order) {
        this.cols[col].order = order;
        requestLayout();
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public void onLayoutChildren(RecyclerView.Recycler recycler, RecyclerView.State state) {
        Column[] columnArr;
        Column[] columnArr2;
        Column[] columnArr3;
        boolean isInitial = true;
        int extraH = 0;
        if (getChildCount() > 0) {
            for (Column col : this.cols) {
                if (col.views.size() == 0) {
                    col.firstVisibleIndex = -1;
                } else {
                    col.firstVisibleIndex = getPosition(col.views.get(0));
                    col.firstVisibleTop = getDecoratedTop(col.views.get(0));
                }
            }
            isInitial = false;
            if (state.isPreLayout()) {
                for (int i = 0; i < getChildCount(); i++) {
                    if (((RecyclerView.LayoutParams) getChildAt(i).getLayoutParams()).isItemRemoved()) {
                        extraH += getDecoratedMeasuredHeight(getChildAt(i));
                    }
                }
            }
        }
        detachAndScrapAttachedViews(recycler);
        for (Column col2 : this.cols) {
            col2.views.clear();
            if (isInitial) {
                col2.maxBottom = 0;
            }
        }
        for (Column c : this.cols) {
            fillInitial(c, recycler, extraH);
            c.firstVisibleTop = 0;
            c.firstVisibleIndex = 0;
        }
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public boolean supportsPredictiveItemAnimations() {
        return true;
    }

    private int getRealColumnWidth(Column col) {
        Column[] columnArr;
        if (col.width == 0) {
            int width = getPaddedWidth();
            for (Column c : this.cols) {
                if (c != col) {
                    width -= c.width;
                }
            }
            return width;
        }
        int width2 = col.width;
        return width2;
    }

    private int getPaddedWidth() {
        return (getWidth() - getPaddingLeft()) - getPaddingRight();
    }

    private void fillInitial(Column col, RecyclerView.Recycler recycler, int extraHeight) {
        Column[] columnArr;
        if (col.firstVisibleIndex != -1) {
            int topOffset = Math.min(0, col.firstVisibleTop);
            int end = col.endIndex == -1 ? getItemCount() : col.endIndex;
            int width = getRealColumnWidth(col);
            int left = getPaddingLeft();
            for (Column c : this.cols) {
                if (c != col && c.order < col.order) {
                    left += getRealColumnWidth(c);
                }
            }
            for (int pos = Math.max(0, col.firstVisibleIndex - col.startIndex); topOffset < getHeight() + extraHeight && pos < end - col.startIndex; pos++) {
                View view = recycler.getViewForPosition(col.startIndex + pos);
                measureChildWithMargins(view, getPaddedWidth() - width, 0);
                addView(view);
                col.views.add(view);
                layoutDecorated(view, left, topOffset, left + width, topOffset + getDecoratedMeasuredHeight(view));
                topOffset += getDecoratedMeasuredHeight(view);
                if (pos == (end - 1) - col.startIndex) {
                    col.maxBottom = this.topPixelOffset + topOffset;
                }
            }
        }
    }

    private void fillDown(Column col, RecyclerView.Recycler recycler) {
        Column[] columnArr;
        if (col.views.size() != 0) {
            View lastView = col.views.get(col.views.size() - 1);
            int topOffset = getDecoratedBottom(lastView);
            int width = getRealColumnWidth(col);
            int left = getPaddingLeft();
            for (Column c : this.cols) {
                if (c != col && c.order < col.order) {
                    left += getRealColumnWidth(c);
                }
            }
            int end = col.endIndex == -1 ? getItemCount() : col.endIndex;
            for (int pos = getPosition(lastView) + 1; topOffset < getHeight() && pos < end; pos++) {
                View view = recycler.getViewForPosition(pos);
                measureChildWithMargins(view, getPaddedWidth() - width, 0);
                addView(view);
                col.views.add(view);
                layoutDecorated(view, left, topOffset, left + width, topOffset + getDecoratedMeasuredHeight(view));
                topOffset += getDecoratedMeasuredHeight(view);
                if (pos == end - 1) {
                    col.maxBottom = this.topPixelOffset + topOffset;
                }
            }
        }
    }

    private void fillUp(Column col, RecyclerView.Recycler recycler) {
        int pos;
        int topOffset;
        Column[] columnArr;
        if (col.views.size() == 0) {
            if (this.topPixelOffset < col.maxBottom) {
                pos = col.endIndex - 1;
                topOffset = col.maxBottom - this.topPixelOffset;
            } else {
                return;
            }
        } else {
            View firstView = col.views.get(0);
            pos = getPosition(firstView) - 1;
            topOffset = getDecoratedTop(firstView);
        }
        int width = getRealColumnWidth(col);
        int left = getPaddingLeft();
        for (Column c : this.cols) {
            if (c != col && c.order < col.order) {
                left += getRealColumnWidth(c);
            }
        }
        while (topOffset >= 0 && pos >= col.startIndex) {
            View view = recycler.getViewForPosition(pos);
            measureChildWithMargins(view, getPaddedWidth() - width, 0);
            addView(view, 0);
            col.views.add(0, view);
            layoutDecorated(view, left, topOffset - getDecoratedMeasuredHeight(view), left + width, topOffset);
            topOffset -= getDecoratedMeasuredHeight(view);
            pos--;
        }
    }

    private Column columnForView(View view) {
        Column[] columnArr;
        for (Column col : this.cols) {
            if (col.views.contains(view)) {
                return col;
            }
        }
        throw new IllegalStateException("Can't find column for view " + view + ". This shouldn't happen.");
    }

    private void recycleOffscreenViews(RecyclerView.Recycler recycler) {
        for (int i = 0; i < getChildCount(); i++) {
            View child = getChildAt(i);
            if (getDecoratedBottom(child) < 0 || getDecoratedTop(child) > getHeight()) {
                removeAndRecycleView(child, recycler);
                columnForView(child).views.remove(child);
            }
        }
    }

    public int getFirstVisiblePosition() {
        Column[] columnArr;
        if (getChildCount() == 0) {
            return 0;
        }
        int pos = Integer.MAX_VALUE;
        for (Column col : this.cols) {
            if (col.views.size() > 0) {
                pos = Math.min(getPosition(col.views.get(0)), pos);
            }
        }
        return pos;
    }

    public int getLastVisiblePosition() {
        if (getChildCount() == 0) {
            return 0;
        }
        return getPosition(getChildAt(getChildCount() - 1));
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public boolean canScrollVertically() {
        return true;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int computeVerticalScrollExtent(RecyclerView.State state) {
        return 100;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int computeVerticalScrollOffset(RecyclerView.State state) {
        return 500;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int computeVerticalScrollRange(RecyclerView.State state) {
        return 1000;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int scrollVerticallyBy(int dy, RecyclerView.Recycler recycler, RecyclerView.State state) {
        int delta;
        Column[] columnArr;
        if (getChildCount() == 0) {
            return 0;
        }
        View topView = getChildAt(0);
        View bottomView = getChildAt(getChildCount() - 1);
        boolean topBoundReached = getFirstVisiblePosition() == 0;
        boolean bottomBoundReached = getLastVisiblePosition() >= getItemCount() + (-1);
        if (dy > 0) {
            if (bottomBoundReached) {
                int bottomOffset = -(getDecoratedBottom(bottomView) - getHeight());
                delta = Math.max(bottomOffset, -dy);
            } else {
                delta = -dy;
            }
        } else if (topBoundReached) {
            int topOffset = (-getDecoratedTop(topView)) + getPaddingTop();
            delta = Math.min(-dy, topOffset);
        } else {
            delta = -dy;
        }
        offsetChildrenVertical(delta);
        this.topPixelOffset -= delta;
        recycleOffscreenViews(recycler);
        for (Column col : this.cols) {
            if (dy > 0) {
                fillDown(col, recycler);
            } else {
                fillUp(col, recycler);
            }
        }
        return -delta;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class Column {
        public int endIndex;
        public int firstVisibleIndex;
        public int firstVisibleTop;
        public int maxBottom;
        public int order;
        public int startIndex;
        public ArrayList<View> views = new ArrayList<>();
        public int width;

        public Column(int start, int end, int w) {
            this.startIndex = start;
            this.endIndex = end;
            this.width = w;
        }
    }
}
