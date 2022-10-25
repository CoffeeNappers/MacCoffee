package com.vkontakte.android.api.apps;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class AppsRemove extends ResultlessAPIRequest {
    public AppsRemove(int id) {
        super("apps.remove");
        param("id", id);
    }
}
