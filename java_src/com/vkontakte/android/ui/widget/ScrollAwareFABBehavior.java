package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.design.widget.CoordinatorLayout;
import android.support.design.widget.FloatingActionButton;
import android.util.AttributeSet;
import android.view.View;
/* loaded from: classes3.dex */
public class ScrollAwareFABBehavior extends FloatingActionButton.Behavior {
    public ScrollAwareFABBehavior() {
    }

    public ScrollAwareFABBehavior(Context context, AttributeSet attrs) {
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onStartNestedScroll(CoordinatorLayout coordinatorLayout, FloatingActionButton child, View directTargetChild, View target, int nestedScrollAxes) {
        return nestedScrollAxes == 2 || super.onStartNestedScroll(coordinatorLayout, (CoordinatorLayout) child, directTargetChild, target, nestedScrollAxes);
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public void onNestedScroll(CoordinatorLayout coordinatorLayout, FloatingActionButton child, View target, int dxConsumed, int dyConsumed, int dxUnconsumed, int dyUnconsumed) {
        super.onNestedScroll(coordinatorLayout, (CoordinatorLayout) child, target, dxConsumed, dyConsumed, dxUnconsumed, dyUnconsumed);
        if (dyConsumed > 0 && child.getVisibility() == 0) {
            child.hide(new FloatingActionButton.OnVisibilityChangedListener() { // from class: com.vkontakte.android.ui.widget.ScrollAwareFABBehavior.1
                @Override // android.support.design.widget.FloatingActionButton.OnVisibilityChangedListener
                public void onHidden(FloatingActionButton fab) {
                    fab.setVisibility(4);
                }
            });
        } else if (dyConsumed < 0 && child.getVisibility() != 0) {
            child.show();
        }
    }
}
