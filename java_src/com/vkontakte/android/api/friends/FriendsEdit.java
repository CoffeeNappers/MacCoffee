package com.vkontakte.android.api.friends;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class FriendsEdit extends ResultlessAPIRequest {
    public FriendsEdit(int userID, String lists) {
        super("friends.edit");
        param("user_id", userID);
        param("list_ids", lists);
    }
}
