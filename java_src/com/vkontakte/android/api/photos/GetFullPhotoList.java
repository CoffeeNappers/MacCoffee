package com.vkontakte.android.api.photos;

import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.Photo;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class GetFullPhotoList extends ListAPIRequest<Photo> {
    Callback callback;

    public GetFullPhotoList(NewsEntry e) {
        super("photos.get", Photo.class);
        String str;
        param("feed", e.time);
        if (e.type == 7) {
            str = "photo_tag";
        } else {
            str = e.type == 9 ? "wall_photo" : "photo";
        }
        param("feed_type", str);
        param(e.userID > 0 ? "user_id" : "group_id", Math.abs(e.userID));
        param("extended", 1);
        param(ServerKeys.PHOTO_SIZES, 1);
    }
}
