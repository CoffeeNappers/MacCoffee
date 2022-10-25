package com.vk.music.event;

import android.support.annotation.NonNull;
import com.vk.music.dto.Playlist;
/* loaded from: classes2.dex */
public final class PlaylistRemoved extends PlaylistEvent {
    public PlaylistRemoved(@NonNull Playlist playlist) {
        super(playlist);
    }
}
