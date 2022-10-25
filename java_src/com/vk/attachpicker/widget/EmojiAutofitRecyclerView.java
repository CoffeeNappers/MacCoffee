package com.vk.attachpicker.widget;

import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class EmojiAutofitRecyclerView extends RecyclerView {
    public EmojiAutofitRecyclerView(Context context) {
        super(context);
    }

    public EmojiAutofitRecyclerView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public EmojiAutofitRecyclerView(Context context, @Nullable AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.RecyclerView, android.view.View
    public void onMeasure(int widthSpec, int heightSpec) {
        super.onMeasure(widthSpec, heightSpec);
        int columnWidth = (int) getResources().getDimension(R.dimen.picker_emoji_size);
        if (columnWidth > 0 && getLayoutManager() != null && (getLayoutManager() instanceof GridLayoutManager)) {
            int spanCount = Math.max(1, getMeasuredWidth() / columnWidth);
            ((GridLayoutManager) getLayoutManager()).setSpanCount(spanCount);
        }
    }
}
