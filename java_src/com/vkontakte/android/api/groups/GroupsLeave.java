package com.vkontakte.android.api.groups;

import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.data.Groups;
/* loaded from: classes2.dex */
public class GroupsLeave extends ResultlessAPIRequest {
    public GroupsLeave(int gid) {
        super("groups.leave");
        param("group_id", gid);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    public void invokeCallback(Object result) {
        super.invokeCallback(result);
        Groups.reload(true);
    }
}
