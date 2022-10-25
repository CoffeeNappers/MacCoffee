package com.vkontakte.android.api.friends;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class FriendsDelete extends VKAPIRequest<Integer> {
    public FriendsDelete(int uid) {
        super("friends.delete");
        param("user_id", uid);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            return Integer.valueOf(o.getJSONObject(ServerKeys.RESPONSE).getInt("success"));
        } catch (Exception e) {
            return null;
        }
    }
}
