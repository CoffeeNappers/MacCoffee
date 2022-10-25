package com.vkontakte.android.api.audio;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AudioGetUrlForPlay extends VKAPIRequest<MusicTrack> {
    public AudioGetUrlForPlay(String mid) {
        super("audio.getById");
        param("audios", mid);
        L.e(this, mid);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public MusicTrack mo1093parse(JSONObject r) throws Exception {
        try {
            return new MusicTrack(r.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0));
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return null;
        }
    }
}
