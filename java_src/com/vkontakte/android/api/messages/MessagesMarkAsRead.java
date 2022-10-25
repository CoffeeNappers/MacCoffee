package com.vkontakte.android.api.messages;

import android.text.TextUtils;
import com.vkontakte.android.api.ResultlessAPIRequest;
import java.util.List;
/* loaded from: classes2.dex */
public class MessagesMarkAsRead extends ResultlessAPIRequest {
    public MessagesMarkAsRead(List<Integer> mids) {
        super("messages.markAsRead");
        param("message_ids", TextUtils.join(",", mids));
    }

    public MessagesMarkAsRead(int peer, int mid) {
        super("messages.markAsRead");
        param("message_ids", mid).param("peer_id", peer);
    }
}
