package com.vkontakte.android.api.wall;

import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class WallSetFixed extends ResultlessAPIRequest {
    public WallSetFixed(int postID, int ownerID, boolean fixed) {
        super(fixed ? "wall.pin" : "wall.unpin");
        param(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, postID).param("owner_id", ownerID);
    }
}
