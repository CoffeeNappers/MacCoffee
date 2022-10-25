package com.vkontakte.android.api.groups;

import com.facebook.GraphRequest;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class GroupsSearch extends ListAPIRequest<Group> {
    public GroupsSearch(String q, int offset, int count) {
        super("groups.search", Group.class);
        param("q", q).param("offset", offset).param(ServerKeys.COUNT, count);
        param(GraphRequest.FIELDS_PARAM, "start_date,members_count,verified");
    }
}
