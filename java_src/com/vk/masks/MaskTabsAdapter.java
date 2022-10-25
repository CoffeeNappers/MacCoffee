package com.vk.masks;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.vk.masks.MaskTabsHolder;
import com.vk.masks.model.MaskSection;
import java.util.ArrayList;
/* loaded from: classes2.dex */
class MaskTabsAdapter extends RecyclerView.Adapter<MaskTabsHolder> {
    private final Context context;
    private final MaskTabsHolder.OnMaskTabClick onMaskTabClick;
    private final ArrayList<MaskSection> sections = new ArrayList<>();
    private int selectionPosition;

    public MaskTabsAdapter(Context context, MaskTabsHolder.OnMaskTabClick onMaskTabClick) {
        this.context = context;
        this.onMaskTabClick = onMaskTabClick;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder  reason: collision with other method in class */
    public MaskTabsHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        return new MaskTabsHolder(this.context, this.onMaskTabClick);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(MaskTabsHolder holder, int position) {
        holder.update(this.sections.get(position), this.selectionPosition == position);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.sections.size();
    }

    public void setSections(ArrayList<MaskSection> sections) {
        this.sections.clear();
        this.sections.addAll(sections);
        notifyDataSetChanged();
    }

    public void setSelectionPosition(int selectionPosition) {
        this.selectionPosition = selectionPosition;
        notifyDataSetChanged();
    }
}
