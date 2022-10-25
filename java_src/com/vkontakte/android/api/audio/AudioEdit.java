package com.vkontakte.android.api.audio;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AudioEdit extends VKAPIRequest<Integer> {
    public AudioEdit(MusicTrack audio, String newName, String newArtist) {
        super("audio.edit");
        param("owner_id", audio.oid);
        param("audio_id", audio.aid);
        param("title", newName);
        param("artist", newArtist);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        return Integer.valueOf(o.optInt(ServerKeys.RESPONSE, -1));
    }
}
