package com.vk.music.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.music.dto.Playlist;
import com.vk.music.dto.Thumb;
import com.vkontakte.android.audio.MusicTrack;
import java.util.Collection;
import java.util.List;
import me.grishka.appkit.api.ErrorResponse;
/* loaded from: classes2.dex */
public interface EditPlaylistModel extends ActiveModel {

    /* loaded from: classes2.dex */
    public interface Callback {
        void onLoadingMoreDone(@NonNull EditPlaylistModel editPlaylistModel, @NonNull List<MusicTrack> list);

        void onLoadingMoreError(@NonNull EditPlaylistModel editPlaylistModel, @NonNull ErrorResponse errorResponse);

        void onSavingDone(@NonNull EditPlaylistModel editPlaylistModel, @NonNull Playlist playlist);

        void onSavingError(@NonNull EditPlaylistModel editPlaylistModel, @NonNull ErrorResponse errorResponse);
    }

    void attachTracks(@NonNull List<MusicTrack> list);

    boolean canLoadMore();

    @NonNull
    Collection<MusicTrack> getAttached();

    @NonNull
    String getDescription();

    @Nullable
    List<MusicTrack> getMusicTracks();

    @Nullable
    Thumb getPhotoUrl();

    @NonNull
    Collection<MusicTrack> getRemoved();

    @NonNull
    String getTitle();

    boolean isNew();

    boolean isTrackAttached(@NonNull MusicTrack musicTrack);

    void loadMore();

    void removeAttachedTrack(@NonNull MusicTrack musicTrack);

    void savePlaylist();

    void setDescription(@NonNull String str);

    void setTitle(@NonNull String str);

    void subscribe(@NonNull Callback callback);

    boolean toggleRemoved(@NonNull MusicTrack musicTrack);

    void unsubscribe(@NonNull Callback callback);
}
