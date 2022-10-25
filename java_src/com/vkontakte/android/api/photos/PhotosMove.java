package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class PhotosMove extends ResultlessAPIRequest {
    public PhotosMove(int oid, int pid, int aid) {
        super("photos.move");
        param("photo_id", pid).param("owner_id", oid).param("target_album_id", aid);
    }
}
