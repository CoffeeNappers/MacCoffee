package com.vkontakte.android.api.audio;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.vk.music.dto.Playlist;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AudioSavePlaylist extends VKAPIRequest<Playlist> {

    /* loaded from: classes2.dex */
    public static final class Builder {
        List<String> audioIds;
        List<String> audioIdsToAdd;
        List<String> audioIdsToRemove;
        String description;
        String hash;
        int ownerId;
        String photo;
        int playlistId;
        boolean saveCover;
        String title;

        public Builder ownerId(int val) {
            this.ownerId = val;
            return this;
        }

        public Builder playlistId(int val) {
            this.playlistId = val;
            return this;
        }

        public Builder title(String val) {
            this.title = val;
            return this;
        }

        public Builder description(String val) {
            this.description = val;
            return this;
        }

        public Builder addAudio(@NonNull MusicTrack musicTrack) {
            if (this.audioIds == null) {
                this.audioIds = new ArrayList();
            }
            this.audioIds.add(musicTrack.getSecureUid());
            return this;
        }

        public Builder addAudioToAdd(@NonNull MusicTrack musicTrack) {
            if (this.audioIdsToAdd == null) {
                this.audioIdsToAdd = new ArrayList();
            }
            this.audioIdsToAdd.add(musicTrack.getSecureUid());
            return this;
        }

        public Builder addAudioToRemove(@NonNull MusicTrack musicTrack) {
            if (this.audioIdsToRemove == null) {
                this.audioIdsToRemove = new ArrayList();
            }
            this.audioIdsToRemove.add(musicTrack.getUid());
            return this;
        }

        public Builder saveCover(boolean val) {
            this.saveCover = val;
            return this;
        }

        public Builder hash(String val) {
            this.hash = val;
            return this;
        }

        public Builder photo(String val) {
            this.photo = val;
            return this;
        }

        public AudioSavePlaylist build() {
            return new AudioSavePlaylist(this);
        }
    }

    private AudioSavePlaylist(Builder builder) {
        super("execute.savePlaylist");
        param("owner_id", builder.ownerId);
        param(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_PLAY_LIST_ID, builder.playlistId);
        param("title", builder.title);
        param("desc", builder.description);
        if (builder.audioIds != null) {
            param("audio_ids", TextUtils.join(",", builder.audioIds));
        }
        if (builder.audioIdsToAdd != null) {
            param("audio_ids_to_add", TextUtils.join(",", builder.audioIdsToAdd));
        }
        if (builder.audioIdsToRemove != null) {
            param("audio_ids_to_remove", TextUtils.join(",", builder.audioIdsToRemove));
        }
        param("save_cover", builder.saveCover ? 1 : 0);
        param("photo_hash", builder.hash);
        param("photo", builder.photo);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Playlist mo1093parse(JSONObject r) throws Exception {
        return new Playlist(r.getJSONObject(ServerKeys.RESPONSE).getJSONObject("playlist"));
    }
}
