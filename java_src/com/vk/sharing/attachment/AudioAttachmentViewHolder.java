package com.vk.sharing.attachment;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.music.dto.Thumb;
import com.vk.music.view.ThumbsImageView;
import com.vkontakte.android.R;
/* compiled from: AttachmentViewHolder.java */
/* loaded from: classes2.dex */
final class AudioAttachmentViewHolder extends DataViewHolder {
    private TextView artistView;
    private ThumbsImageView imageView;
    private TextView titleView;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AudioAttachmentViewHolder(@Nullable Bundle data) {
        super(data);
    }

    @Override // com.vk.sharing.attachment.DataViewHolder
    @NonNull
    View createView(@NonNull Context context, @NonNull ViewGroup parent) {
        View view = LayoutInflater.from(context).inflate(R.layout.music_audio_item1, parent, false);
        this.imageView = (ThumbsImageView) view.findViewById(R.id.audio_image);
        this.titleView = (TextView) view.findViewById(R.id.audio_title);
        this.artistView = (TextView) view.findViewById(R.id.audio_artist);
        view.setBackground(null);
        view.findViewById(R.id.audio_menu).setVisibility(8);
        return view;
    }

    @Override // com.vk.sharing.attachment.AttachmentViewHolder
    public void bind(@NonNull Bundle data) {
        this.imageView.setThumb((Thumb) data.getParcelable(AttachmentInfo.DATA_THUMB));
        this.titleView.setText(data.getString("title"));
        this.artistView.setText(data.getString("artist"));
    }
}
