package com.vkontakte.android.ui.recyclerview;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.util.SparseIntArray;
import android.view.View;
/* loaded from: classes3.dex */
class RecyclerViewUtils {
    RecyclerViewUtils() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getRealFirstPosition(@NonNull RecyclerView recyclerView) {
        int firstVisiblePosition = Integer.MAX_VALUE;
        int visibleRange = recyclerView.getChildCount();
        for (int i = 0; i < visibleRange; i++) {
            View firstVisibleView = recyclerView.getChildAt(i);
            firstVisiblePosition = Math.min(recyclerView.getChildAdapterPosition(firstVisibleView), firstVisiblePosition);
        }
        return firstVisiblePosition;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int mapAdapterToChildPositions(@NonNull RecyclerView recyclerView, @NonNull SparseIntArray outputMap, int adapterStart) {
        int end = 0;
        outputMap.clear();
        int childCount = recyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View child = recyclerView.getChildAt(i);
            int adapterPosition = recyclerView.getChildAdapterPosition(child);
            end = Math.max(end, adapterPosition);
            outputMap.put(adapterPosition, i);
        }
        return end;
    }
}
