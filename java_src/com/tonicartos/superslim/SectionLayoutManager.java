package com.tonicartos.superslim;

import android.content.Context;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.View;
import com.tonicartos.superslim.LayoutManager;
import com.tonicartos.superslim.LayoutState;
/* loaded from: classes.dex */
public abstract class SectionLayoutManager {
    private static final int MARGIN_UNSET = -1;
    protected LayoutManager mLayoutManager;

    public abstract int computeHeaderOffset(int i, SectionData sectionData, LayoutState layoutState);

    public abstract int fillToEnd(int i, int i2, int i3, SectionData sectionData, LayoutState layoutState);

    public abstract int fillToStart(int i, int i2, int i3, SectionData sectionData, LayoutState layoutState);

    public abstract int finishFillToEnd(int i, View view, SectionData sectionData, LayoutState layoutState);

    public abstract int finishFillToStart(int i, View view, SectionData sectionData, LayoutState layoutState);

    public SectionLayoutManager(LayoutManager layoutManager) {
        this.mLayoutManager = layoutManager;
    }

    public int findFirstCompletelyVisibleItemPosition(int sectionFirstPosition) {
        View item = getFirstCompletelyVisibleView(sectionFirstPosition, false);
        if (item == null) {
            return -1;
        }
        return this.mLayoutManager.getPosition(item);
    }

    public int findFirstVisibleItemPosition(int sectionFirstPosition) {
        View item = getFirstVisibleView(sectionFirstPosition, false);
        if (item == null) {
            return -1;
        }
        return this.mLayoutManager.getPosition(item);
    }

    public int findLastCompletelyVisibleItemPosition(int sectionFirstPosition) {
        View item = getLastCompletelyVisibleView(sectionFirstPosition);
        if (item == null) {
            return -1;
        }
        return this.mLayoutManager.getPosition(item);
    }

    public int findLastVisibleItemPosition(int sectionFirstPosition) {
        View item = getLastVisibleView(sectionFirstPosition);
        if (item == null) {
            return -1;
        }
        return this.mLayoutManager.getPosition(item);
    }

    public LayoutManager.LayoutParams generateLayoutParams(LayoutManager.LayoutParams params) {
        return params;
    }

    public LayoutManager.LayoutParams generateLayoutParams(Context c, AttributeSet attrs) {
        return new LayoutManager.LayoutParams(c, attrs);
    }

    public int getAnchorPosition(LayoutState state, SectionData params, int position) {
        return position;
    }

    public View getFirstCompletelyVisibleView(int sectionFirstPosition, boolean skipHeader) {
        int bottomEdge;
        int topEdge = this.mLayoutManager.getClipToPadding() ? this.mLayoutManager.getPaddingTop() : 0;
        if (this.mLayoutManager.getClipToPadding()) {
            bottomEdge = this.mLayoutManager.getHeight() - this.mLayoutManager.getPaddingBottom();
        } else {
            bottomEdge = this.mLayoutManager.getHeight();
        }
        int childCount = this.mLayoutManager.getChildCount();
        View candidate = null;
        for (int lookAt = 0; lookAt < childCount; lookAt++) {
            View view = this.mLayoutManager.getChildAt(lookAt);
            boolean topInside = this.mLayoutManager.getDecoratedTop(view) >= topEdge;
            boolean bottomInside = this.mLayoutManager.getDecoratedBottom(view) <= bottomEdge;
            LayoutManager.LayoutParams lp = (LayoutManager.LayoutParams) view.getLayoutParams();
            if (sectionFirstPosition == lp.getTestedFirstPosition()) {
                if (topInside && bottomInside) {
                    if (!lp.isHeader || !skipHeader) {
                        return view;
                    }
                    candidate = view;
                }
            } else {
                return candidate;
            }
        }
        return candidate;
    }

    public View getFirstVisibleView(int sectionFirstPosition, boolean skipHeader) {
        int childCount = this.mLayoutManager.getChildCount();
        View candidate = null;
        for (int lookAt = 0; lookAt < childCount; lookAt++) {
            View view = this.mLayoutManager.getChildAt(lookAt);
            LayoutManager.LayoutParams lp = (LayoutManager.LayoutParams) view.getLayoutParams();
            if (sectionFirstPosition == lp.getTestedFirstPosition()) {
                if (!lp.isHeader || !skipHeader) {
                    return view;
                }
                candidate = view;
            } else {
                return candidate;
            }
        }
        return candidate;
    }

