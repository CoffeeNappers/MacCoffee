package com.vkontakte.android.api.photos;

import com.vkontakte.android.Photo;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class PhotosGetAll extends ListAPIRequest<Photo> {
    public PhotosGetAll(int oid, int offset, int count) {
        this(oid, offset, count, false);
    }

    public PhotosGetAll(int oid, int offset, int count, boolean skipHidden) {
        super("photos.getAll", Photo.class);
        param("owner_id", oid).param("offset", offset).param(ServerKeys.COUNT, count).param("extended", 1);
        param(ServerKeys.PHOTO_SIZES, 1);
        if (skipHidden) {
            param("skip_hidden", 1);
        } else {
            param("need_hidden", 1);
        }
    }
}
