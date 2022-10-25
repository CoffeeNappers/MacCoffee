package com.vkontakte.android.api.audio;

import com.google.android.exoplayer2.util.MimeTypes;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AudioSave extends VKAPIRequest<MusicTrack> {
    public AudioSave(String audio, String hash, String server) {
        super("audio.save");
        param(MimeTypes.BASE_TYPE_AUDIO, audio);
        param(SettingsJsonConstants.ICON_HASH_KEY, hash);
        param("server", server);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public MusicTrack mo1093parse(JSONObject o) {
        try {
            return new MusicTrack(o.getJSONObject(ServerKeys.RESPONSE));
        } catch (Exception x) {
            Log.w("Vk", x);
            return null;
        }
    }
}