    public int getHighestEdge(int sectionFirstPosition, int firstIndex, int defaultEdge) {
        for (int i = firstIndex; i < this.mLayoutManager.getChildCount(); i++) {
            View child = this.mLayoutManager.getChildAt(i);
            LayoutManager.LayoutParams params = (LayoutManager.LayoutParams) child.getLayoutParams();
            if (params.getTestedFirstPosition() == sectionFirstPosition) {
                if (!params.isHeader) {
                    return this.mLayoutManager.getDecoratedTop(child);
                }
            } else {
                return defaultEdge;
            }
        }
        return defaultEdge;
    }

    public View getLastCompletelyVisibleView(int sectionFirstPosition) {
        int bottomEdge;
        int topEdge = this.mLayoutManager.getClipToPadding() ? this.mLayoutManager.getPaddingTop() : 0;
        if (this.mLayoutManager.getClipToPadding()) {
            bottomEdge = this.mLayoutManager.getHeight() - this.mLayoutManager.getPaddingBottom();
        } else {
            bottomEdge = this.mLayoutManager.getHeight();
        }
        int lookAt = this.mLayoutManager.getChildCount() - 1;
        View candidate = null;
        while (lookAt >= 0) {
            View view = this.mLayoutManager.getChildAt(lookAt);
            boolean topInside = this.mLayoutManager.getDecoratedTop(view) >= topEdge;
            boolean bottomInside = this.mLayoutManager.getDecoratedBottom(view) <= bottomEdge;
            LayoutManager.LayoutParams lp = (LayoutManager.LayoutParams) view.getLayoutParams();
            if (sectionFirstPosition == lp.getTestedFirstPosition()) {
                if (topInside && bottomInside) {
                    if (!lp.isHeader) {
                        return view;
                    }
                    candidate = view;
                }
                lookAt--;
            } else if (candidate == null) {
                sectionFirstPosition = lp.getTestedFirstPosition();
            } else {
                return candidate;
            }
        }
        return candidate;
    }

    public View getLastVisibleView(int sectionFirstPosition) {
        View candidate = null;
        for (int lookAt = this.mLayoutManager.getChildCount() - 1; lookAt >= 0; lookAt--) {
            View view = this.mLayoutManager.getChildAt(lookAt);
            LayoutManager.LayoutParams lp = (LayoutManager.LayoutParams) view.getLayoutParams();
            if (sectionFirstPosition == lp.getTestedFirstPosition()) {
                if (!lp.isHeader) {
                    return view;
                }
                candidate = view;
            } else {
                return candidate;
            }
        }
        return candidate;
    }

    public int getLowestEdge(int sectionFirstPosition, int lastIndex, int defaultEdge) {
        for (int i = lastIndex; i >= 0; i--) {
            View child = this.mLayoutManager.getChildAt(i);
            LayoutManager.LayoutParams params = (LayoutManager.LayoutParams) child.getLayoutParams();
            if (params.getTestedFirstPosition() == sectionFirstPosition) {
                if (!params.isHeader) {
                    return this.mLayoutManager.getDecoratedBottom(child);
                }
            } else {
                return defaultEdge;
            }
        }
        return defaultEdge;
    }

    public int howManyMissingAbove(int firstPosition, SparseArray<Boolean> positionsOffscreen) {
        int itemsSkipped = 0;
        int itemsFound = 0;
        int i = firstPosition;
        while (itemsFound < positionsOffscreen.size()) {
            if (positionsOffscreen.get(i, false).booleanValue()) {
                itemsFound++;
            } else {
                itemsSkipped++;
            }
            i++;
        }
        return itemsSkipped;
    }

    public int howManyMissingBelow(int lastPosition, SparseArray<Boolean> positionsOffscreen) {
        int itemsSkipped = 0;
        int itemsFound = 0;
        int i = lastPosition;
        while (itemsFound < positionsOffscreen.size()) {
            if (positionsOffscreen.get(i, false).booleanValue()) {
                itemsFound++;
            } else {
                itemsSkipped++;
            }
            i--;
        }
        return itemsSkipped;
    }

    /* renamed from: init */
    public SectionLayoutManager mo444init(SectionData sd) {
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int addView(LayoutState.View child, int position, LayoutManager.Direction direction, LayoutState state) {
        int addIndex;
        if (direction == LayoutManager.Direction.START) {
            addIndex = 0;
        } else {
            addIndex = this.mLayoutManager.getChildCount();
        }
        state.decacheView(position);
        this.mLayoutManager.addView(child.view, addIndex);
        return addIndex;
    }
}
