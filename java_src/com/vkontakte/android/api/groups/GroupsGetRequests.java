package com.vkontakte.android.api.groups;

import com.facebook.GraphRequest;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class GroupsGetRequests extends ListAPIRequest<UserProfile> {
    public GroupsGetRequests(int gid, int offset, int count) {
        super("groups.getRequests", UserProfile.class);
        param(GraphRequest.FIELDS_PARAM, "photo_50,photo_100,city,education");
        param("group_id", gid).param("offset", offset).param(ServerKeys.COUNT, count);
    }
}
