package com.vkontakte.android.api.messages;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class MessagesDeleteDialog extends ResultlessAPIRequest {
    public MessagesDeleteDialog(int peer) {
        super("messages.deleteDialog");
        param("peer_id", peer);
    }
}
