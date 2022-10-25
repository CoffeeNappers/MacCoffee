package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class PhotosDeleteAlbum extends ResultlessAPIRequest {
    public PhotosDeleteAlbum(int aid, int gid) {
        super("photos.deleteAlbum");
        param("album_id", aid);
        if (gid > 0) {
            param("group_id", gid);
        }
    }
}
