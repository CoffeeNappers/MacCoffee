package com.my.target.core.ui.views.fsslider;

import android.content.Context;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import com.my.target.core.utils.l;
/* loaded from: classes2.dex */
public class FSCardRecyclerLayoutManager extends LinearLayoutManager {
    public static final float EAR_PROPORTION = 0.125f;
    private static final int MIN_SCROLL_VELOCITY = 1000;
    private final int minimalMargin;
    private int pictureHeight;
    private int pictureWidth;

    public boolean isViewActive(View view) {
        return findViewByPosition(findFirstCompletelyVisibleItemPosition()) == view;
    }

    public int getOffsetToCenterView() {
        return (((getWidth() + getPaddingRight()) + getPaddingLeft()) - findViewByPosition(findFirstVisibleItemPosition()).getWidth()) / 2;
    }

    public void setFirstCardDimensions(int i, int i2) {
        this.pictureWidth = i;
        this.pictureHeight = i2;
    }

    public FSCardRecyclerLayoutManager(Context context) {
        super(context, 0, false);
        this.minimalMargin = new l(context).a(16);
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public void measureChildWithMargins(View view, int i, int i2) {
        int width;
        RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) view.getLayoutParams();
        int width2 = getWidth();
        int height = getHeight();
        int i3 = 0;
        if (height != 0 && width2 != 0 && this.pictureHeight != 0 && this.pictureWidth != 0) {
            if (width2 / height > this.pictureWidth / this.pictureHeight) {
                width = ((int) ((this.pictureWidth * height) / this.pictureHeight)) - this.minimalMargin;
                i3 = ((int) (width2 - ((width2 * 0.125f) + ((width2 + width) / 2)))) / 2;
            } else {
                width = (((int) (getWidth() / 1.125f)) - getPaddingRight()) - getPaddingLeft();
            }
            if (getItemViewType(view) == 1) {
                layoutParams.leftMargin = (int) ((((getWidth() - getPaddingLeft()) - getPaddingRight()) - width) / 2.0f);
                layoutParams.rightMargin = i3;
            } else if (getItemViewType(view) == 2) {
                layoutParams.rightMargin = (int) ((((getWidth() - getPaddingLeft()) - getPaddingRight()) - width) / 2.0f);
                layoutParams.leftMargin = i3;
            } else {
                layoutParams.leftMargin = i3;
                layoutParams.rightMargin = i3;
            }
            view.measure(getChildMeasureSpec(getWidth(), getWidthMode(), getPaddingLeft() + getPaddingRight() + layoutParams.leftMargin + layoutParams.rightMargin + i, width, canScrollHorizontally()), getChildMeasureSpec(getHeight(), getHeightMode(), getPaddingTop() + getPaddingBottom() + layoutParams.topMargin + layoutParams.bottomMargin + i2, layoutParams.height, canScrollVertically()));
        }
    }

    @Override // android.support.v7.widget.LinearLayoutManager
    public void scrollToPositionWithOffset(int i, int i2) {
        super.scrollToPositionWithOffset(i, i2);
    }

    @Override // android.support.v7.widget.LinearLayoutManager, android.support.v7.widget.RecyclerView.LayoutManager
    public void scrollToPosition(int i) {
        super.scrollToPosition(i);
    }

    public int calculateScrollDistanceOnClick(View view) {
        View findViewByPosition = findViewByPosition(findLastVisibleItemPosition());
        View findViewByPosition2 = findViewByPosition(findFirstVisibleItemPosition());
        int width = ((getWidth() - findViewByPosition2.getWidth()) / 2) + findViewByPosition2.getWidth();
        int left = findViewByPosition.getLeft();
        int right = findViewByPosition2.getRight();
        int width2 = left - ((getWidth() - findViewByPosition.getWidth()) / 2);
        int i = width - right;
        if (view != findViewByPosition) {
            return -i;
        }
        return width2;
    }

    public int calculateScrollDistanceOnFling(int i) {
        int width = getWidth();
        View findViewByPosition = findViewByPosition(findLastVisibleItemPosition());
        View findViewByPosition2 = findViewByPosition(findFirstVisibleItemPosition());
        int width2 = ((width - findViewByPosition2.getWidth()) / 2) + findViewByPosition2.getWidth();
        int left = findViewByPosition.getLeft();
        int right = findViewByPosition2.getRight();
        int width3 = left - ((width - findViewByPosition.getWidth()) / 2);
        int i2 = width2 - right;
        if (Math.abs(i) < 1000) {
            if (left <= width / 2 && (right < width / 2 || i <= 0)) {
                return width3;
            }
        } else if (i > 0) {
            return width3;
        }
        return -i2;
    }
}
