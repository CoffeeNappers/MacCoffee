package com.vkontakte.android.api.apps;

import com.vkontakte.android.api.ResultlessAPIRequest;
import java.util.List;
/* loaded from: classes2.dex */
public class AppsDeleteRequest extends ResultlessAPIRequest {
    public AppsDeleteRequest(int[] ids) {
        super("apps.deleteRequest");
        params("request_ids", ids);
    }

    public AppsDeleteRequest(List<Integer> ids) {
        super("apps.deleteRequest");
        params("request_ids", ids);
    }
}
