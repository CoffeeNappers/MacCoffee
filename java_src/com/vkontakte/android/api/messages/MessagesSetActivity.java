package com.vkontakte.android.api.messages;

import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class MessagesSetActivity extends ResultlessAPIRequest {
    public MessagesSetActivity(int peerID) {
        super("messages.setActivity");
        param("user_id", peerID);
        param(ServerKeys.TYPE, "typing");
    }
}
