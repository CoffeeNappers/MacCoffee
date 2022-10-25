package com.vkontakte.android.api.groups;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class GroupsDeleteLink extends ResultlessAPIRequest {
    public GroupsDeleteLink(int gid, int lid) {
        super("groups.deleteLink");
        param("group_id", gid);
        param("link_id", lid);
    }
}
