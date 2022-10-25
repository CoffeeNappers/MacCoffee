package com.vk.sharing.attachment;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: AttachmentViewHolder.java */
/* loaded from: classes2.dex */
public final class PhotoAttachmentViewHolder extends DataViewHolder {
    @Nullable
    private VKImageView imageView;

    /* JADX INFO: Access modifiers changed from: package-private */
    public PhotoAttachmentViewHolder(@Nullable Bundle data) {
        super(data);
    }

    @Override // com.vk.sharing.attachment.DataViewHolder
    @NonNull
    public View createView(@NonNull Context context, @NonNull ViewGroup parent) {
        FrameLayout container = new FrameLayout(context);
        this.imageView = new VKImageView(context);
        this.imageView.setPlaceholderImage(R.drawable.photo_loading);
        container.addView(this.imageView, new FrameLayout.LayoutParams(Screen.dp(96), Screen.dp(72)));
        return container;
    }

    @Override // com.vk.sharing.attachment.AttachmentViewHolder
    public void bind(@NonNull Bundle data) {
        if (this.imageView != null) {
            this.imageView.load(data.getString(AttachmentInfo.DATA_THUMB_URL));
        }
    }
}
