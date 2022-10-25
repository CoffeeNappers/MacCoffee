package com.vkontakte.android.api.friends;

import android.text.TextUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKFromList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class FriendsGetRecommendations extends VKAPIRequest<VKFromList<UserProfile>> {
    public FriendsGetRecommendations(String from, int count) {
        super("friends.getRecommendations");
        if (!TextUtils.isEmpty(from)) {
            param(ServerKeys.START_FROM, from);
        }
        param(ServerKeys.COUNT, count);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKFromList<UserProfile> mo1093parse(JSONObject r) throws Exception {
        VKFromList<UserProfile> res = new VKFromList<>(r.getJSONObject(ServerKeys.RESPONSE).optString("next_from"));
        JSONArray ja = r.getJSONObject(ServerKeys.RESPONSE).getJSONArray(ServerKeys.ITEMS);
        for (int i = 0; i < ja.length(); i++) {
            res.add(new UserProfile(ja.getJSONObject(i)));
        }
        return res;
    }
}
