package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class PhotosMakeCover extends ResultlessAPIRequest {
    public PhotosMakeCover(int oid, int pid, int aid) {
        super("photos.makeCover");
        param("owner_id", oid).param("photo_id", pid).param("album_id", aid);
    }
}
