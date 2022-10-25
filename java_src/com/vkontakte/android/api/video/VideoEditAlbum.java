package com.vkontakte.android.api.video;

import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class VideoEditAlbum extends ResultlessAPIRequest {
    public VideoEditAlbum(int ownerID, int albumID, String title, String privacy) {
        super("video.editAlbum");
        if (ownerID < 0) {
            param("group_id", -ownerID);
        }
        param("title", title);
        param(ShareConstants.WEB_DIALOG_PARAM_PRIVACY, privacy);
        param("album_id", albumID);
    }
}
