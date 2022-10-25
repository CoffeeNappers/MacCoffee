package com.vkontakte.android.api.groups;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class GroupsApproveRequest extends ResultlessAPIRequest {
    public GroupsApproveRequest(int gid, int uid) {
        super("groups.approveRequest");
        param("group_id", gid);
        param("user_id", uid);
    }
}
