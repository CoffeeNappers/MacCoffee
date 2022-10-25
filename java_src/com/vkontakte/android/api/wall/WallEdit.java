package com.vkontakte.android.api.wall;

import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class WallEdit extends ResultlessAPIRequest {
    public WallEdit(int postID, int oid, String text) {
        super("wall.edit");
        param("owner_id", oid);
        param(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, postID);
        param("message", text);
    }
}
