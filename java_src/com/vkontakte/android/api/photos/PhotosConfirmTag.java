package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class PhotosConfirmTag extends ResultlessAPIRequest {
    public PhotosConfirmTag(int ownerID, int photoID, int tagID) {
        super("photos.confirmTag");
        param("owner_id", ownerID);
        param("photo_id", photoID);
        param("tag_id", tagID);
    }
}
