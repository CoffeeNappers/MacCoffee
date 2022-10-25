package com.vkontakte.android.ui.recyclerview;

import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.view.View;
/* loaded from: classes3.dex */
public class FitGridItemDecoration extends RecyclerView.ItemDecoration {
    private int mSpacing;
    private int mSpanCount;

    public FitGridItemDecoration set(int spanCount, int spacing) {
        this.mSpanCount = spanCount;
        this.mSpacing = spacing;
        return this;
    }

    @Override // android.support.v7.widget.RecyclerView.ItemDecoration
    public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
        if (this.mSpanCount != 0) {
            int position = parent.getChildAdapterPosition(view);
            int column = position % this.mSpanCount;
            outRect.left = (this.mSpacing * column) / this.mSpanCount;
            outRect.right = this.mSpacing - (((column + 1) * this.mSpacing) / this.mSpanCount);
        }
    }
}
