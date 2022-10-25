package com.vkontakte.android.api.users;

import com.facebook.GraphRequest;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class UsersGetFollowers extends ListAPIRequest<UserProfile> {
    public UsersGetFollowers(int uid, int offset, int count) {
        super("users.getFollowers", UserProfile.class);
        param(GraphRequest.FIELDS_PARAM, "online,photo_100,photo_200,photo_50");
        param("user_id", uid);
        param("offset", offset);
        param(ServerKeys.COUNT, count);
    }
}
