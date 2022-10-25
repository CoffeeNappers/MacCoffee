package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class PhotosDelete extends ResultlessAPIRequest {
    public PhotosDelete(int oid, int pid) {
        super("photos.delete");
        param("owner_id", oid).param("photo_id", pid);
    }
}
