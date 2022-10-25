package com.vkontakte.android.api.audio;

import com.vk.music.dto.PlaylistLink;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class AudioFollowPlaylist extends VKAPIRequest<PlaylistLink> {
    public AudioFollowPlaylist(int playlistId, int ownerId, String accessKey) {
        super("audio.followPlaylist");
        param(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_PLAY_LIST_ID, playlistId);
        param("owner_id", ownerId);
        if (accessKey != null) {
            param("access_key", accessKey);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public PlaylistLink mo1093parse(JSONObject r) throws Exception {
        return new PlaylistLink(r.optJSONObject(ServerKeys.RESPONSE));
    }
}
