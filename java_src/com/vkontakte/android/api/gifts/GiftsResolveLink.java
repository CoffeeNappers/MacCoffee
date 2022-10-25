package com.vkontakte.android.api.gifts;

import com.facebook.GraphRequest;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.gifts.GiftsGet;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GiftsResolveLink extends VKAPIRequest<GiftsGet.UserProfile> {
    public GiftsResolveLink(String user_id) {
        super("users.get");
        param(ServerKeys.USER_IDS, user_id);
        param(GraphRequest.FIELDS_PARAM, "can_see_gifts,first_name_gen");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public GiftsGet.UserProfile mo1093parse(JSONObject r) throws Exception {
        return new GiftsGet.UserProfile(r.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0));
    }
}
