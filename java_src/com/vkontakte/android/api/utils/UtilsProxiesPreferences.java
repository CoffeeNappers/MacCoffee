package com.vkontakte.android.api.utils;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.Map;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class UtilsProxiesPreferences extends VKAPIRequest<Result> {
    public static final int TYPE_NO_PROXY = 1;
    public static final int TYPE_NO_PROXY_WITH_MESSAGE = 3;
    public static final int TYPE_USE_PROXY = 2;
    public static final int TYPE_USE_PROXY_WITH_MESSAGE = 4;

    /* loaded from: classes2.dex */
    public static class Result {
        public String button;
        public String message;
        public String title;
        public int type;
        public String url;
    }

    public UtilsProxiesPreferences(String uid, Map<String, String> info) {
        super("utils.getProxiesPreferences");
        param("user_id", uid);
        param("log_info", new JSONObject(info).toString());
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        JSONObject r2 = r.getJSONObject(ServerKeys.RESPONSE);
        Result res = new Result();
        res.type = r2.getInt(ServerKeys.TYPE);
        if (res.type == 3 || res.type == 4) {
            try {
                res.title = r2.getString("title");
                res.message = r2.getString("message");
                res.button = r2.getString(ServerKeys.BUTTON);
                res.url = r2.getString("url");
            } catch (Exception e) {
            }
        }
        return res;
    }
}
