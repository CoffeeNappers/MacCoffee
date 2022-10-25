package com.vkontakte.android.api.photos;

import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class PhotosEdit extends ResultlessAPIRequest {
    public PhotosEdit(int oid, int pid, String descr) {
        super("photos.edit");
        param("owner_id", oid).param("photo_id", pid).param(ShareConstants.FEED_CAPTION_PARAM, descr);
    }
}
