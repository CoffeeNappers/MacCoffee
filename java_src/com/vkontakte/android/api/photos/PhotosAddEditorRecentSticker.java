package com.vkontakte.android.api.photos;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class PhotosAddEditorRecentSticker extends ResultlessAPIRequest {
    public PhotosAddEditorRecentSticker(int stickerId) {
        super("photos.addEditorRecentSticker");
        param("sticker_id", stickerId);
    }
}
