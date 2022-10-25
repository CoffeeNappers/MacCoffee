package com.vkontakte.android.api.newsfeed;

import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class NewsfeedDeleteBan extends ResultlessAPIRequest {
    public NewsfeedDeleteBan(int id) {
        super("newsfeed.deleteBan");
        if (id > 0) {
            param(ServerKeys.USER_IDS, id);
        } else {
            param("group_ids", -id);
        }
    }
}
