package com.my.target.nativeads.views;

import android.content.Context;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
/* loaded from: classes2.dex */
public class CardRecyclerLayoutManager extends LinearLayoutManager {
    protected static final float MINIMIZE_COEFFICIENT = 0.75f;
    private static final int MIN_SCROLL_VELOCITY = 1000;

    public boolean isViewActive(View view) {
        return findViewByPosition(findFirstCompletelyVisibleItemPosition()) == view;
    }

    public CardRecyclerLayoutManager(Context context) {
        super(context, 0, false);
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public void measureChildWithMargins(View view, int i, int i2) {
        RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) view.getLayoutParams();
        view.measure(getChildMeasureSpec((int) (getWidth() * 0.75f), getWidthMode(), getPaddingLeft() + getPaddingRight() + layoutParams.leftMargin + layoutParams.rightMargin + i, layoutParams.width, canScrollHorizontally()), getChildMeasureSpec(getHeight(), getHeightMode(), getPaddingTop() + getPaddingBottom() + layoutParams.topMargin + layoutParams.bottomMargin + i2, layoutParams.height, canScrollVertically()));
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
