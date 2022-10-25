package com.vkontakte.android.ui.holder.commons;

import android.content.Context;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.widget.GridView;
/* loaded from: classes3.dex */
public abstract class GridHolder<T, H extends RecyclerHolder<T>> extends RecyclerHolder<T[]> {
    private Object[] holders;

    public abstract H createViewHolder(Context context);

    public GridHolder(ViewGroup parent, int columns) {
        super((int) R.layout.market_grid_view, parent);
        GridView gridView = (GridView) this.itemView;
        gridView.setColumns(columns);
        this.holders = new Object[columns];
        for (int i = 0; i < columns; i++) {
            H h = createViewHolder(getContext());
            this.holders[i] = h;
            gridView.addView(h.itemView);
        }
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(T[] item) {
        for (int i = 0; i < this.holders.length; i++) {
            ((RecyclerHolder) this.holders[i]).bind(item[i]);
        }
    }
}
