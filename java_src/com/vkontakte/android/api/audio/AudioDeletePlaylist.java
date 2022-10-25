package com.vkontakte.android.api.audio;

import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
/* loaded from: classes2.dex */
public final class AudioDeletePlaylist extends ResultlessAPIRequest {
    public AudioDeletePlaylist(int playlistId, int ownerId) {
        super("audio.deletePlaylist");
        param(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_PLAY_LIST_ID, playlistId);
        param("owner_id", ownerId);
    }
}
