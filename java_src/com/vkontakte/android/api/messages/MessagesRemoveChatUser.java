package com.vkontakte.android.api.messages;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class MessagesRemoveChatUser extends ResultlessAPIRequest {
    public MessagesRemoveChatUser(int chatID, int userID) {
        super("messages.removeChatUser");
        param("chat_id", chatID).param("user_id", userID);
    }
}
