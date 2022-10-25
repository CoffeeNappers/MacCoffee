package com.vkontakte.android.api.execute;

import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class FindCityByName extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public int cityID;
        public int countryID;
    }

    public FindCityByName(String country, String city) {
        super("execute.findCity");
        param("country", country);
        param("city", city);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            JSONObject r = o.optJSONObject(ServerKeys.RESPONSE);
            Result res = new Result();
            if (r != null) {
                res.cityID = r.getInt("city");
                res.countryID = r.getInt("country");
                return res;
            }
            return res;
        } catch (Exception x) {
            Log.w("Vk", x);
            return null;
        }
    }
}
