package com.vk.attachpicker.holder;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import com.vk.attachpicker.adapter.TabsAdapter;
import com.vk.attachpicker.widget.TabView;
/* loaded from: classes2.dex */
public class TabHolder extends RecyclerView.ViewHolder {
    private TabsAdapter.CurrentSelectionProvider currentSelectionProvider;

    public TabHolder(Context context, TabsAdapter.CurrentSelectionProvider currentSelectionProvider) {
        super(new TabView(context));
        this.currentSelectionProvider = currentSelectionProvider;
    }

    public void update(TabsAdapter.TabInfo tabInfo) {
        ((TabView) this.itemView).update(tabInfo, getAdapterPosition(), this.currentSelectionProvider.position(), this.currentSelectionProvider.positionOffset());
    }
}
