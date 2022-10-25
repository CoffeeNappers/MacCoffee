package com.vkontakte.android.api.audio;

import com.vk.music.dto.Playlist;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class AudioSearchPlaylists extends ListAPIRequest<Playlist> {
    private AudioSearchPlaylists(Builder builder) {
        super("audio.searchPlaylists", Playlist.class);
        param("q", builder.query);
        param("owner_id", builder.ownerId);
        param("offset", builder.offset);
        param(ServerKeys.COUNT, builder.count);
    }

    /* loaded from: classes2.dex */
    public static final class Builder {
        int count;
        int offset;
        int ownerId;
        String query;

        public Builder query(String val) {
            this.query = val;
            return this;
        }

        public Builder ownerId(int val) {
            this.ownerId = val;
            return this;
        }

        public Builder offset(int val) {
            this.offset = val;
            return this;
        }

        public Builder count(int val) {
            this.count = val;
            return this;
        }

        public AudioSearchPlaylists build() {
            return new AudioSearchPlaylists(this);
        }
    }
}
