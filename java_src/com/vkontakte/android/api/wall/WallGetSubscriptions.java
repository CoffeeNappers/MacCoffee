package com.vkontakte.android.api.wall;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class WallGetSubscriptions extends ListAPIRequest<UserProfile> {
    public WallGetSubscriptions(int offset, int count) {
        super("execute.getWallSubscriptions", UserProfile.class);
        param("offset", offset);
        param(ServerKeys.COUNT, count);
    }
}
