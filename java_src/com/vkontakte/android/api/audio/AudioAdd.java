package com.vkontakte.android.api.audio;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AudioAdd extends VKAPIRequest<Integer> {
    public AudioAdd(MusicTrack musicTrack) {
        super("audio.add");
        param("owner_id", musicTrack.oid);
        param("audio_id", musicTrack.aid);
    }

    public AudioAdd(int oid, int aid, int gid) {
        super("audio.add");
        param("owner_id", oid);
        param("audio_id", aid);
        if (gid != 0) {
            param("group_id", gid);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            return Integer.valueOf(o.getInt(ServerKeys.RESPONSE));
        } catch (Exception e) {
            return 0;
        }
    }
}
