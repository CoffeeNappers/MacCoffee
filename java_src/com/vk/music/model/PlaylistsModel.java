package com.vk.music.model;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.music.dto.Playlist;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
/* loaded from: classes2.dex */
public interface PlaylistsModel extends ActiveModel {

    /* loaded from: classes2.dex */
    public interface Callback {
        void onAdditionDone(@NonNull PlaylistsModel playlistsModel, @NonNull Playlist playlist);

        void onAdditionError(@NonNull PlaylistsModel playlistsModel, @NonNull ErrorResponse errorResponse);

        void onDeletionDone(@NonNull PlaylistsModel playlistsModel, @NonNull Playlist playlist);

        void onDeletionError(@NonNull PlaylistsModel playlistsModel, @NonNull ErrorResponse errorResponse);

        void onLoadingDone(@NonNull PlaylistsModel playlistsModel);

        void onLoadingError(@NonNull PlaylistsModel playlistsModel, @NonNull ErrorResponse errorResponse);

        void onMoreLoadingDone(@NonNull PlaylistsModel playlistsModel, @NonNull List<Playlist> list);

        void onMoreLoadingError(@NonNull PlaylistsModel playlistsModel, @NonNull ErrorResponse errorResponse);

        void onPlaylistChanged(@NonNull PlaylistsModel playlistsModel, @NonNull Playlist playlist);

        void onPlaylistCreated(@NonNull PlaylistsModel playlistsModel, @NonNull Playlist playlist);

        void onPlaylistRemoved(@NonNull PlaylistsModel playlistsModel, @NonNull Playlist playlist);
    }

    void addPlaylist(@NonNull Playlist playlist);

    boolean canAddPlaylist();

    boolean canAddPlaylist(@NonNull Playlist playlist);

    boolean canDeletePlaylist(@NonNull Playlist playlist);

    boolean canLoadMore();

    void deletePlaylist(@NonNull Playlist playlist);

    @Nullable
    String getError();

    @NonNull
    Playlist getOriginalPlaylist(@NonNull Playlist playlist);

    @Nullable
    List<Playlist> getPlaylists();

    String getTitle(Context context);

    boolean isCurrentUser();

    boolean isSelect();

    void loadMore();

    void loadPlaylists();

    void subscribe(@NonNull Callback callback);

    void unsubscribe(@NonNull Callback callback);
}
