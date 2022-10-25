package com.tonicartos.superslim;

import android.view.View;
import com.tonicartos.superslim.LayoutManager;
import com.tonicartos.superslim.LayoutState;
/* loaded from: classes.dex */
public class LinearSLM extends SectionLayoutManager {
    public static int ID = 1;

    public LinearSLM(LayoutManager layoutManager) {
        super(layoutManager);
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public int computeHeaderOffset(int firstVisiblePosition, SectionData sd, LayoutState state) {
        int areaAbove = 0;
        for (int position = sd.firstPosition + 1; areaAbove < sd.headerHeight && position < firstVisiblePosition; position++) {
            LayoutState.View child = state.getView(position);
            measureChild(child, sd);
            areaAbove += this.mLayoutManager.getDecoratedMeasuredHeight(child.view);
            state.cacheView(position, child.view);
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
        int itemCount = state.getRecyclerState().getItemCount();
        int i = anchorPosition;
        while (true) {
            if (i >= itemCount || markerLine >= leadingEdge) {
                break;
            }
            LayoutState.View next = state.getView(i);
            LayoutManager.LayoutParams params = next.getLayoutParams();
            if (params.getTestedFirstPosition() != sd.firstPosition) {
                state.cacheView(i, next.view);
                break;
            }
            measureChild(next, sd);
            markerLine = layoutChild(next, markerLine, LayoutManager.Direction.END, sd, state);
            addView(next, i, LayoutManager.Direction.END, state);
            i++;
        }
        return markerLine;
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public int fillToStart(int leadingEdge, int markerLine, int anchorPosition, SectionData sd, LayoutState state) {
        boolean applyMinHeight = false;
        int i = 0;
        while (true) {
            if (i >= state.getRecyclerState().getItemCount()) {
                break;
            }
            View check = this.mLayoutManager.getChildAt(0);
            if (check == null) {
                applyMinHeight = false;
                break;
            }
            LayoutManager.LayoutParams checkParams = (LayoutManager.LayoutParams) check.getLayoutParams();
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
        int measuredPositionsMarker = -1;
        int sectionHeight = 0;
        int minHeightOffset = 0;
        if (applyMinHeight) {
            for (int i2 = anchorPosition; i2 >= 0; i2--) {
                LayoutState.View measure = state.getView(i2);
                state.cacheView(i2, measure.view);
                LayoutManager.LayoutParams params = measure.getLayoutParams();
                if (params.getTestedFirstPosition() != sd.firstPosition) {
                    break;
                }
                if (!params.isHeader) {
                    measureChild(measure, sd);
                    sectionHeight += this.mLayoutManager.getDecoratedMeasuredHeight(measure.view);
                    measuredPositionsMarker = i2;
                    if (sectionHeight >= sd.minimumHeight) {
                        break;
                    }
                }
            }
            if (sectionHeight < sd.minimumHeight) {
                minHeightOffset = sectionHeight - sd.minimumHeight;
                markerLine += minHeightOffset;
            }
        }
        int i3 = anchorPosition;
        while (true) {
            if (i3 < 0 || markerLine - minHeightOffset <= leadingEdge) {
                break;
            }
            LayoutState.View next = state.getView(i3);
            LayoutManager.LayoutParams params2 = next.getLayoutParams();
            if (params2.isHeader) {
                state.cacheView(i3, next.view);
                break;
            } else if (params2.getTestedFirstPosition() != sd.firstPosition) {
                state.cacheView(i3, next.view);
                break;
            } else {
                if (!applyMinHeight || i3 < measuredPositionsMarker) {
                    measureChild(next, sd);
                } else {
                    state.decacheView(i3);
                }
                markerLine = layoutChild(next, markerLine, LayoutManager.Direction.START, sd, state);
                addView(next, i3, LayoutManager.Direction.START, state);
                i3--;
            }
        }
        return markerLine;
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public int finishFillToEnd(int leadingEdge, View anchor, SectionData sd, LayoutState state) {
        int anchorPosition = this.mLayoutManager.getPosition(anchor);
        int markerLine = this.mLayoutManager.getDecoratedBottom(anchor);
        return fillToEnd(leadingEdge, markerLine, anchorPosition + 1, sd, state);
    }

    @Override // com.tonicartos.superslim.SectionLayoutManager
    public int finishFillToStart(int leadingEdge, View anchor, SectionData sd, LayoutState state) {
        int anchorPosition = this.mLayoutManager.getPosition(anchor);
        int markerLine = this.mLayoutManager.getDecoratedTop(anchor);
        return fillToStart(leadingEdge, markerLine, anchorPosition - 1, sd, state);
    }

    private int layoutChild(LayoutState.View child, int markerLine, LayoutManager.Direction direction, SectionData sd, LayoutState state) {
        int bottom;
        int top;
        int height = this.mLayoutManager.getDecoratedMeasuredHeight(child.view);
        int width = this.mLayoutManager.getDecoratedMeasuredWidth(child.view);
        int left = state.isLTR ? sd.contentStart : sd.contentEnd;
        int right = left + width;
        if (direction == LayoutManager.Direction.END) {
            top = markerLine;
            bottom = top + height;
        } else {
            bottom = markerLine;
            top = bottom - height;
        }
        this.mLayoutManager.layoutDecorated(child.view, left, top, right, bottom);
        if (direction == LayoutManager.Direction.END) {
            return this.mLayoutManager.getDecoratedBottom(child.view);
        }
        return this.mLayoutManager.getDecoratedTop(child.view);
    }

    private void measureChild(LayoutState.View child, SectionData sd) {
        this.mLayoutManager.measureChildWithMargins(child.view, sd.getTotalMarginWidth(), 0);
    }
}
