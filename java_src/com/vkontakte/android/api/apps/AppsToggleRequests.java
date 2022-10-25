package com.vkontakte.android.api.apps;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class AppsToggleRequests extends ResultlessAPIRequest {
    public AppsToggleRequests(int id, boolean enable) {
        super("apps.toggleRequests");
        param("id", id);
        param("enabled", enable ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
    }
}
