package com.vkontakte.android.api.audio;

import android.text.TextUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AudioGetById extends VKAPIRequest<ArrayList<MusicTrack>> {
    public AudioGetById(List<String> audios) {
        super("audio.getById");
        param("audios", TextUtils.join(",", audios));
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public ArrayList<MusicTrack> mo1093parse(JSONObject o) {
        try {
            ArrayList<MusicTrack> files = new ArrayList<>();
            JSONArray a = o.optJSONArray(ServerKeys.RESPONSE);
            if (a == null) {
                return files;
            }
            for (int i = 0; i < a.length(); i++) {
                JSONObject f = a.getJSONObject(i);
                MusicTrack af = new MusicTrack(f);
                files.add(af);
            }
            return files;
        } catch (Exception e) {
            return null;
        }
    }
}
