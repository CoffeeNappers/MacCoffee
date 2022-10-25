package com.vkontakte.android.api.messages;

import com.facebook.common.util.UriUtil;
import com.vkontakte.android.api.ResultlessAPIRequest;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesSetChatPhoto extends ResultlessAPIRequest {
    public MessagesSetChatPhoto(int chatID, String file) {
        super("messages.setChatPhoto");
        param("chat_id", chatID);
        param(UriUtil.LOCAL_FILE_SCHEME, file);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.ResultlessAPIRequest, com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Boolean mo1093parse(JSONObject r) {
        return super.mo1093parse(r);
    }
}
