package com.vk.music.model;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.music.dto.Playlist;
import com.vkontakte.android.audio.MusicTrack;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
/* loaded from: classes2.dex */
public interface PlaylistModel extends ActiveModel {

    /* loaded from: classes2.dex */
    public interface Callback {
        void onAttachingDone(@NonNull PlaylistModel playlistModel, @NonNull List<MusicTrack> list);

        void onAttachingError(@NonNull PlaylistModel playlistModel, @NonNull ErrorResponse errorResponse);

        void onDeletionDone(@NonNull PlaylistModel playlistModel);

        void onDeletionError(@NonNull PlaylistModel playlistModel, @NonNull ErrorResponse errorResponse);

        void onFollowingTogglingDone(@NonNull PlaylistModel playlistModel, @NonNull Playlist playlist);

        void onFollowingTogglingError(@NonNull PlaylistModel playlistModel, @NonNull ErrorResponse errorResponse);

        void onLoadingDone(@NonNull PlaylistModel playlistModel);

        void onLoadingError(@NonNull PlaylistModel playlistModel, @NonNull ErrorResponse errorResponse);

        void onLoadingMoreDone(@NonNull PlaylistModel playlistModel, @NonNull List<MusicTrack> list);

        void onLoadingMoreError(@NonNull PlaylistModel playlistModel, @NonNull ErrorResponse errorResponse);

        void onPlaylistChanged(@NonNull PlaylistModel playlistModel);
    }

    void attachMusic(@NonNull List<MusicTrack> list);

    boolean canLoadMore();

    boolean canShare();

    void delete();

    @Nullable
    String getError();

    @NonNull
    MusicTrackModel getMusicTrackModel();

    @Nullable
    List<MusicTrack> getMusicTracks();

    int getOffset();

    @Nullable
    String getOwner();

    int getOwnerId();

    @NonNull
    PlayerModel getPlayerModel();

    @Nullable
    Playlist getPlaylist();

    boolean isCurrentUser();

    boolean isFollowed();

    boolean isLoaded();

    void load();

    void loadAndPlayShuffleAll(@NonNull Context context);

    void loadMore();

    void subscribe(@NonNull Callback callback);

    void toggleFollowing();

    void unsubscribe(@NonNull Callback callback);
}
