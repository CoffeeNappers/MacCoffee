package com.vk.music.view.adapter;

import android.support.annotation.NonNull;
import android.view.View;
import android.widget.TextView;
import com.vk.music.view.ThumbsImageView;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicTrack;
/* loaded from: classes2.dex */
public class MusicBinder implements ItemViewHolder.Binder<MusicTrack> {
    @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
    @NonNull
    public ViewRefs onCreate(@NonNull View itemView) {
        return new ViewRefs().put(itemView.findViewById(R.id.audio_image)).put(itemView.findViewById(R.id.audio_title)).put(itemView.findViewById(R.id.audio_artist));
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
    public void onBind(@NonNull ViewRefs refs, @NonNull MusicTrack musicTrack, int position) {
        ((ThumbsImageView) refs.next()).setThumb(musicTrack.getThumb());
        ((TextView) refs.next()).setText(musicTrack.title);
        ((TextView) refs.next()).setText(musicTrack.artist);
    }
}
