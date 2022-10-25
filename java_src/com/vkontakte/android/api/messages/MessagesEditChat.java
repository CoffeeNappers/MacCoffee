package com.vkontakte.android.api.messages;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class MessagesEditChat extends ResultlessAPIRequest {
    public MessagesEditChat(int chatID, String title) {
        super("messages.editChat");
        param("chat_id", chatID).param("title", title);
    }
}
