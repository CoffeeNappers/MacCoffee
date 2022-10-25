package com.google.firebase.appindexing.builders;

import android.support.annotation.NonNull;
/* loaded from: classes2.dex */
public final class MusicAlbumBuilder extends IndexableBuilder<MusicAlbumBuilder> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public MusicAlbumBuilder() {
        super("MusicAlbum");
    }

    public MusicAlbumBuilder setByArtist(@NonNull MusicGroupBuilder musicGroupBuilder) {
        return put("byArtist", musicGroupBuilder);
    }

    public MusicAlbumBuilder setNumTracks(int i) {
        return put("numTracks", i);
    }

    public MusicAlbumBuilder setTrack(@NonNull MusicRecordingBuilder... musicRecordingBuilderArr) {
        return put("track", musicRecordingBuilderArr);
    }
}
