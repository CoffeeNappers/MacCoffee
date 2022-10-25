package com.vkontakte.android.api.audio;

import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class AudioGetRecommendations extends ListAPIRequest<MusicTrack> {
    public AudioGetRecommendations(int uid) {
        super("audio.getRecommendations", MusicTrack.class);
        param("user_id", uid);
        param(ServerKeys.COUNT, 200);
    }

    public AudioGetRecommendations(int count, String targetMid) {
        super("audio.getRecommendations", MusicTrack.class);
        param(ServerKeys.COUNT, count);
        param("target_audio", targetMid);
    }
}
