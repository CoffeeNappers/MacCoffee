package com.vk.lists;

import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
/* loaded from: classes2.dex */
class PaginationUtil {
    PaginationUtil() {
    }

    public static int getLastVisiblePosition(RecyclerView recyclerView) {
        RecyclerView.LayoutManager lm = recyclerView.getLayoutManager();
        if (lm == null || (lm.getClass() != LinearLayoutManager.class && !(lm instanceof LinearLayoutManager))) {
            return -1;
        }
        return ((LinearLayoutManager) lm).findLastVisibleItemPosition();
    }

    public static int getFirstVisiblePosition(RecyclerView recyclerView) {
        RecyclerView.LayoutManager lm = recyclerView.getLayoutManager();
        if (lm == null || (lm.getClass() != LinearLayoutManager.class && !(lm instanceof LinearLayoutManager))) {
            return -1;
        }
        return ((LinearLayoutManager) lm).findFirstVisibleItemPosition();
    }
}
