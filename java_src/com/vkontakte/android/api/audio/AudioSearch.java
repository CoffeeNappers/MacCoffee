package com.vkontakte.android.api.audio;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes.dex */
public class AudioSearch extends ListAPIRequest<MusicTrack> {
    public AudioSearch(String q, boolean byArtist, int offset, int count) {
        super("audio.search", MusicTrack.class);
        param("q", q);
        param("search_own", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        param("performer_only", byArtist ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        param("offset", offset);
        param(ServerKeys.COUNT, count);
    }
}
