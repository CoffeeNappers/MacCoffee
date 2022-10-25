package com.vkontakte.android.api.video;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class VideoLiveHeartbeat extends ResultlessAPIRequest {
    public VideoLiveHeartbeat(int ownerID, int videoID) {
        super("video.liveHeartbeat");
        param("owner_id", ownerID);
        param("video_id", videoID);
        param("spectators_count", 0);
        param("extended", 0);
    }
}
