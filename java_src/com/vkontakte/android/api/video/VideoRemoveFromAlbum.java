package com.vkontakte.android.api.video;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class VideoRemoveFromAlbum extends ResultlessAPIRequest {
    public VideoRemoveFromAlbum(int ownerID, int videoID, int targetID, int albumID) {
        super("video.removeFromAlbum");
        param("owner_id", ownerID);
        param("album_id", albumID);
        param("target_id", targetID);
        param("video_id", videoID);
    }
}
