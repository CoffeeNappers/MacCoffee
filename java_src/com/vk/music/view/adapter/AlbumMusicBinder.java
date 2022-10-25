package com.vk.music.view.adapter;

import android.support.annotation.NonNull;
import android.view.View;
import android.widget.TextView;
import com.vk.core.util.Resourcer;
import com.vk.music.formatter.DurationFormatter;
import com.vk.music.graphics.PlayingDrawable;
import com.vk.music.model.PlayerModel;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicTrack;
/* loaded from: classes2.dex */
public class AlbumMusicBinder implements ItemViewHolder.Binder<MusicTrack> {
    private final PlayerModel model;

    public AlbumMusicBinder(@NonNull PlayerModel model) {
        this.model = model;
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
    @NonNull
    public ViewRefs onCreate(@NonNull View itemView) {
        View playingIndicator = itemView.findViewById(R.id.audio_playing_indicator);
        playingIndicator.setBackground(new PlayingDrawable.ResourceBuilder(Resourcer.from(itemView)).count(R.integer.music_playing_drawable_rect_count).rectWidth(R.dimen.music_playing_drawable_rect_width).rectHeight(R.dimen.music_playing_drawable_rect_height).rectMinHeight(R.dimen.music_playing_drawable_rect_min_height).rectColor(R.color.music_playing_drawable_rect_blue).gapWidth(R.dimen.music_playing_drawable_gap).build());
        return new ViewRefs().put(playingIndicator).put(itemView.findViewById(R.id.audio_number)).put(itemView.findViewById(R.id.audio_title)).put(itemView.findViewById(R.id.audio_duration));
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.Binder
    public void onBind(@NonNull ViewRefs refs, @NonNull MusicTrack musicTrack, int position) {
        View playingIndicator = refs.next();
        if (musicTrack.equals(this.model.getPlayingTrack())) {
            ((TextView) refs.next()).setText((CharSequence) null);
            playingIndicator.setVisibility(0);
            playingIndicator.setActivated(this.model.isPlayerPlaying());
        } else {
            ((TextView) refs.next()).setText(String.valueOf(position + 1));
            playingIndicator.setVisibility(8);
            playingIndicator.setActivated(false);
        }
        ((TextView) refs.next()).setText(musicTrack.title);
        ((TextView) refs.next()).setText(DurationFormatter.formatDurationShort(musicTrack.duration));
    }
}
