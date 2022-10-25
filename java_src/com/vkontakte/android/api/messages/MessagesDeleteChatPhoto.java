package com.vkontakte.android.api.messages;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesDeleteChatPhoto extends VKAPIRequest<Integer> {
    public MessagesDeleteChatPhoto(int cid) {
        super("messages.deleteChatPhoto");
        param("chat_id", cid);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            return Integer.valueOf(o.getJSONObject(ServerKeys.RESPONSE).getInt("message_id"));
        } catch (Exception e) {
            return null;
        }
    }
}
