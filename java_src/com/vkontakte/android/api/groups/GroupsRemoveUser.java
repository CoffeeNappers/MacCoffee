package com.vkontakte.android.api.groups;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class GroupsRemoveUser extends ResultlessAPIRequest {
    public GroupsRemoveUser(int gid, int uid) {
        super("groups.removeUser");
        param("group_id", gid);
        param("user_id", uid);
    }
}
