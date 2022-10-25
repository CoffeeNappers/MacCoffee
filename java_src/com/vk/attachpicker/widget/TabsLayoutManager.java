package com.vk.attachpicker.widget;

import android.content.Context;
import android.graphics.PointF;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.LinearSmoothScroller;
import android.support.v7.widget.RecyclerView;
import android.util.DisplayMetrics;
import android.view.animation.DecelerateInterpolator;
import java.lang.reflect.Field;
/* loaded from: classes2.dex */
public class TabsLayoutManager extends LinearLayoutManager {
    private static final float MILLISECONDS_PER_INCH = 150.0f;
    private final Context context;
    private RecyclerView recyclerView;

    public TabsLayoutManager(Context context) {
        super(context);
        this.context = context;
    }

    public TabsLayoutManager(Context context, int orientation, boolean reverseLayout) {
        super(context, orientation, reverseLayout);
        this.context = context;
    }

    @Override // android.support.v7.widget.LinearLayoutManager, android.support.v7.widget.RecyclerView.LayoutManager
    public void smoothScrollToPosition(RecyclerView recyclerView, RecyclerView.State state, int position) {
        this.recyclerView = recyclerView;
        VkLinearSmoothScroller linearSmoothScroller = new VkLinearSmoothScroller(this.context);
        linearSmoothScroller.setTargetPosition(position);
        startSmoothScroll(linearSmoothScroller);
    }

    /* loaded from: classes2.dex */
    private class VkLinearSmoothScroller extends LinearSmoothScroller {
        public VkLinearSmoothScroller(Context context) {
            super(context);
            updateDecelerateInterpolation();
        }

        @Override // android.support.v7.widget.LinearSmoothScroller
        public PointF computeScrollVectorForPosition(int targetPosition) {
            return TabsLayoutManager.this.computeScrollVectorForPosition(targetPosition);
        }

        @Override // android.support.v7.widget.LinearSmoothScroller
        protected float calculateSpeedPerPixel(DisplayMetrics displayMetrics) {
            return TabsLayoutManager.MILLISECONDS_PER_INCH / displayMetrics.densityDpi;
        }

        private void updateDecelerateInterpolation() {
            try {
                Field f = LinearSmoothScroller.class.getDeclaredField("mDecelerateInterpolator");
                f.setAccessible(true);
                f.set(this, new DecelerateInterpolator(3.0f));
            } catch (Exception e) {
            }
        }
    }
}
