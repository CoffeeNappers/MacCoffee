package com.vk.music.view.adapter;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import com.vk.core.util.Resourcer;
import com.vk.music.dto.Playlist;
import com.vk.music.formatter.PlaylistFormatter;
import com.vk.music.view.ThumbsImageView;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public final class PlaylistBinder implements ItemViewHolder.Binder<Playlist> {
    private final Resourcer resourcer;

    public PlaylistBinder(@NonNull Resourcer resourcer) {
        this.resourcer = resourcer;
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
    @NonNull
    public ViewRefs onCreate(@NonNull View itemView) {
        return new ViewRefs().put(itemView.findViewById(R.id.playlist_image)).put(itemView.findViewById(R.id.playlist_title)).put(itemView.findViewById(R.id.playlist_snippet1)).put(itemView.findViewById(R.id.playlist_snippet2));
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
    public void onBind(@NonNull ViewRefs viewRefs, @NonNull Playlist playlist, int position) {
        ThumbsImageView image = (ThumbsImageView) viewRefs.next();
        if (playlist.photo != null) {
            image.setThumb(playlist.photo);
        } else {
            image.setThumbs(playlist.thumbs);
        }
        ((TextView) viewRefs.next()).setText(playlist.title);
        setTextOrHide((TextView) viewRefs.next(), formatSnippet1(this.resourcer, playlist));
        setTextOrHide((TextView) viewRefs.next(), formatSnippet2(this.resourcer, playlist));
    }

    private static CharSequence formatSnippet1(Resourcer resourcer, Playlist playlist) {
        return playlist.type == 1 ? PlaylistFormatter.formatArtists(resourcer, playlist.artists) : "";
    }

    private static CharSequence formatSnippet2(Resourcer resourcer, Playlist playlist) {
        return playlist.type == 1 ? PlaylistFormatter.formatGenreYear(resourcer, playlist.genres, playlist.year) : PlaylistFormatter.formatListenings(resourcer, playlist.listeningsCount);
    }

    private static void setTextOrHide(TextView view, CharSequence text) {
        if (TextUtils.isEmpty(text)) {
            view.setVisibility(8);
            return;
        }
        view.setVisibility(0);
        view.setText(text);
    }
}
