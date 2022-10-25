package com.google.firebase.appindexing.builders;

import android.support.annotation.NonNull;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes2.dex */
public final class MusicGroupBuilder extends IndexableBuilder<MusicGroupBuilder> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public MusicGroupBuilder() {
        super("MusicGroup");
    }

    public MusicGroupBuilder setAlbum(@NonNull MusicAlbumBuilder... musicAlbumBuilderArr) {
        return put(ArgKeys.ALBUM, musicAlbumBuilderArr);
    }

    public MusicGroupBuilder setGenre(@NonNull String str) {
        return put(ServerKeys.GENRE, str);
    }

    public MusicGroupBuilder setTrack(@NonNull MusicRecordingBuilder... musicRecordingBuilderArr) {
        return put("track", musicRecordingBuilderArr);
    }
}
