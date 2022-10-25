package com.vkontakte.android.api.store;

import com.facebook.GraphRequest;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class StoreGetFriendsList extends ListAPIRequest<UserProfile> {
    public StoreGetFriendsList(int product_id) {
        super("store.getFriendsList", UserProfile.class);
        param(ServerKeys.TYPE, "stickers");
        param("source_ids", "friends");
        param(ServerKeys.COUNT, 5000);
        param("product_id", product_id);
        param("extended", 1);
        param(GraphRequest.FIELDS_PARAM, "photo_200,photo_100,photo_50,online");
    }
}
