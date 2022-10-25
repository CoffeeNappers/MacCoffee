package com.vkontakte.android.ui.recyclerview;

import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.view.View;
/* loaded from: classes3.dex */
public class SpaceItemDecoration extends RecyclerView.ItemDecoration {
    private int mBottom;
    private int mLeft;
    private int mRight;
    private int mTop;

    public SpaceItemDecoration() {
    }

    public SpaceItemDecoration(int left, int top, int right, int bottom) {
        set(left, top, right, bottom);
    }

    public void set(int left, int top, int right, int bottom) {
        this.mLeft = left;
        this.mTop = top;
        this.mRight = right;
        this.mBottom = bottom;
    }

    @Override // android.support.v7.widget.RecyclerView.ItemDecoration
    public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
        outRect.left = this.mLeft;
        outRect.top = this.mTop;
        outRect.right = this.mRight;
        outRect.bottom = this.mBottom;
    }
}
