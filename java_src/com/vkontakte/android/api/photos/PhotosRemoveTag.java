package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class PhotosRemoveTag extends ResultlessAPIRequest {
    public PhotosRemoveTag(int ownerID, int photoID, int tagID) {
        super("photos.removeTag");
        param("owner_id", ownerID);
        param("photo_id", photoID);
        param("tag_id", tagID);
    }
}
