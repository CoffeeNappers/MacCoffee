package com.vkontakte.android.api.messages;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class MessagesAddChatUser extends ResultlessAPIRequest {
    public MessagesAddChatUser(int chatID, int userID) {
        super("messages.addChatUser");
        param("chat_id", chatID).param("user_id", userID);
    }
}
