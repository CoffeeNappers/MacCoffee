package com.vkontakte.android.api.fave;

import com.facebook.GraphRequest;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class FaveGetUsers extends ListAPIRequest<UserProfile> {
    public FaveGetUsers(int offset, int count) {
        super("fave.getUsers", UserProfile.class);
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_200,photo_50,online");
        param("offset", offset).param(ServerKeys.COUNT, count);
    }
}
