package com.vkontakte.android.api.audio;

import com.facebook.internal.NativeProtocol;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.music.dto.Playlist;
import com.vkontakte.android.api.APIException;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class AudioGetPlaylist extends VKAPIRequest<Result> {
    private final int ownerId;
    private final int playlistId;

    /* loaded from: classes2.dex */
    public static final class Result {
        public ArrayList<MusicTrack> musicTracks;
        public String owner;
        public Playlist playlist;
    }

    private AudioGetPlaylist(int ownerId, int playlistId) {
        super("execute.getPlaylist");
        this.ownerId = ownerId;
        param("owner_id", ownerId);
        this.playlistId = playlistId;
        param("id", playlistId);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        JSONObject jResponse = r.getJSONObject(ServerKeys.RESPONSE);
        Result result = new Result();
        if (jResponse.has("execute_errors")) {
            JSONArray errs = jResponse.getJSONArray("execute_errors");
            if (errs.length() > 0) {
                JSONObject err = errs.getJSONObject(0);
                throw new APIException(err.getInt(NativeProtocol.BRIDGE_ARG_ERROR_CODE), err.optString("error_msg"));
            }
        }
        if (r.has("execute_errors")) {
            JSONArray errs2 = jResponse.getJSONArray("execute_errors");
            if (errs2.length() > 0) {
                JSONObject err2 = errs2.getJSONObject(0);
                throw new APIException(err2.getInt(NativeProtocol.BRIDGE_ARG_ERROR_CODE), err2.optString("error_msg"));
            }
        }
        if (jResponse.has("owner")) {
            JSONObject jOwner = jResponse.optJSONObject("owner");
            if (jOwner.has("first_name") && jOwner.has("last_name")) {
                result.owner = jOwner.optString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + jOwner.optString("last_name");
            } else {
                result.owner = jOwner.optString("name");
            }
        }
        JSONObject jPlaylist = jResponse.optJSONObject("playlist");
        if (jPlaylist != null) {
            result.playlist = new Playlist(jPlaylist);
        }
        JSONArray jAudios = jResponse.optJSONArray("audios");
        ArrayList<MusicTrack> musicTracks = new ArrayList<>();
        if (jAudios != null) {
            int length = jAudios.length();
            for (int i = 0; i < length; i++) {
                musicTracks.add(new MusicTrack(jAudios.optJSONObject(i), this.ownerId, this.playlistId));
            }
        }
        result.musicTracks = musicTracks;
        return result;
    }

    /* loaded from: classes2.dex */
    public static final class Builder {
        String accessKey;
        int audioCount;
        int audioOffset;
        final int id;
        boolean needOwner;
        boolean needPlaylist;
        final int ownerId;

        public Builder(int id, int ownerId) {
            this.id = id;
            this.ownerId = ownerId;
        }

        public Builder(Playlist playlist) {
            this.id = playlist.id;
            this.ownerId = playlist.ownerId;
            accessKey(playlist.accessKey);
            needOwner(false);
            needPlaylist(false);
        }

        public Builder needOwner(boolean needOwner) {
            this.needOwner = needOwner;
            return this;
        }

        public Builder needPlaylist(boolean needPlaylist) {
            this.needPlaylist = needPlaylist;
            return this;
        }

        public Builder audioOffset(int audioOffset) {
            this.audioOffset = audioOffset;
            return this;
        }

        public Builder audioCount(int audioCount) {
            this.audioCount = audioCount;
            return this;
        }

        public Builder accessKey(String accessKey) {
            this.accessKey = accessKey;
            return this;
        }

        public AudioGetPlaylist build() {
            int i = 1;
            AudioGetPlaylist audioGetPlaylist = new AudioGetPlaylist(this.ownerId, this.id);
            audioGetPlaylist.param("need_owner", this.needOwner ? 1 : 0);
            if (!this.needPlaylist) {
                i = 0;
            }
            audioGetPlaylist.param("need_playlist", i);
            audioGetPlaylist.param("audio_offset", this.audioOffset);
            audioGetPlaylist.param("audio_count", this.audioCount);
            audioGetPlaylist.param("access_key", this.accessKey);
            return audioGetPlaylist;
        }
    }
}
