package com.vkontakte.android.api.groups;

import com.facebook.GraphRequest;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
/* loaded from: classes2.dex */
public class GroupsGetMembers extends ListAPIRequest<UserProfile> {
    public GroupsGetMembers(int gid, int offset, int count, String filter) {
        super("groups.getMembers", UserProfile.class);
        param(GraphRequest.FIELDS_PARAM, "online,photo_50,photo_200,photo_100");
        param("group_id", gid).param("offset", offset).param(ServerKeys.COUNT, count);
        if (filter != null) {
            param(MoneyTransfersFragment.FILTER_ARGUMENT, filter);
        }
    }
}
