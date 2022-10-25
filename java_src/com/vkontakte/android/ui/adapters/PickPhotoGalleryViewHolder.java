package com.vkontakte.android.ui.adapters;

import android.view.View;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.transform.BlurPostProcessor;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
class PickPhotoGalleryViewHolder extends RecyclerHolder<MediaStoreEntry> {
    private VKImageView vkImageView;

    /* JADX INFO: Access modifiers changed from: package-private */
    public PickPhotoGalleryViewHolder(View v) {
        super(v);
        this.vkImageView = (VKImageView) this.itemView.findViewById(16908294);
        this.vkImageView.setPostprocessor(new BlurPostProcessor());
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(MediaStoreEntry item) {
        this.vkImageView.load(item.path, ImageSize.BIG);
    }
}
