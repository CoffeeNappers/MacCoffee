package com.vkontakte.android.api.wall;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class WallDeleteComment extends ResultlessAPIRequest {
    private static final String[] methods = {"wall.deleteComment", "photos.deleteComment", "video.deleteComment"};

    public WallDeleteComment(int oid, int pid, int cid, int type, String accessKey) {
        super(methods[type]);
        if (type == 0) {
            param("owner_id", oid).param("comment_id", cid);
        }
        if (type == 1) {
            param("owner_id", oid).param("comment_id", cid).param("photo_id", pid);
        }
        if (type == 2) {
            param("owner_id", oid).param("comment_id", cid);
        }
        if (accessKey != null) {
            param("access_key", accessKey);
        }
    }
}
