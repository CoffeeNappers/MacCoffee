package com.vkontakte.android.api.fave;

import com.vkontakte.android.Photo;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class FaveGetPhotos extends ListAPIRequest<Photo> {
    public FaveGetPhotos(int offset, int count) {
        super("fave.getPhotos", Photo.class);
        param("offset", offset).param(ServerKeys.COUNT, count);
        param(ServerKeys.PHOTO_SIZES, 1);
    }
}
