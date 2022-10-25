package com.vk.music.model;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.music.dto.Playlist;
import com.vkontakte.android.audio.MusicTrack;
import me.grishka.appkit.api.ErrorResponse;
/* loaded from: classes.dex */
public interface MusicTrackModel extends ActiveModel {

    /* loaded from: classes2.dex */
    public interface Callback {
        void onAudioAdditionDone(@NonNull MusicTrackModel musicTrackModel, @NonNull MusicTrack musicTrack);

        void onAudioAdditionError(@NonNull MusicTrackModel musicTrackModel, @NonNull ErrorResponse errorResponse);

        void onAudioAdditionToPlaylistDone(@NonNull MusicTrackModel musicTrackModel, @NonNull Playlist playlist);

        void onAudioAdditionToPlaylistError(@NonNull MusicTrackModel musicTrackModel, @NonNull ErrorResponse errorResponse);

        void onAudioRemovalDone(@NonNull MusicTrackModel musicTrackModel, @NonNull MusicTrack musicTrack);

        void onAudioRemovalError(@NonNull MusicTrackModel musicTrackModel, @NonNull ErrorResponse errorResponse);

        void onAudioRemovalFromPlaylistDone(@NonNull MusicTrackModel musicTrackModel, @NonNull Playlist playlist, @NonNull MusicTrack musicTrack);

        void onAudioRemovalFromPlaylistError(@NonNull MusicTrackModel musicTrackModel, @NonNull ErrorResponse errorResponse);
    }

    void addAudio(@NonNull MusicTrack musicTrack, @Nullable Playlist playlist);

    boolean canAddAudio(@Nullable MusicTrack musicTrack);

    boolean canRemoveAudio(@Nullable MusicTrack musicTrack);

    void clearDownloaded(@NonNull MusicTrack musicTrack);

    void download(@NonNull MusicTrack musicTrack, @NonNull Context context);

    @Nullable
    MusicTrack getTarget();

    boolean isDownloaded(@NonNull MusicTrack musicTrack);

    void removeAudio(@NonNull MusicTrack musicTrack, @Nullable Playlist playlist);

    void setTarget(@NonNull MusicTrack musicTrack);

    void subscribe(@NonNull Callback callback);

    void unsubscribe(@NonNull Callback callback);
}
