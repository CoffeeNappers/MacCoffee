package com.vkontakte.android.api.messages;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class MessagesDenyFromGroup extends ResultlessAPIRequest {
    public MessagesDenyFromGroup(int groupId) {
        super("messages.denyMessagesFromGroup");
        param("group_id", groupId);
    }
}
