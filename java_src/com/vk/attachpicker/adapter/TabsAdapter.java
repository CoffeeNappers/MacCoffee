package com.vk.attachpicker.adapter;

import android.app.Fragment;
import android.view.ViewGroup;
import com.vk.attachpicker.holder.TabHolder;
import com.vkontakte.android.functions.F0;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class TabsAdapter extends OnItemClickAdapter<TabHolder> {
    private final ArrayList<TabInfo> items = new ArrayList<>();
    private final CurrentSelectionProvider selectionProvider;

    /* loaded from: classes2.dex */
    public interface CurrentSelectionProvider {
        int position();

        float positionOffset();
    }

    public TabsAdapter(CurrentSelectionProvider selectionProvider) {
        setHasStableIds(true);
        this.selectionProvider = selectionProvider;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder  reason: collision with other method in class */
    public TabHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        TabHolder tabHolder = new TabHolder(parent.getContext(), this.selectionProvider);
        return wrapHolder(tabHolder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(TabHolder holder, int position) {
        holder.update(this.items.get(position));
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.items.size();
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public long getItemId(int position) {
        return this.items.get(position).titleResId;
    }

    public void setItems(ArrayList<TabInfo> items) {
        this.items.addAll(items);
        notifyDataSetChanged();
    }

    public ArrayList<TabInfo> getItems() {
        return this.items;
    }

    /* loaded from: classes2.dex */
    public static class TabInfo {
        public boolean allowHorizontalScroll;
        public final F0<Fragment> fragmentFactoryMethod;
        public final int iconResId;
        public boolean showBadge;
        public final int titleResId;

        public TabInfo(int iconResId, int titleResId, F0<Fragment> factoryMethodFunc) {
            this.iconResId = iconResId;
            this.titleResId = titleResId;
            this.fragmentFactoryMethod = factoryMethodFunc;
            this.allowHorizontalScroll = false;
        }

        public TabInfo(boolean allowHorizontalScroll, int iconResId, int titleResId, F0<Fragment> factoryMethodFunc) {
            this(iconResId, titleResId, factoryMethodFunc);
            this.allowHorizontalScroll = allowHorizontalScroll;
        }
    }
}
