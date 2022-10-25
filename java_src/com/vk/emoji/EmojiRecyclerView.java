package com.vk.emoji;

import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
/* loaded from: classes2.dex */
final class EmojiRecyclerView extends RecyclerView {
    private HeaderInfoProvider headerInfoProvider;
    private OnSpanCountChangeListener onSpanCountChangeListener;
    private int spanCount;
    private final GridLayoutManager.SpanSizeLookup spanSizeLookup;

    /* loaded from: classes2.dex */
    public interface HeaderInfoProvider {
        boolean isHeader(int i);
    }

    /* loaded from: classes2.dex */
    public interface OnSpanCountChangeListener {
        void onSpanCountChanged(int i);
    }

    public EmojiRecyclerView(Context context) {
        super(context);
        this.spanSizeLookup = new GridLayoutManager.SpanSizeLookup() { // from class: com.vk.emoji.EmojiRecyclerView.1
            @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
            public int getSpanSize(int position) {
                if (EmojiRecyclerView.this.headerInfoProvider.isHeader(position)) {
                    return EmojiRecyclerView.this.spanCount;
                }
                return 1;
            }
        };
        this.spanCount = 1;
    }

    public EmojiRecyclerView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        this.spanSizeLookup = new GridLayoutManager.SpanSizeLookup() { // from class: com.vk.emoji.EmojiRecyclerView.1
            @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
            public int getSpanSize(int position) {
                if (EmojiRecyclerView.this.headerInfoProvider.isHeader(position)) {
                    return EmojiRecyclerView.this.spanCount;
                }
                return 1;
            }
        };
        this.spanCount = 1;
    }

    public EmojiRecyclerView(Context context, @Nullable AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.spanSizeLookup = new GridLayoutManager.SpanSizeLookup() { // from class: com.vk.emoji.EmojiRecyclerView.1
            @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
            public int getSpanSize(int position) {
                if (EmojiRecyclerView.this.headerInfoProvider.isHeader(position)) {
                    return EmojiRecyclerView.this.spanCount;
                }
                return 1;
            }
        };
        this.spanCount = 1;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.RecyclerView, android.view.View
    public void onMeasure(int widthSpec, int heightSpec) {
        super.onMeasure(widthSpec, heightSpec);
        int columnWidth = (int) getResources().getDimension(R.dimen.emoji_keyboard_item_width);
        if (columnWidth > 0 && getLayoutManager() != null && (getLayoutManager() instanceof GridLayoutManager)) {
            int newSpanCount = Math.max(1, getMeasuredWidth() / columnWidth);
            if (newSpanCount != this.spanCount) {
                this.spanCount = newSpanCount;
                if (this.onSpanCountChangeListener != null) {
                    this.onSpanCountChangeListener.onSpanCountChanged(this.spanCount);
                }
                ((GridLayoutManager) getLayoutManager()).setSpanCount(this.spanCount);
            }
            ((GridLayoutManager) getLayoutManager()).setSpanSizeLookup(this.spanSizeLookup);
        }
    }

    public HeaderInfoProvider getHeaderInfoProvider() {
        return this.headerInfoProvider;
    }

    public void setHeaderInfoProvider(HeaderInfoProvider headerInfoProvider) {
        this.headerInfoProvider = headerInfoProvider;
    }

    public OnSpanCountChangeListener getOnSpanCountChangeListener() {
        return this.onSpanCountChangeListener;
    }

    public void setOnSpanCountChangeListener(OnSpanCountChangeListener onSpanCountChangeListener) {
        this.onSpanCountChangeListener = onSpanCountChangeListener;
    }

    public int getSpanCount() {
        return this.spanCount;
    }
}
