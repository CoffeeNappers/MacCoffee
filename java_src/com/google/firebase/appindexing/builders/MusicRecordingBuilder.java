package com.google.firebase.appindexing.builders;

import android.support.annotation.NonNull;
/* loaded from: classes2.dex */
public final class MusicRecordingBuilder extends IndexableBuilder<MusicRecordingBuilder> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public MusicRecordingBuilder() {
        super("MusicRecording");
    }

    public MusicRecordingBuilder setByArtist(@NonNull MusicGroupBuilder musicGroupBuilder) {
        return put("byArtist", musicGroupBuilder);
    }

    public MusicRecordingBuilder setDuration(int i) {
        return put("duration", i);
    }

    public MusicRecordingBuilder setInAlbum(@NonNull MusicAlbumBuilder musicAlbumBuilder) {
        return put("inAlbum", musicAlbumBuilder);
    }

    public MusicRecordingBuilder setInPlaylist(@NonNull MusicPlaylistBuilder... musicPlaylistBuilderArr) {
        return put("inPlaylist", musicPlaylistBuilderArr);
    }
}
