package com.vkontakte.android.api.groups;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class GroupsInvite extends ResultlessAPIRequest {
    public GroupsInvite(int gid, int uid) {
        super("groups.invite");
        param("group_id", gid);
        param("user_id", uid);
    }
}
