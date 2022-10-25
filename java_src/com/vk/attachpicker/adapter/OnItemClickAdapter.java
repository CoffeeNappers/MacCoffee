package com.vk.attachpicker.adapter;

import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import com.vk.attachpicker.widget.OnItemClickListener;
/* loaded from: classes2.dex */
public abstract class OnItemClickAdapter<VH extends RecyclerView.ViewHolder> extends RecyclerView.Adapter<VH> {
    private OnItemClickListener itemClickListener;

    /* JADX INFO: Access modifiers changed from: protected */
    public VH wrapHolder(VH holder) {
        holder.itemView.setOnClickListener(OnItemClickAdapter$$Lambda$1.lambdaFactory$(this, holder));
        return holder;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$wrapHolder$0(RecyclerView.ViewHolder holder, View v) {
        if (this.itemClickListener != null) {
            this.itemClickListener.onItemClickListener(holder.getAdapterPosition());
        }
    }

    public void setItemClickListener(OnItemClickListener itemClickListener) {
        this.itemClickListener = itemClickListener;
    }
}
