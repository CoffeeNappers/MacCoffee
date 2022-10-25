package com.vkontakte.android.api.audio;

import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class AudioSearchOld extends ListAPIRequest<MusicTrack> {
    public AudioSearchOld(String q) {
        super("audio.search", MusicTrack.class);
        param("q", q);
        param(ServerKeys.COUNT, 200);
    }
}
