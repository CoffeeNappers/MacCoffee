package com.vk.attachpicker.stickers;

import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class StickersRecyclerView extends RecyclerView {
    public StickersRecyclerView(Context context) {
        super(context);
    }

    public StickersRecyclerView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public StickersRecyclerView(Context context, @Nullable AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.RecyclerView, android.view.View
    public void onMeasure(int widthSpec, int heightSpec) {
        super.onMeasure(widthSpec, heightSpec);
        int columnWidth = (int) getResources().getDimension(R.dimen.picker_sticker_size);
        int spanCount = Math.max(3, getMeasuredWidth() / columnWidth);
        if (getLayoutManager() != null) {
            GridLayoutManager lm = (GridLayoutManager) getLayoutManager();
            lm.setSpanCount(spanCount);
        }
    }
}
