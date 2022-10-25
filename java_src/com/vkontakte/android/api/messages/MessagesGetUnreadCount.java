package com.vkontakte.android.api.messages;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesGetUnreadCount extends VKAPIRequest<Integer> {
    public MessagesGetUnreadCount(int peer) {
        super("execute.getUnreadCount");
        param("peer", peer);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            return Integer.valueOf(o.getInt(ServerKeys.RESPONSE));
        } catch (Exception e) {
            return 0;
        }
    }
}
