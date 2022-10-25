package com.vk.attachpicker.util;

import android.content.Context;
import android.graphics.PointF;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.LinearSmoothScroller;
import android.support.v7.widget.RecyclerView;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import com.vkontakte.android.R;
import java.lang.reflect.Field;
/* loaded from: classes2.dex */
public class LocationPickerLayoutManager extends LinearLayoutManager {
    private static final float MILLISECONDS_PER_INCH = 100.0f;
    private final Context context;
    private boolean expanded;
    private RecyclerView recyclerView;

    public LocationPickerLayoutManager(Context context) {
        super(context);
        this.context = context;
    }

    public LocationPickerLayoutManager(Context context, int orientation, boolean reverseLayout) {
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

    public boolean isExpanded() {
        return this.expanded;
    }

    public void setExpanded(boolean expanded) {
        this.expanded = expanded;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getCollapsedMapHeight() {
        return (int) this.context.getResources().getDimension(R.dimen.picker_collapsed_map_height);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getExpandedMapHeight() {
        return (int) this.context.getResources().getDimension(R.dimen.expanded_map_height);
    }

    /* loaded from: classes2.dex */
    private class VkLinearSmoothScroller extends LinearSmoothScroller {
        @Override // android.support.v7.widget.LinearSmoothScroller
        public int calculateDyToMakeVisible(View view, int snapPreference) {
            int res = super.calculateDyToMakeVisible(view, snapPreference);
            int appendDelta = LocationPickerLayoutManager.this.expanded ? 0 : LocationPickerLayoutManager.this.getCollapsedMapHeight() - LocationPickerLayoutManager.this.getExpandedMapHeight();
            if (res == 0) {
                if (view.getY() >= appendDelta) {
                    if ((LocationPickerLayoutManager.this.recyclerView.getHeight() - view.getY()) - view.getHeight() < appendDelta) {
                        return (int) (((LocationPickerLayoutManager.this.recyclerView.getHeight() - view.getY()) - view.getHeight()) - appendDelta);
                    }
                    return appendDelta;
                }
                return (int) (appendDelta - view.getY());
            } else if (res < 0) {
                return res - appendDelta;
            } else {
                if (res <= 0) {
                    return 0;
                }
                return appendDelta + res;
            }
        }

        public VkLinearSmoothScroller(Context context) {
            super(context);
            updateDecelerateInterpolation();
        }

        @Override // android.support.v7.widget.LinearSmoothScroller
        public PointF computeScrollVectorForPosition(int targetPosition) {
            return LocationPickerLayoutManager.this.computeScrollVectorForPosition(targetPosition);
        }

        @Override // android.support.v7.widget.LinearSmoothScroller
        protected float calculateSpeedPerPixel(DisplayMetrics displayMetrics) {
            return LocationPickerLayoutManager.MILLISECONDS_PER_INCH / displayMetrics.densityDpi;
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
