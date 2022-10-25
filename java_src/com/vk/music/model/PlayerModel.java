package com.vk.music.model;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.PlayerRefer;
import java.util.List;
/* loaded from: classes.dex */
public interface PlayerModel extends ActiveModel {

    /* loaded from: classes2.dex */
    public interface Callback {
        void onPlayingPaused(@NonNull PlayerModel playerModel);

        void onPlayingResumed(@NonNull PlayerModel playerModel);

        void onPlayingStopped(@NonNull PlayerModel playerModel);
    }

    void addToPlayNext(@NonNull Context context, @NonNull MusicTrack musicTrack);

    @Nullable
    MusicTrack getPlayingTrack();

    boolean isPlayerPlaying();

    void loadAndPlayTheSame(@NonNull Context context, @NonNull MusicTrack musicTrack);

    void subscribe(@NonNull Callback callback);

    void togglePlayer(@Nullable MusicTrack musicTrack, @Nullable List<MusicTrack> list);

    void togglePlayer(@Nullable MusicTrack musicTrack, @Nullable List<MusicTrack> list, PlayerRefer playerRefer);

    void unsubscribe(@NonNull Callback callback);
}
