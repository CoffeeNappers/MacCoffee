package com.vk.attachpicker.holder;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.attachpicker.widget.MediaStoreItemSmallView;
/* loaded from: classes2.dex */
public class MediaStoreItemSmallHolder extends RecyclerView.ViewHolder {
    private MediaStoreItemSmallView photo;

    public MediaStoreItemSmallHolder(Context context, SelectionContext selectionContext, RecyclerView.Adapter adapter, boolean singleMode, boolean hitEntire, int radius) {
        super(new MediaStoreItemSmallView(context, selectionContext, adapter, singleMode, hitEntire, radius));
        this.photo = (MediaStoreItemSmallView) this.itemView;
    }

    public MediaStoreItemSmallHolder(Context context, SelectionContext selectionContext, RecyclerView.Adapter adapter, boolean singleMode) {
        this(context, selectionContext, adapter, singleMode, false, 0);
    }

    public void update(MediaStoreEntry data) {
        this.photo.setImage(data, false);
    }
}
