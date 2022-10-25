package com.vkontakte.android.api.groups;

import com.facebook.appevents.AppEventsConstants;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class GroupsBanUser extends ResultlessAPIRequest {
    public GroupsBanUser(int groupID, int userID, boolean ban, int endDate, int reason, String comment, boolean commentVisible) {
        super(ban ? "groups.banUser" : "groups.unbanUser");
        param("group_id", groupID);
        param("user_id", userID);
        if (ban) {
            param(FirebaseAnalytics.Param.END_DATE, endDate + "");
            param("reason", reason + "");
            param("comment", comment);
            param("comment_visible", commentVisible ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        }
    }
}
