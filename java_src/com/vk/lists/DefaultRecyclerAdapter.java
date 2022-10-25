package com.vk.lists;

import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public abstract class DefaultRecyclerAdapter<T, VH extends RecyclerView.ViewHolder> extends RecyclerView.Adapter<VH> {
    private final ArrayList<T> list = new ArrayList<>();

    public ArrayList<T> getItems() {
        return this.list;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.list.size();
    }

    public T getItemAt(int position) {
        return this.list.get(position);
    }

    public void insertItemAt(int position, T item) {
        this.list.add(position, item);
        notifyItemInserted(position);
    }

    public void insertRangeAt(int position, List<T> items) {
        this.list.addAll(position, items);
        notifyItemRangeInserted(position, items.size());
    }

    public void appendRange(List<T> items) {
        insertRangeAt(this.list.size(), items);
    }

    public void updateItemAt(int position, T item) {
        this.list.set(position, item);
        notifyItemChanged(position);
    }

    public void updateRangeAt(int position, List<T> items) {
        for (T item : items) {
            this.list.set(position + 0, item);
        }
        notifyItemRangeChanged(position, items.size());
    }

    public void moveItem(int fromPosition, int toPosition) {
        Collections.swap(this.list, fromPosition, toPosition);
        notifyItemMoved(fromPosition, toPosition);
    }

    public void removeItemAt(int position) {
        this.list.remove(position);
        notifyItemRemoved(position);
    }

    public void removeRangeAt(int position, int count) {
        for (int i = 0; i < count; i++) {
            this.list.remove(position);
        }
        notifyItemRangeRemoved(position, count);
    }

    public void clear() {
        this.list.clear();
        notifyDataSetChanged();
    }
}
