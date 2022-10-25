package com.vkontakte.android.api.messages;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class MessagesAllowFromGroup extends ResultlessAPIRequest {
    public MessagesAllowFromGroup(int groupId) {
        super("messages.allowMessagesFromGroup");
        param("group_id", groupId);
    }
}
