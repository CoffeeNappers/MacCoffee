package com.vkontakte.android.api.apps;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AppsGet extends VKAPIRequest<ApiApplication> {
    public AppsGet(int appId) {
        super("apps.get");
        param("app_id", appId);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public ApiApplication mo1093parse(JSONObject r) throws Exception {
        return new ApiApplication((JSONObject) r.getJSONObject(ServerKeys.RESPONSE).getJSONArray(ServerKeys.ITEMS).get(0));
    }
}
