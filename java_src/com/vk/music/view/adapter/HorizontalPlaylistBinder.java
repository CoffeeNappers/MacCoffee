package com.vk.music.view.adapter;

import android.support.annotation.NonNull;
import android.view.View;
import android.widget.TextView;
import com.vk.music.dto.Playlist;
import com.vk.music.view.ThumbsImageView;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class HorizontalPlaylistBinder implements ItemViewHolder.Binder<Playlist> {
    @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
    @NonNull
    public ViewRefs onCreate(@NonNull View itemView) {
        return new ViewRefs().put(itemView.findViewById(R.id.playlist_image)).put(itemView.findViewById(R.id.playlist_title)).put(itemView.findViewById(R.id.playlist_subtitle));
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
    public void onBind(@NonNull ViewRefs viewRefs, @NonNull Playlist pl, int position) {
        ThumbsImageView image = (ThumbsImageView) viewRefs.next();
        if (pl.type == 2) {
            image.setPlaceholderImage(R.drawable.placeholder_playlist_cache);
        } else {
            image.setPlaceholderImage(R.drawable.placeholder_playlist);
        }
        if (pl.photo != null) {
            image.setThumb(pl.photo);
        } else {
            image.setThumbs(pl.thumbs);
        }
        ((TextView) viewRefs.next()).setText(pl.title);
        String subtitle = (pl.artists == null || pl.artists.isEmpty()) ? null : pl.artists.get(0).name;
        ((TextView) viewRefs.next()).setText(subtitle);
    }
}
