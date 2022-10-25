package com.vkontakte.android.api.friends;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class FriendsHideSuggestion extends ResultlessAPIRequest {
    public FriendsHideSuggestion(int userID) {
        super("friends.hideSuggestion");
        param("user_id", userID);
    }
}
