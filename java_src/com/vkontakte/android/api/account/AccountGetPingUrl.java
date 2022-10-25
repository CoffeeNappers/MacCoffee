package com.vkontakte.android.api.account;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AccountGetPingUrl extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public String endpointUrl;
        public boolean isEnabled;
        public long timeInterval;
    }

    public AccountGetPingUrl() {
        super("account.getPingUrl");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        JSONObject data = r.getJSONObject(ServerKeys.RESPONSE);
        Result result = new Result();
        result.isEnabled = data.optBoolean("is_enabled");
        if (result.isEnabled) {
            result.endpointUrl = data.getString("endpoint");
            result.timeInterval = data.getInt("time_interval") * 1000;
        }
        return result;
    }
}
