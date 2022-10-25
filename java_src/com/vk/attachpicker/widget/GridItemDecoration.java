package com.vk.attachpicker.widget;

import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.view.View;
/* loaded from: classes2.dex */
public class GridItemDecoration extends RecyclerView.ItemDecoration {
    private final int mFooterCount;
    private final int mGridSize;
    private final int mHeaderCount;
    private final boolean mIncludeEdge;
    private final int mSpacing;

    public GridItemDecoration(int gridSpacingPx, int gridSize, int headerCount, int footerCount, boolean includeEdge) {
        int realSpacing = gridSpacingPx;
        while (realSpacing % gridSize != 0 && realSpacing > 0) {
            realSpacing--;
        }
        if (realSpacing <= 0) {
            realSpacing = 1;
            while (realSpacing % gridSize != 0) {
                realSpacing++;
            }
        }
        this.mSpacing = realSpacing;
        this.mGridSize = gridSize;
        this.mHeaderCount = headerCount;
        this.mFooterCount = footerCount;
        this.mIncludeEdge = includeEdge;
    }

    @Override // android.support.v7.widget.RecyclerView.ItemDecoration
    public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
        int realItemPosition = parent.getChildAdapterPosition(view);
        if (realItemPosition < this.mHeaderCount) {
            outRect.set(0, 0, 0, 0);
            return;
        }
        int itemPosition = realItemPosition - this.mHeaderCount;
        int column = itemPosition % this.mGridSize;
        if (this.mIncludeEdge) {
            outRect.left = this.mSpacing - ((this.mSpacing * column) / this.mGridSize);
            outRect.right = ((column + 1) * this.mSpacing) / this.mGridSize;
            if (itemPosition < this.mGridSize) {
                outRect.top = this.mSpacing;
            }
            outRect.bottom = this.mSpacing;
            return;
        }
        outRect.left = (this.mSpacing * column) / this.mGridSize;
        outRect.right = this.mSpacing - (((column + 1) * this.mSpacing) / this.mGridSize);
        if (itemPosition >= this.mGridSize) {
            outRect.top = this.mSpacing;
        }
    }
}
