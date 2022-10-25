package com.vkontakte.android.api.execute;

import android.text.TextUtils;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class ContentReport extends ResultlessAPIRequest {
    public ContentReport(int ownerID, int itemID, String type, String refer, int reason, String trackCode) {
        super("execute.reportContent");
        param("owner_id", ownerID);
        param(FirebaseAnalytics.Param.ITEM_ID, itemID);
        param(ServerKeys.TYPE, type);
        param("reason", reason);
        param("func_v", 2);
        param("ref", refer == null ? "" : refer);
        if (!TextUtils.isEmpty(trackCode)) {
            param("track_code", trackCode);
        }
    }
}
