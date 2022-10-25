package com.vkontakte.android.api.audio;

import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AudioGetLyrics extends VKAPIRequest<Result> {
    int lid;

    /* loaded from: classes2.dex */
    public static class Result {
        public int id;
        public String text;
    }

    public AudioGetLyrics(int id) {
        super("audio.getLyrics");
        param(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_LYRICS_ID, id);
        this.lid = id;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            Result res = new Result();
            res.text = o.getJSONObject(ServerKeys.RESPONSE).getString("text");
            res.id = this.lid;
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
