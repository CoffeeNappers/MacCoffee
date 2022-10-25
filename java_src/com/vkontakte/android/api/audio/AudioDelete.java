package com.vkontakte.android.api.audio;

import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
/* loaded from: classes2.dex */
public class AudioDelete extends ResultlessAPIRequest {
    public AudioDelete(MusicTrack musicTrack) {
        super("audio.delete");
        param("owner_id", musicTrack.oid);
        param("audio_id", musicTrack.aid);
    }
}
