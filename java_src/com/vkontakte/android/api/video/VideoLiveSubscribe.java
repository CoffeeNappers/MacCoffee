package com.vkontakte.android.api.video;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class VideoLiveSubscribe extends ResultlessAPIRequest {
    public VideoLiveSubscribe(int ownerId, boolean subscribe) {
        super(subscribe ? "video.liveSubscribe" : "video.liveUnsubscribe");
        param("owner_id", ownerId);
    }
}
