package com.vkontakte.android.api.newsfeed;

import android.text.TextUtils;
import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class NewsfeedAddBan extends ResultlessAPIRequest {
    public NewsfeedAddBan(int id, String refer, String trackCode) {
        super("newsfeed.addBan");
        if (!TextUtils.isEmpty(refer)) {
            param("ref", refer);
        }
        if (!TextUtils.isEmpty(trackCode)) {
            param("track_code", trackCode);
        }
        if (id > 0) {
            param(ServerKeys.USER_IDS, id);
        } else {
            param("group_ids", -id);
        }
    }
}
