package com.vkontakte.android.api.newsfeed;

import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes2.dex */
public class NewsfeedUnsubscribe extends ResultlessAPIRequest {
    public NewsfeedUnsubscribe(int oid, int id, int type) {
        super("newsfeed.unsubscribe");
        param("owner_id", oid).param(FirebaseAnalytics.Param.ITEM_ID, id);
        switch (type) {
            case 1:
                param(ServerKeys.TYPE, "photo");
                return;
            case 2:
                param(ServerKeys.TYPE, "video");
                return;
            case 3:
                param(ServerKeys.TYPE, "note");
                return;
            case 4:
                param(ServerKeys.TYPE, "topic");
                return;
            default:
                param(ServerKeys.TYPE, ArgKeys.POST);
                return;
        }
    }
}
