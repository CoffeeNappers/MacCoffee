package com.vk.music.view.adapter;

import android.support.annotation.NonNull;
import android.view.View;
import android.widget.ImageView;
import com.vk.core.util.Resourcer;
import com.vk.music.graphics.PlayingDrawable;
import com.vk.music.model.PlayerModel;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicTrack;
/* loaded from: classes2.dex */
public class PlayingMusicBinder extends MusicBinder {
    private final PlayerModel model;

    public PlayingMusicBinder(@NonNull PlayerModel model) {
        this.model = model;
    }

    @Override // com.vk.music.view.adapter.MusicBinder, com.vk.music.view.adapter.ItemViewHolder.Binder
    @NonNull
    public ViewRefs onCreate(@NonNull View itemView) {
        ViewRefs viewRefs = super.onCreate(itemView);
        ImageView playingIndicator = (ImageView) itemView.findViewById(R.id.audio_playing_indicator);
        playingIndicator.setImageDrawable(new PlayingDrawable.ResourceBuilder(Resourcer.from(itemView)).count(R.integer.music_playing_drawable_rect_count).rectWidth(R.dimen.music_playing_drawable_rect_width).rectHeight(R.dimen.music_playing_drawable_rect_height).rectMinHeight(R.dimen.music_playing_drawable_rect_min_height).rectColor(R.color.music_playing_drawable_rect_white).gapWidth(R.dimen.music_playing_drawable_gap).build());
        return viewRefs.put(playingIndicator);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vk.music.view.adapter.MusicBinder, com.vk.music.view.adapter.ItemViewHolder.Binder
    public void onBind(@NonNull ViewRefs refs, @NonNull MusicTrack musicTrack, int position) {
        super.onBind(refs, musicTrack, position);
        ImageView playingIndicator = (ImageView) refs.next();
        if (musicTrack.equals(this.model.getPlayingTrack())) {
            playingIndicator.setVisibility(0);
            playingIndicator.setActivated(this.model.isPlayerPlaying());
            return;
        }
        playingIndicator.setVisibility(8);
        playingIndicator.setActivated(false);
    }
}
