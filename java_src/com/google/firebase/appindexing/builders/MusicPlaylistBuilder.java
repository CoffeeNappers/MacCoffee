package com.google.firebase.appindexing.builders;

import android.support.annotation.NonNull;
/* loaded from: classes2.dex */
public class MusicPlaylistBuilder extends IndexableBuilder<MusicPlaylistBuilder> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public MusicPlaylistBuilder() {
        super("MusicPlaylist");
    }

    public MusicPlaylistBuilder setNumTracks(int i) {
        return put("numTracks", i);
    }

    public MusicPlaylistBuilder setTrack(@NonNull MusicRecordingBuilder... musicRecordingBuilderArr) {
        return put("track", musicRecordingBuilderArr);
    }
}
