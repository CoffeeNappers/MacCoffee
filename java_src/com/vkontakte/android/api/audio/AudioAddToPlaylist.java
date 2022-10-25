package com.vkontakte.android.api.audio;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.vk.music.dto.Playlist;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.data.ServerKeys;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class AudioAddToPlaylist extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static final class Result {
        public int[] ids;
        public Playlist playlist;
    }

    /* loaded from: classes2.dex */
    public static final class Builder {
        @NonNull
        final List<String> audioIds = new LinkedList();
        int ownerId;
        int playlistId;

        public Builder ownerId(int val) {
            this.ownerId = val;
            return this;
        }

        public Builder playlistId(int val) {
            this.playlistId = val;
            return this;
        }

        public Builder addAudio(MusicTrack musicTrack) {
            this.audioIds.add(musicTrack.getSecureUid());
            return this;
        }

        public AudioAddToPlaylist build() {
            return new AudioAddToPlaylist(this);
        }
    }

    private AudioAddToPlaylist(Builder builder) {
        super("execute.addAudioToPlaylist");
        param("owner_id", builder.ownerId);
        param(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_PLAY_LIST_ID, builder.playlistId);
        param("audio_ids", TextUtils.join(",", builder.audioIds));
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        Result result = new Result();
        JSONObject jResponse = r.getJSONObject(ServerKeys.RESPONSE);
        JSONArray jNewIds = jResponse.getJSONArray("result");
        if (jNewIds != null) {
            int[] newIds = new int[jNewIds.length()];
            for (int i = 0; i < newIds.length; i++) {
                newIds[i] = jNewIds.getJSONObject(i).getInt("audio_id");
            }
            result.ids = newIds;
        } else {
            result.ids = new int[0];
        }
        result.playlist = new Playlist(jResponse.getJSONObject("playlist"));
        return result;
    }
}
