package com.vkontakte.android.api.apps;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class SDKAppSendRequest extends VKAPIRequest<Integer> {
    public SDKAppSendRequest(int user_id, String message, String photo, int app_id) {
        super("apps.sendRequest");
        param("user_id", user_id);
        param("message", message);
        param(ServerKeys.TYPE, "invite");
        param("attachment", "photo" + photo);
        param("id", app_id);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject r) {
        return Integer.valueOf(r.optInt(ServerKeys.RESPONSE));
    }
}
