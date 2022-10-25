package com.vk.attachpicker.widget;

import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import com.vk.attachpicker.adapter.PhotoSmallAdapter;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class GalleryRecyclerView extends RecyclerView {
    private int columnWidthResId;
    private int dividerSize;
    private RecyclerView.ItemDecoration itemDecoration;

    public GalleryRecyclerView(Context context) {
        super(context);
        this.dividerSize = Screen.dp(4);
        this.columnWidthResId = R.dimen.picker_item_size_image;
    }

    public GalleryRecyclerView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        this.dividerSize = Screen.dp(4);
        this.columnWidthResId = R.dimen.picker_item_size_image;
    }

    public GalleryRecyclerView(Context context, @Nullable AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.dividerSize = Screen.dp(4);
        this.columnWidthResId = R.dimen.picker_item_size_image;
    }

    public int getColumnWidthResId() {
        return this.columnWidthResId;
    }

    public void setColumnWidthResId(int columnWidthResId) {
        this.columnWidthResId = columnWidthResId;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.RecyclerView, android.view.View
    public void onMeasure(int widthSpec, int heightSpec) {
        super.onMeasure(widthSpec, heightSpec);
        int columnWidth = (int) getResources().getDimension(this.columnWidthResId);
        if (columnWidth > 0 && getLayoutManager() != null && (getLayoutManager() instanceof GridLayoutManager)) {
            final int spanCount = Math.max(1, getMeasuredWidth() / columnWidth);
            ((GridLayoutManager) getLayoutManager()).setSpanCount(spanCount);
            checkItemDecoration();
            ((GridLayoutManager) getLayoutManager()).setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() { // from class: com.vk.attachpicker.widget.GalleryRecyclerView.1
                @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
                public int getSpanSize(int position) {
                    PhotoSmallAdapter adapter = (PhotoSmallAdapter) GalleryRecyclerView.this.mo1204getAdapter();
                    if ((adapter.isCameraEnabled() || adapter.isEmptyEnabled()) && position == 0) {
                        return spanCount;
                    }
                    return 1;
                }
            });
        }
    }

    private void checkItemDecoration() {
        if (mo1204getAdapter() != null && getLayoutManager() != null && (getLayoutManager() instanceof GridLayoutManager)) {
            RecyclerView.ItemDecoration newItemDecoration = new GridItemDecoration(this.dividerSize, ((GridLayoutManager) getLayoutManager()).getSpanCount(), ((PhotoSmallAdapter) mo1204getAdapter()).delta(), 0, false);
            setItemDecorator(newItemDecoration);
        }
    }

    private void setItemDecorator(RecyclerView.ItemDecoration newItemDecorator) {
        if (this.itemDecoration != null) {
            removeItemDecoration(this.itemDecoration);
            this.itemDecoration = null;
        }
        if (newItemDecorator != null) {
            this.itemDecoration = newItemDecorator;
            addItemDecoration(this.itemDecoration);
        }
    }
}
