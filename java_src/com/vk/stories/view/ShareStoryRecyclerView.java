package com.vk.stories.view;

import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v7.widget.GridLayoutManager;
import android.util.AttributeSet;
import com.vk.core.util.Screen;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class ShareStoryRecyclerView extends UsableRecyclerView {
    public ShareStoryRecyclerView(Context context) {
        super(context);
    }

    public ShareStoryRecyclerView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public ShareStoryRecyclerView(Context context, @Nullable AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.RecyclerView, android.view.View
    public void onMeasure(int widthSpec, int heightSpec) {
        super.onMeasure(widthSpec, heightSpec);
        final int spanCount = Math.max(1, getColumnsCount());
        if (getLayoutManager() != null) {
            GridLayoutManager lm = (GridLayoutManager) getLayoutManager();
            lm.setSpanCount(spanCount);
            lm.setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() { // from class: com.vk.stories.view.ShareStoryRecyclerView.1
                @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
                public int getSpanSize(int position) {
                    if (position == 0) {
                        return spanCount;
                    }
                    return 1;
                }
            });
        }
    }

    protected int getColumnsCount() {
        int columnWidth;
        int srcW = getResources().getConfiguration().screenWidthDp;
        boolean isTablet = Screen.isTablet(getContext());
        int listWidth = Screen.width();
        if (srcW >= 600) {
            columnWidth = isTablet ? V.dp(160.0f) : V.dp(270.0f);
        } else {
            columnWidth = listWidth;
        }
        return listWidth / columnWidth;
    }
}
