package com.vkontakte.android.api.apps;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class HideNotificationRequest extends ResultlessAPIRequest {
    public HideNotificationRequest(boolean isAccept, int notificationId) {
        super("internal.hideUserNotification");
        param("notification_id", notificationId);
        param("reason", isAccept ? "accept" : "decline");
    }
}
