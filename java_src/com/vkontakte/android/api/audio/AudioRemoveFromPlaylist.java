package com.vkontakte.android.api.audio;

import android.text.TextUtils;
import com.vk.music.dto.Playlist;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.data.ServerKeys;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AudioRemoveFromPlaylist extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static final class Result {
        public Playlist playlist;
        public boolean result;
    }

    /* loaded from: classes2.dex */
    public static final class Builder {
        List<String> audioIds;
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
            if (this.audioIds == null) {
                this.audioIds = new LinkedList();
            }
            this.audioIds.add(musicTrack.getUid());
            return this;
        }

        public AudioRemoveFromPlaylist build() {
            return new AudioRemoveFromPlaylist(this);
        }
    }

    private AudioRemoveFromPlaylist(Builder builder) {
        super("execute.removeAudioFromPlaylist");
        param("owner_id", builder.ownerId);
        param(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_PLAY_LIST_ID, builder.playlistId);
        param("audio_ids", TextUtils.join(",", builder.audioIds));
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        boolean z = true;
        Result result = new Result();
        JSONObject jResponse = r.getJSONObject(ServerKeys.RESPONSE);
        if (jResponse.getInt("result") != 1) {
            z = false;
        }
        result.result = z;
        result.playlist = new Playlist(jResponse.getJSONObject("playlist"));
        return result;
    }
}
