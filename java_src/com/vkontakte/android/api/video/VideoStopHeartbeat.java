package com.vkontakte.android.api.video;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class VideoStopHeartbeat extends ResultlessAPIRequest {
    public VideoStopHeartbeat(int ownerID, int videoID) {
        super("video.liveStopHeartbeat");
        param("owner_id", ownerID);
        param("video_id", videoID);
    }
}
