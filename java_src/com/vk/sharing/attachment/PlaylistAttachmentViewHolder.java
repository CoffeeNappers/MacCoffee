package com.vk.sharing.attachment;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.music.view.ThumbsImageView;
import com.vkontakte.android.R;
/* compiled from: AttachmentViewHolder.java */
/* loaded from: classes2.dex */
final class PlaylistAttachmentViewHolder extends DataViewHolder {
    private ThumbsImageView imageView;
    private TextView titleView;

    /* JADX INFO: Access modifiers changed from: package-private */
    public PlaylistAttachmentViewHolder(@Nullable Bundle data) {
        super(data);
    }

    @Override // com.vk.sharing.attachment.DataViewHolder
    @NonNull
    View createView(@NonNull Context context, @NonNull ViewGroup parent) {
        View view = LayoutInflater.from(context).inflate(R.layout.music_playlist_item1, parent, false);
        this.imageView = (ThumbsImageView) view.findViewById(R.id.playlist_image);
        this.titleView = (TextView) view.findViewById(R.id.playlist_title);
        view.setBackground(null);
        view.findViewById(R.id.playlist_snippet1).setVisibility(8);
        view.findViewById(R.id.playlist_snippet2).setVisibility(8);
        view.findViewById(R.id.playlist_menu).setVisibility(8);
        return view;
    }

    @Override // com.vk.sharing.attachment.AttachmentViewHolder
    public void bind(@NonNull Bundle data) {
        this.imageView.setThumbs(data.getParcelableArrayList(AttachmentInfo.DATA_THUMBS));
        this.titleView.setText(data.getString("title"));
    }
}
