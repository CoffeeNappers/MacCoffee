package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import com.vkontakte.android.R;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class HorizontalRecyclerView extends UsableRecyclerView {
    private int itemBetterWidth;
    private int itemOriginHeight;
    private int itemOriginWidth;

    /* loaded from: classes3.dex */
    public interface ItemWidthFixable {
        void setItemWidth(int i);
    }

    public HorizontalRecyclerView(Context context) {
        super(context);
        this.itemOriginWidth = 8;
        this.itemOriginHeight = 16;
        this.itemBetterWidth = 16;
    }

    public HorizontalRecyclerView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.itemOriginWidth = 8;
        this.itemOriginHeight = 16;
        this.itemBetterWidth = 16;
        init(context, attrs);
    }

    public HorizontalRecyclerView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.itemOriginWidth = 8;
        this.itemOriginHeight = 16;
        this.itemBetterWidth = 16;
        init(context, attrs);
    }

    private void init(Context context, AttributeSet attrs) {
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.HorizontalRecyclerView);
        if (a != null) {
            this.itemOriginWidth = a.getDimensionPixelSize(0, this.itemOriginWidth);
            this.itemOriginHeight = a.getDimensionPixelSize(1, this.itemOriginHeight);
            this.itemBetterWidth = a.getDimensionPixelSize(2, this.itemBetterWidth);
            a.recycle();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.RecyclerView, android.view.View
    public void onMeasure(int widthSpec, int heightSpec) {
        UsableRecyclerView.Adapter adapter = mo1204getAdapter();
        if (adapter != null) {
            int w = View.MeasureSpec.getSize(widthSpec) - getPaddingLeft();
            int size = adapter.getItemCount();
            int betterSize = this.itemBetterWidth;
            for (int i = 0; i < size; i++) {
                int minVariant = (int) (w / (i + 0.8d));
                int maxVariant = (int) (w / (i + 0.2d));
                if (this.itemOriginWidth > maxVariant) {
                    break;
                }
                if (this.itemOriginWidth <= maxVariant && this.itemOriginWidth >= minVariant) {
                    betterSize = this.itemOriginWidth;
                }
                if (minVariant >= this.itemOriginWidth && betterSize - this.itemOriginWidth > minVariant - this.itemOriginWidth) {
                    betterSize = minVariant;
                }
                if (maxVariant >= this.itemOriginWidth && betterSize - this.itemOriginWidth > maxVariant - this.itemOriginWidth) {
                    betterSize = maxVariant;
                }
            }
            for (int i2 = getChildCount() - 1; i2 >= 0; i2--) {
                UsableRecyclerView.ViewHolder viewHolder = mo1205getChildViewHolder(getChildAt(i2));
                if (viewHolder instanceof ItemWidthFixable) {
                    ((ItemWidthFixable) viewHolder).setItemWidth(betterSize);
                }
            }
            if (adapter instanceof ItemWidthFixable) {
                ((ItemWidthFixable) adapter).setItemWidth(betterSize);
            }
            heightSpec = View.MeasureSpec.makeMeasureSpec(this.itemOriginHeight + (betterSize - this.itemOriginWidth), Integer.MIN_VALUE);
        }
        super.onMeasure(widthSpec, heightSpec);
    }
}
