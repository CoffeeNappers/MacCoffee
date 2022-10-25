package com.vkontakte.android.api.groups;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class GroupsReorderLink extends ResultlessAPIRequest {
    public GroupsReorderLink(int gid, int lid, int after) {
        super("groups.reorderLink");
        param("group_id", gid);
        param("link_id", lid);
        param("after", after);
    }
}
