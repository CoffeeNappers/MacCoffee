package com.vkontakte.android.ui.recyclerview;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.support.annotation.ColorInt;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.view.View;
/* loaded from: classes3.dex */
public class BottomDividerDecoration extends RecyclerView.ItemDecoration {
    private final Paint mLinePaint = new Paint();
    private final int mLineWidth;
    private int mPaddingLeft;
    private int mPaddingRight;
    private final Provider mProvider;
    private final int mSpacing;

    /* loaded from: classes3.dex */
    public interface Provider {
        boolean drawAfter(int i);
    }

    public BottomDividerDecoration(@Nullable Provider provider, int lineWidth, @ColorInt int color, int spacing) {
        this.mLinePaint.setColor(color);
        this.mLineWidth = lineWidth;
        this.mSpacing = spacing;
        this.mProvider = provider;
    }

    public BottomDividerDecoration setPadding(int left, int right) {
        this.mPaddingLeft = left;
        this.mPaddingRight = right;
        return this;
    }

    public int getPaddingLeft() {
        return this.mPaddingLeft;
    }

    public int getPaddingRight() {
        return this.mPaddingRight;
    }

    @Override // android.support.v7.widget.RecyclerView.ItemDecoration
    public void onDrawOver(Canvas c, RecyclerView parent, RecyclerView.State state) {
        int drawPosition = 0;
        boolean foundStart = false;
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            if (this.mProvider != null) {
                int position = parent.getChildAdapterPosition(child);
                if (this.mProvider.drawAfter(position)) {
                    if (!foundStart) {
                        foundStart = true;
                        drawPosition = child.getBottom() + this.mSpacing;
                    }
                } else if (foundStart) {
                    foundStart = false;
                    c.drawRect(parent.getLeft() + this.mPaddingLeft, drawPosition, parent.getRight() - this.mPaddingRight, this.mLineWidth + drawPosition, this.mLinePaint);
                }
            } else if (parent.getChildAdapterPosition(child) < parent.mo1204getAdapter().getItemCount() - 1) {
                drawPosition = child.getBottom() + this.mSpacing;
                c.drawRect(parent.getLeft() + this.mPaddingLeft, drawPosition, parent.getRight() - this.mPaddingRight, this.mLineWidth + drawPosition, this.mLinePaint);
            }
        }
    }

    @Override // android.support.v7.widget.RecyclerView.ItemDecoration
    public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
        int position = parent.getChildAdapterPosition(view);
        if (this.mProvider == null || this.mProvider.drawAfter(position)) {
            outRect.bottom += this.mSpacing;
        }
    }
}
