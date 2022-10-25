package com.vkontakte.android.api.photos;

import com.vkontakte.android.Photo;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class PhotosGetUserPhotos extends ListAPIRequest<Photo> {
    public PhotosGetUserPhotos(int oid, int offset, int count) {
        super("photos.getUserPhotos", Photo.class);
        param("user_id", oid).param("offset", offset).param(ServerKeys.COUNT, count).param("extended", 1).param("sort", "desc").param(ServerKeys.PHOTO_SIZES, 1);
    }
}
