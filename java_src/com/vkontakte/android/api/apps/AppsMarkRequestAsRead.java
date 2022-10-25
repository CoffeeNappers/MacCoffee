package com.vkontakte.android.api.apps;

import com.vkontakte.android.api.ResultlessAPIRequest;
import java.util.List;
/* loaded from: classes2.dex */
public class AppsMarkRequestAsRead extends ResultlessAPIRequest {
    public AppsMarkRequestAsRead(List<Integer> ids) {
        super("apps.markRequestAsRead");
        params("request_ids", ids);
    }
}
