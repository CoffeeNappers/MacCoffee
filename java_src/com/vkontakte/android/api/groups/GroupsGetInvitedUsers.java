package com.vkontakte.android.api.groups;

import com.facebook.GraphRequest;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class GroupsGetInvitedUsers extends ListAPIRequest<UserProfile> {
    public GroupsGetInvitedUsers(int gid, int offset, int count) {
        super("groups.getInvitedUsers", UserProfile.class);
        param("group_id", gid);
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_200,photo_50,education,city");
        param("offset", offset);
        param(ServerKeys.COUNT, count);
    }
}
