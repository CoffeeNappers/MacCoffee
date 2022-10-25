package com.vkontakte.android.api.status;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class StatusSet extends ResultlessAPIRequest {
    public StatusSet(String status, int groupID) {
        super("status.set");
        param("text", status);
        if (groupID > 0) {
            param("group_id", groupID);
        }
    }
}
