package com.vkontakte.android.api.video;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class VideoDeleteAlbum extends ResultlessAPIRequest {
    public VideoDeleteAlbum(int ownerID, int albumID) {
        super("video.deleteAlbum");
        param("album_id", albumID);
        if (ownerID < 0) {
            param("group_id", -ownerID);
        }
    }
}
