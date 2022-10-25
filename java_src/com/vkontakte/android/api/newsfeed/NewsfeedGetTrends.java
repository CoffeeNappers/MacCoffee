package com.vkontakte.android.api.newsfeed;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class NewsfeedGetTrends extends VKAPIRequest<String[]> implements ServerKeys {
    public NewsfeedGetTrends() {
        super("search.getTrends");
        param(ServerKeys.COUNT, 10);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public String[] mo1093parse(JSONObject r) throws Exception {
        try {
            JSONArray array = r.getJSONObject(ServerKeys.RESPONSE).getJSONArray(ServerKeys.ITEMS);
            String[] strings = new String[array.length()];
            for (int i = 0; i < array.length(); i++) {
                strings[i] = array.getJSONObject(i).getString("name");
            }
            return strings;
        } catch (Exception e) {
            L.e(e, new Object[0]);
            return null;
        }
    }
}
