package com.vkontakte.android.api.groups;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class GroupsEditLink extends ResultlessAPIRequest {
    public GroupsEditLink(int gid, int lid, String text) {
        super("groups.editLink");
        param("group_id", gid);
        param("link_id", lid);
        param("text", text);
    }
}
