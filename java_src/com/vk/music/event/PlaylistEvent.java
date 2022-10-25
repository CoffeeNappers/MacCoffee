package com.vk.music.event;

import android.support.annotation.NonNull;
import com.vk.music.dto.Playlist;
/* loaded from: classes2.dex */
public class PlaylistEvent implements Event {
    public final Playlist playlist;

    public PlaylistEvent(@NonNull Playlist playlist) {
        this.playlist = playlist;
    }
}
