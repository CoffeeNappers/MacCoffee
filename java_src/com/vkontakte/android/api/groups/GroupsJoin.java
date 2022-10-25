package com.vkontakte.android.api.groups;

import com.vkontakte.android.LongPollService;
import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.data.Groups;
/* loaded from: classes2.dex */
public class GroupsJoin extends ResultlessAPIRequest {
    public static GroupsJoin createGroupsJoinAndSendAllStats(int gid, boolean unsure) {
        LongPollService.sendAnalyticsNow();
        return new GroupsJoin(gid, unsure);
    }

    public GroupsJoin(int gid, boolean unsure) {
        super("groups.join");
        param("group_id", gid);
        if (unsure) {
            param("not_sure", 1);
        }
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    public void invokeCallback(Object result) {
        super.invokeCallback(result);
        Groups.reload(true);
    }
}
