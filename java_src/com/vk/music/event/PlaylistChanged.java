package com.vk.music.event;

import android.support.annotation.NonNull;
import com.vk.music.dto.Playlist;
/* loaded from: classes2.dex */
public final class PlaylistChanged extends PlaylistEvent {
    public PlaylistChanged(@NonNull Playlist playlist) {
        super(playlist);
    }
}
