package com.vk.music.model;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.music.dto.Playlist;
import com.vkontakte.android.audio.MusicTrack;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
/* loaded from: classes.dex */
public interface MusicModel extends ActiveModel {

    /* loaded from: classes2.dex */
    public interface Callback {
        void onAudioLoadingDone(@NonNull MusicModel musicModel, @NonNull List<MusicTrack> list);

        void onAudioLoadingError(@NonNull MusicModel musicModel, @NonNull ErrorResponse errorResponse);

        void onLoadingDone(@NonNull MusicModel musicModel);

        void onLoadingError(@NonNull MusicModel musicModel, @NonNull ErrorResponse errorResponse);

        void onPlaylistChanged(@NonNull MusicModel musicModel, @NonNull Playlist playlist);

        void onPlaylistCreated(@NonNull MusicModel musicModel, @NonNull Playlist playlist);

        void onPlaylistRemoved(@NonNull MusicModel musicModel, @NonNull Playlist playlist);
    }

    boolean canLoadMoreAudio();

    @Nullable
    String getError();

    String getIcon();

    @NonNull
    MusicTrackModel getMusicTrackModel();

    @Nullable
    List<MusicTrack> getMusicTracks();

    @NonNull
    Playlist getOriginalPlaylist(@NonNull Playlist playlist);

    int getOwnerId();

    @NonNull
    PlayerModel getPlayerModel();

    @NonNull
    List<Playlist> getPlaylists();

    @Nullable
    String getTitle(Context context);

    boolean hasIcon();

    boolean isCurrentUser();

    boolean isNeedLoadTitle();

    void loadAndPlayShuffleAll(@NonNull Context context);

    void loadMoreAudio();

    void loadPage();

    void subscribe(@NonNull Callback callback);

    void unsubscribe(@NonNull Callback callback);
}
