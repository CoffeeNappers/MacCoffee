package me.grishka.appkit.views;

import android.content.Context;
import android.support.v4.view.ViewCompat;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ScrollView;
/* loaded from: classes3.dex */
public class RecursiveSwipeRefreshLayout extends SwipeRefreshLayout implements SwipeRefreshLayoutI {
    public RecursiveSwipeRefreshLayout(Context context) {
        super(context);
    }

    public RecursiveSwipeRefreshLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout
    public boolean canChildScrollUp() {
        return findScrollableChild(this);
    }

    private boolean findScrollableChild(ViewGroup vg) {
        for (int i = 0; i < vg.getChildCount(); i++) {
            View child = vg.getChildAt(i);
            if ((child instanceof AdapterView) || (child instanceof ScrollView) || (child instanceof RecyclerView)) {
                return ViewCompat.canScrollVertically(child, -1);
            }
            if (child instanceof ViewGroup) {
                return findScrollableChild((ViewGroup) child);
            }
        }
        return false;
    }

    @Override // me.grishka.appkit.views.SwipeRefreshLayoutI
    public void setReversed(boolean mIsReversed) {
    }

    @Override // me.grishka.appkit.views.SwipeRefreshLayoutI
    public boolean isReversed() {
        return false;
    }
}
