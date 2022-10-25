package com.tonicartos.superslim;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import com.tonicartos.superslim.LayoutManager;
import com.tonicartos.superslim.LayoutState;
import com.vkontakte.android.R;
/* loaded from: classes.dex */
public class GridSLM extends SectionLayoutManager {
    private static final int AUTO_FIT = -1;
    private static final int DEFAULT_NUM_COLUMNS = 1;
    public static int ID = 2;
    private int mColumnWidth;
    private boolean mColumnsSpecified;
    private final Context mContext;
    private int mMinimumWidth;
    private int mNumColumns;

    public GridSLM(LayoutManager layoutManager, Context context) {
        super(layoutManager);
        this.mMinimumWidth = 0;
        this.mNumColumns = 0;
        this.mContext = context;
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public int computeHeaderOffset(int firstVisiblePosition, SectionData sd, LayoutState state) {
        int itemCount = state.getRecyclerState().getItemCount();
        int areaAbove = 0;
        int position = sd.firstPosition + 1;
        while (areaAbove < sd.headerHeight && position < firstVisiblePosition) {
            int rowHeight = 0;
            for (int col = 0; col < this.mNumColumns && position + col < itemCount; col++) {
                LayoutState.View child = state.getView(position + col);
                measureChild(child, sd);
                rowHeight = Math.max(rowHeight, this.mLayoutManager.getDecoratedMeasuredHeight(child.view));
                state.cacheView(position + col, child.view);
            }
            areaAbove += rowHeight;
            position += this.mNumColumns;
        }
        if (areaAbove == sd.headerHeight) {
            return 0;
        }
        if (areaAbove > sd.headerHeight) {
            return 1;
        }
        return -areaAbove;
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public int fillToEnd(int leadingEdge, int markerLine, int anchorPosition, SectionData sd, LayoutState state) {
        int itemCount;
        if (markerLine < leadingEdge && anchorPosition < (itemCount = state.getRecyclerState().getItemCount())) {
            LayoutState.View anchor = state.getView(anchorPosition);
            state.cacheView(anchorPosition, anchor.view);
            if (anchor.getLayoutParams().getTestedFirstPosition() != sd.firstPosition) {
                return markerLine;
            }
            int firstContentPosition = sd.hasHeader ? sd.firstPosition + 1 : sd.firstPosition;
            int col = (anchorPosition - firstContentPosition) % this.mNumColumns;
            for (int i = 1; i <= col; i++) {
                int j = 1;
                while (true) {
                    if (j <= this.mLayoutManager.getChildCount()) {
                        View child = this.mLayoutManager.getChildAt(this.mLayoutManager.getChildCount() - j);
                        if (this.mLayoutManager.getPosition(child) == anchorPosition - i) {
                            markerLine = this.mLayoutManager.getDecoratedTop(child);
                            this.mLayoutManager.detachAndScrapViewAt(j, state.recycler);
                            break;
                        }
                        LayoutManager.LayoutParams params = (LayoutManager.LayoutParams) child.getLayoutParams();
                        if (params.getTestedFirstPosition() == sd.firstPosition) {
                            j++;
                        }
                    }
                }
            }
            int i2 = anchorPosition - col;
            while (true) {
                if (i2 >= itemCount || markerLine > leadingEdge) {
                    break;
                }
                LayoutState.View view = state.getView(i2);
                if (view.getLayoutParams().getTestedFirstPosition() != sd.firstPosition) {
                    state.cacheView(i2, view.view);
                    break;
                }
                int rowHeight = fillRow(markerLine, i2, LayoutManager.Direction.END, true, sd, state);
                markerLine += rowHeight;
                i2 += this.mNumColumns;
            }
            return markerLine;
        }
        return markerLine;
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public int fillToStart(int leadingEdge, int markerLine, int anchorPosition, SectionData sd, LayoutState state) {
        int firstContentPosition = sd.hasHeader ? sd.firstPosition + 1 : sd.firstPosition;
        boolean applyMinHeight = false;
        int i = 0;
        while (true) {
            if (i >= this.mLayoutManager.getChildCount()) {
                break;
            }
            LayoutManager.LayoutParams checkParams = (LayoutManager.LayoutParams) this.mLayoutManager.getChildAt(0).getLayoutParams();
            if (checkParams.getTestedFirstPosition() != sd.firstPosition) {
                applyMinHeight = true;
                break;
            } else if (checkParams.isHeader) {
                i++;
            } else {
                applyMinHeight = false;
                break;
            }
        }
        int col = (anchorPosition - firstContentPosition) % this.mNumColumns;
        for (int i2 = 1; i2 < this.mNumColumns - col; i2++) {
            int j = 0;
            while (true) {
                if (j < this.mLayoutManager.getChildCount()) {
                    View child = this.mLayoutManager.getChildAt(j);
                    if (((LayoutManager.LayoutParams) child.getLayoutParams()).getTestedFirstPosition() == sd.firstPosition) {
                        if (this.mLayoutManager.getPosition(child) != anchorPosition + i2) {
                            j++;
                        } else {
                            this.mLayoutManager.detachAndScrapViewAt(j, state.recycler);
                            break;
                        }
                    }
                }
            }
        }
        int columnAnchorPosition = anchorPosition - col;
        int measuredPositionsMarker = -1;
        int sectionHeight = 0;
        int minHeightOffset = 0;
        if (applyMinHeight) {
            int i3 = columnAnchorPosition;
            while (i3 >= 0) {
                LayoutState.View check = state.getView(i3);
                state.cacheView(i3, check.view);
                if (check.getLayoutParams().getTestedFirstPosition() != sd.firstPosition) {
                    break;
                }
                int rowHeight = 0;
                for (int j2 = 0; j2 < this.mNumColumns && i3 + j2 <= anchorPosition; j2++) {
                    LayoutState.View measure = state.getView(i3 + j2);
                    state.cacheView(i3 + j2, measure.view);
                    LayoutManager.LayoutParams measureParams = measure.getLayoutParams();
                    if (measureParams.getTestedFirstPosition() != sd.firstPosition) {
                        break;
                    }
                    if (!measureParams.isHeader) {
                        measureChild(measure, sd);
                        rowHeight = Math.max(rowHeight, this.mLayoutManager.getDecoratedMeasuredHeight(measure.view));
                    }
                }
                sectionHeight += rowHeight;
                measuredPositionsMarker = i3;
                if (sectionHeight >= sd.minimumHeight) {
                    break;
                }
                i3 -= this.mNumColumns;
            }
            if (sectionHeight < sd.minimumHeight) {
                minHeightOffset = sectionHeight - sd.minimumHeight;
                markerLine += minHeightOffset;
            }
        }
        int i4 = columnAnchorPosition;
        while (i4 >= 0 && markerLine - minHeightOffset > leadingEdge) {
            LayoutState.View rowAnchor = state.getView(i4);
            state.cacheView(i4, rowAnchor.view);
            LayoutManager.LayoutParams params = rowAnchor.getLayoutParams();
            if (params.isHeader || params.getTestedFirstPosition() != sd.firstPosition) {
                break;
            }
            boolean measureRowItems = !applyMinHeight || i4 < measuredPositionsMarker;
            int rowHeight2 = fillRow(markerLine, i4, LayoutManager.Direction.START, measureRowItems, sd, state);
            markerLine -= rowHeight2;
            i4 -= this.mNumColumns;
        }
        return markerLine;
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public int finishFillToEnd(int leadingEdge, View anchor, SectionData sd, LayoutState state) {
        int anchorPosition = this.mLayoutManager.getPosition(anchor);
        int markerLine = getLowestEdge(sd.firstPosition, this.mLayoutManager.getChildCount() - 1, this.mLayoutManager.getDecoratedBottom(anchor));
        return fillToEnd(leadingEdge, markerLine, anchorPosition + 1, sd, state);
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public int finishFillToStart(int leadingEdge, View anchor, SectionData sd, LayoutState state) {
        int anchorPosition = this.mLayoutManager.getPosition(anchor);
        int markerLine = this.mLayoutManager.getDecoratedTop(anchor);
        return fillToStart(leadingEdge, markerLine, anchorPosition - 1, sd, state);
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public LayoutManager.LayoutParams generateLayoutParams(LayoutManager.LayoutParams params) {
        return LayoutParams.from((ViewGroup.LayoutParams) params);
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public LayoutManager.LayoutParams generateLayoutParams(Context c, AttributeSet attrs) {
        return new LayoutParams(c, attrs);
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public int getAnchorPosition(LayoutState state, SectionData sd, int position) {
        calculateColumnWidthValues(sd);
        int firstPosition = sd.firstPosition;
        LayoutState.View first = state.getView(firstPosition);
        if (first.getLayoutParams().isHeader) {
            firstPosition++;
        }
        state.cacheView(sd.firstPosition, first.view);
        return position - ((position - firstPosition) % this.mNumColumns);
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public int getLowestEdge(int sectionFirstPosition, int lastIndex, int defaultEdge) {
        int bottomMostEdge = 0;
        int leftPosition = this.mLayoutManager.getWidth();
        boolean foundItems = false;
        for (int i = lastIndex; i >= 0; i--) {
            View look = this.mLayoutManager.getChildAt(i);
            LayoutManager.LayoutParams params = (LayoutManager.LayoutParams) look.getLayoutParams();
            if (params.getTestedFirstPosition() != sectionFirstPosition) {
                break;
            }
            if (!params.isHeader) {
                if (look.getLeft() >= leftPosition) {
                    break;
                }
                leftPosition = look.getLeft();
                foundItems = true;
                bottomMostEdge = Math.max(bottomMostEdge, this.mLayoutManager.getDecoratedBottom(look));
            }
        }
        return foundItems ? bottomMostEdge : defaultEdge;
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    /* renamed from: init */
    public GridSLM mo444init(SectionData sd) {
        super.mo444init(sd);
        if (sd.headerParams instanceof LayoutParams) {
            LayoutParams params = (LayoutParams) sd.headerParams;
            int columnWidth = params.getColumnWidth();
            int numColumns = params.getNumColumns();
            if (columnWidth < 0 && numColumns < 0) {
                numColumns = 1;
            }
            if (numColumns == -1) {
                setColumnWidth(columnWidth);
            } else {
                setNumColumns(numColumns);
            }
        }
        calculateColumnWidthValues(sd);
        return this;
    }

    public int fillRow(int markerLine, int anchorPosition, LayoutManager.Direction direction, boolean measureRowItems, SectionData sd, LayoutState state) {
        int col;
        int position;
        int rowHeight = 0;
        LayoutState.View[] views = new LayoutState.View[this.mNumColumns];
        int i = 0;
        while (true) {
            if (i >= this.mNumColumns || (position = anchorPosition + i) >= state.getRecyclerState().getItemCount()) {
                break;
            }
            LayoutState.View view = state.getView(position);
            if (view.getLayoutParams().getTestedFirstPosition() != sd.firstPosition) {
                state.cacheView(position, view.view);
                break;
            }
            if (measureRowItems) {
                measureChild(view, sd);
            } else {
                state.decacheView(i + anchorPosition);
            }
            rowHeight = Math.max(rowHeight, this.mLayoutManager.getDecoratedMeasuredHeight(view.view));
            views[i] = view;
            i++;
        }
        boolean directionIsStart = direction == LayoutManager.Direction.START;
        if (directionIsStart) {
            markerLine -= rowHeight;
        }
        for (int i2 = 0; i2 < this.mNumColumns; i2++) {
            int selectedView = directionIsStart ? (this.mNumColumns - i2) - 1 : i2;
            if (state.isLTR) {
                col = directionIsStart ? (this.mNumColumns - i2) - 1 : i2;
            } else {
                col = directionIsStart ? i2 : (this.mNumColumns - i2) - 1;
            }
            if (views[selectedView] != null) {
                layoutChild(views[selectedView], markerLine, col, rowHeight, sd, state);
                addView(views[selectedView], selectedView + anchorPosition, direction, state);
            }
        }
        return rowHeight;
    }

    @Deprecated
    public void setColumnWidth(int minimumWidth) {
        this.mMinimumWidth = minimumWidth;
        this.mColumnsSpecified = false;
    }

    @Deprecated
    public void setNumColumns(int numColumns) {
        this.mNumColumns = numColumns;
        this.mMinimumWidth = 0;
        this.mColumnsSpecified = true;
    }

    private void calculateColumnWidthValues(SectionData sd) {
        int availableWidth = (this.mLayoutManager.getWidth() - sd.contentStart) - sd.contentEnd;
        if (!this.mColumnsSpecified) {
            if (this.mMinimumWidth <= 0) {
                this.mMinimumWidth = (int) TypedValue.applyDimension(1, 48.0f, this.mContext.getResources().getDisplayMetrics());
            }
            this.mNumColumns = availableWidth / Math.abs(this.mMinimumWidth);
        }
        if (this.mNumColumns < 1) {
            this.mNumColumns = 1;
        }
        this.mColumnWidth = availableWidth / this.mNumColumns;
        if (this.mColumnWidth == 0) {
            Log.e("GridSection", "Too many columns (" + this.mNumColumns + ") for available width" + availableWidth + ".");
        }
    }

    private void layoutChild(LayoutState.View child, int top, int col, int rowHeight, SectionData sd, LayoutState state) {
        int height;
        int width;
        if (child.getLayoutParams().height == -1) {
            height = rowHeight;
        } else {
            height = this.mLayoutManager.getDecoratedMeasuredHeight(child.view);
        }
        if (col == this.mNumColumns - 1) {
            width = this.mLayoutManager.getDecoratedMeasuredWidth(child.view);
        } else {
            width = Math.min(this.mColumnWidth, this.mLayoutManager.getDecoratedMeasuredWidth(child.view));
        }
        int bottom = top + height;
        int left = (state.isLTR ? sd.contentStart : sd.contentEnd) + (this.mColumnWidth * col);
        int right = left + width;
        this.mLayoutManager.layoutDecorated(child.view, left, top, right, bottom);
    }

    private void measureChild(LayoutState.View child, SectionData sd) {
        int widthOtherColumns = (this.mNumColumns - 1) * this.mColumnWidth;
        this.mLayoutManager.measureChildWithMargins(child.view, sd.marginStart + sd.marginEnd + widthOtherColumns, 0);
    }

    /* loaded from: classes.dex */
    public static class LayoutParams extends LayoutManager.LayoutParams {
        private int mColumnWidth;
        private int mNumColumns;

        public LayoutParams(int w, int h) {
            super(w, h);
        }

        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
            TypedArray a = c.obtainStyledAttributes(attrs, R.styleable.superslim_GridSLM);
            this.mNumColumns = a.getInt(1, -1);
            this.mColumnWidth = a.getDimensionPixelSize(0, -1);
            a.recycle();
        }

        @Deprecated
        public LayoutParams(ViewGroup.MarginLayoutParams other) {
            super(other);
            init(other);
        }

        @Deprecated
        public LayoutParams(ViewGroup.LayoutParams other) {
            super(other);
            init(other);
        }

        public static LayoutParams from(ViewGroup.LayoutParams other) {
            if (other == null) {
                Log.w("SuperSLiM", "Null value passed in call to GridSLM.LayoutParams.from().");
                return new LayoutParams(-2, -2);
            } else if (other instanceof ViewGroup.MarginLayoutParams) {
                return new LayoutParams((ViewGroup.MarginLayoutParams) other);
            } else {
                return new LayoutParams(other);
            }
        }

        public int getColumnWidth() {
            return this.mColumnWidth;
        }

        public void setColumnWidth(int columnWidth) {
            this.mColumnWidth = columnWidth;
        }

        public int getNumColumns() {
            return this.mNumColumns;
        }

        public void setNumColumns(int numColumns) {
            this.mNumColumns = numColumns;
        }

        private void init(ViewGroup.LayoutParams other) {
            if (other instanceof LayoutParams) {
                LayoutParams lp = (LayoutParams) other;
                this.mNumColumns = lp.mNumColumns;
                this.mColumnWidth = lp.mColumnWidth;
                return;
            }
            this.mNumColumns = -1;
            this.mColumnWidth = -1;
        }
    }
}
