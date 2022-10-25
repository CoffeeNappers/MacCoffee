package com.vkontakte.android.api.photos;

import com.vkontakte.android.Photo;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class PhotosGet extends ListAPIRequest<Photo> {
    int uid;

    public PhotosGet(int uid, int aid, int offset, int count) {
        this(uid, aid, offset, count, false);
    }

    public PhotosGet(int uid, int aid, int offset, int count, boolean rev) {
        super(aid != 0 ? "photos.get" : "photos.getAll", Photo.class);
        this.uid = uid;
        param("album_id", aid).param("owner_id", uid).param("extended", 1);
        param(ServerKeys.PHOTO_SIZES, 1);
        param("offset", offset).param(ServerKeys.COUNT, count);
        if (rev) {
            param("rev", 1);
        }
    }
}
