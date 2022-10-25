package com.vk.masks;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.vk.masks.MasksView;
import com.vk.masks.model.Mask;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class MasksAdapter extends RecyclerView.Adapter<MasksHolder> {
    private final Context context;
    private final MasksContainer masksContainer;
    private final MasksView.OnMaskSelectedListener onMaskSelectedListener;
    private final int sectionId;
    private Mask selectedMask;

    public MasksAdapter(Context context, MasksContainer masksContainer, int sectionId, MasksView.OnMaskSelectedListener onMaskSelectedListener) {
        this.context = context;
        this.onMaskSelectedListener = onMaskSelectedListener;
        this.sectionId = sectionId;
        this.masksContainer = masksContainer;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder  reason: collision with other method in class */
    public MasksHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        return new MasksHolder(this.context, this);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(MasksHolder holder, int position) {
        Mask m = getItems().get(position);
        holder.update(m, m.equals(this.selectedMask));
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return getItems().size();
    }

    public void appendRange(List<Mask> items) {
        ArrayList<Mask> list = getItems();
        int position = list.size();
        list.addAll(position, items);
        notifyItemRangeInserted(position, items.size());
    }

    public void clear() {
        getItems().clear();
    }

    public ArrayList<Mask> getItems() {
        return this.masksContainer.masksListForSectionId(this.sectionId);
    }

    public void setSelectedMask(Mask selectedMask) {
        this.selectedMask = selectedMask;
        notifyDataSetChanged();
    }

    public MasksView.OnMaskSelectedListener getOnMaskSelectedListener() {
        return this.onMaskSelectedListener;
    }

    public int getSectionId() {
        return this.sectionId;
    }
}
