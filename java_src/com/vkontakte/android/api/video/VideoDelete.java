package com.vkontakte.android.api.video;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class VideoDelete extends ResultlessAPIRequest {
    private static final String[] methods = {"wall.delete", "photos.delete", ""};

    public VideoDelete(int ownerID, int videoId, int targetId) {
        super("video.delete");
        param("owner_id", ownerID);
        param("video_id", videoId);
        param("target_id", targetId);
    }
}
