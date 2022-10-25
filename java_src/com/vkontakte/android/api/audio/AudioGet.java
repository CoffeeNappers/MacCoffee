package com.vkontakte.android.api.audio;

import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.data.ServerKeys;
import java.util.Random;
/* loaded from: classes2.dex */
public class AudioGet extends ListAPIRequest<MusicTrack> {
    public AudioGet(int owner_id) {
        super("audio.get", MusicTrack.class);
        param("owner_id", owner_id);
    }

    public AudioGet count(int count) {
        param(ServerKeys.COUNT, count);
        return this;
    }

    public AudioGet offset(int offset) {
        param("offset", offset);
        return this;
    }

    public AudioGet playlistId(int playlistId) {
        param(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_PLAY_LIST_ID, playlistId);
        return this;
    }

    public AudioGet shuffle() {
        param("shuffle", 1);
        int shuffleSeed = new Random().nextInt();
        if (shuffleSeed == 0) {
            shuffleSeed = 1;
        }
        param("shuffle_seed", shuffleSeed);
        return this;
    }

    public AudioGet accessKey(String accessKey) {
        param("access_key", accessKey);
        return this;
    }

    public AudioGet extended() {
        param("extended", 1);
        return this;
    }
}
