package com.vkontakte.android.api.audio;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.music.dto.Playlist;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.SavedTrack;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class AudioGetMusicPage extends VKAPIRequest<Result> {
    final boolean loadSaved;

    /* loaded from: classes2.dex */
    public static final class Result {
        public VKList<MusicTrack> musicTracks;
        public String ownerImage;
        public String ownerName;
        public VKList<Playlist> playlists;
        public Playlist savedAudios;
    }

    private AudioGetMusicPage(@NonNull Builder builder) {
        super("execute.getMusicPage");
        param("owner_id", String.valueOf(builder.ownerId));
        param("need_owner", builder.needOwner ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        if (builder.needPlaylists) {
            param("need_playlists", AppEventsConstants.EVENT_PARAM_VALUE_YES);
            param("playlists_count", String.valueOf(builder.playlistsCount));
        } else {
            param("need_playlists", AppEventsConstants.EVENT_PARAM_VALUE_NO);
        }
        param("audio_offset", String.valueOf(builder.audioOffset));
        param("audio_count", String.valueOf(builder.audioCount));
        this.loadSaved = builder.loadSaved;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        JSONObject jResponse = r.getJSONObject(ServerKeys.RESPONSE);
        Result result = new Result();
        JSONObject jOwner = jResponse.optJSONObject("owner");
        if (jOwner != null) {
            if (jOwner.has("first_name") && jOwner.has("last_name")) {
                result.ownerName = jOwner.getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + jOwner.getString("last_name");
            } else if (jOwner.has("name")) {
                result.ownerImage = jOwner.getString("name");
            }
            result.ownerImage = parseImage(jOwner);
        }
        JSONObject jPlaylists = jResponse.optJSONObject("playlists");
        if (jPlaylists != null) {
            result.playlists = new VKList<>(jPlaylists, Playlist.class);
        }
        JSONObject jAudios = jResponse.optJSONObject("audios");
        if (jAudios != null) {
            result.musicTracks = new VKList<>(jAudios, MusicTrack.class);
        } else {
            result.musicTracks = new VKList<>();
        }
        if (this.loadSaved) {
            int savedCount = SavedTrack.PROVIDER.getCount();
            if (savedCount > 0) {
                String title = VKApplication.context.getString(R.string.music_saved_playlist);
                result.savedAudios = new Playlist(title, VKAccountManager.getCurrent().getUid(), 2);
            }
        }
        return result;
    }

    private static String parseImage(JSONObject jOwner) {
        String[] strArr;
        for (String s : new String[]{"photo_200", "photo_100", "photo_50"}) {
            String url = jOwner.optString(s);
            if (!TextUtils.isEmpty(url)) {
                return url;
            }
        }
        return null;
    }

    /* loaded from: classes2.dex */
    public static final class Builder {
        int audioCount;
        int audioOffset;
        boolean loadSaved;
        boolean needOwner;
        boolean needPlaylists;
        final int ownerId;
        int playlistsCount;

        public Builder(int ownerId) {
            this.ownerId = ownerId;
        }

        public Builder needOwner(boolean needOwner) {
            this.needOwner = needOwner;
            return this;
        }

        public Builder needPlaylists(boolean needPlaylists) {
            this.needPlaylists = needPlaylists;
            return this;
        }

        public Builder playlistsCount(int playlistsCount) {
            this.playlistsCount = playlistsCount;
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

        public Builder loadSaved(boolean loadSaved) {
            this.loadSaved = loadSaved;
            return this;
        }

        public AudioGetMusicPage build() {
            return new AudioGetMusicPage(this);
        }
    }
}
