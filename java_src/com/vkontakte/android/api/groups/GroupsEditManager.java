package com.vkontakte.android.api.groups;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class GroupsEditManager extends ResultlessAPIRequest {
    public GroupsEditManager(int gid, int uid, String role, boolean contact, String contactTitle) {
        super("groups.editManager");
        param("group_id", gid);
        param("user_id", uid);
        param("role", role);
        if (contact) {
            param("is_contact", AppEventsConstants.EVENT_PARAM_VALUE_YES);
            param("contact_position", contactTitle);
            return;
        }
        param("is_contact", AppEventsConstants.EVENT_PARAM_VALUE_NO);
    }
}
