package com.vk.masks;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.imageloader.view.VKImageView;
import com.vk.masks.model.MaskSection;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
class MaskTabsHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
    private VKImageView icon;
    private View newBadge;
    private final OnMaskTabClick onMaskTabClick;
    private MaskSection section;
    private boolean selected;
    private View selector;

    /* loaded from: classes2.dex */
    public interface OnMaskTabClick {
        void onClick(int i);
    }

    public MaskTabsHolder(Context context, OnMaskTabClick onMaskTabClick) {
        super(LayoutInflater.from(context).inflate(R.layout.layout_mask_tab, (ViewGroup) null));
        this.onMaskTabClick = onMaskTabClick;
        this.icon = (VKImageView) this.itemView.findViewById(R.id.iv_tab);
        this.selector = this.itemView.findViewById(R.id.selector);
        this.newBadge = this.itemView.findViewById(R.id.view_new_badge);
        this.itemView.setOnClickListener(this);
    }

    public void update(MaskSection section, boolean selected) {
        int i = 0;
        this.section = section;
        this.selected = selected;
        if (selected) {
            this.icon.setColorFilter(-1);
            this.selector.setVisibility(0);
        } else {
            this.icon.setColorFilter(-6250336);
            this.selector.setVisibility(4);
        }
        this.icon.load(section.icon);
        View view = this.newBadge;
        if (!section.hasNew) {
            i = 4;
        }
        view.setVisibility(i);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        this.onMaskTabClick.onClick(getAdapterPosition());
    }
}
