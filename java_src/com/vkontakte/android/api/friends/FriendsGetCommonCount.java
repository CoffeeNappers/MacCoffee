package com.vkontakte.android.api.friends;

import com.facebook.GraphRequest;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class FriendsGetCommonCount extends VKAPIRequest<Integer> {
    public FriendsGetCommonCount(int user_id) {
        super("users.get");
        param(GraphRequest.FIELDS_PARAM, "common_count");
        param(ServerKeys.USER_IDS, user_id);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject r) throws Exception {
        JSONObject user;
        JSONArray response = r.optJSONArray(ServerKeys.RESPONSE);
        if (response == null || (user = response.optJSONObject(0)) == null) {
            return 0;
        }
        return Integer.valueOf(user.optInt("common_count"));
    }
}
