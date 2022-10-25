package com.vkontakte.android.api.wall;

import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class WallDelete extends ResultlessAPIRequest {
    private static final String[] methods = {"wall.delete", "photos.delete", "video.delete"};

    public WallDelete(int ownerID, int postID, int type) {
        super(methods[type]);
        if (type == 0) {
            param("owner_id", ownerID).param(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, postID);
        }
        if (type == 1) {
            param("owner_id", ownerID).param("photo_id", postID);
        }
        if (type == 2) {
            param("owner_id", ownerID).param("video_id", postID);
        }
    }
}
