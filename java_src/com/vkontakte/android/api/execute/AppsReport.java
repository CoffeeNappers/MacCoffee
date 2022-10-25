package com.vkontakte.android.api.execute;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class AppsReport extends ResultlessAPIRequest {
    public AppsReport(int ownerID, int appId, int reason) {
        super("apps.report");
        param("owner_id", ownerID);
        param("app_id", appId);
        param("reason", reason);
    }
}
