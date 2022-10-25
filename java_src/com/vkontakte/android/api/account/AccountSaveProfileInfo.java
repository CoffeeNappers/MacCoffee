package com.vkontakte.android.api.account;

import android.os.Bundle;
import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AccountSaveProfileInfo extends VKAPIRequest<Result> {
    public AccountSaveProfileInfo(Bundle info) {
        super("execute.saveProfileInfo");
        if (info.containsKey("first_name")) {
            param("first_name", info.getString("first_name"));
            param("last_name", info.getString("last_name"));
        }
        if (info.containsKey("gender")) {
            param("sex", info.getInt("gender"));
        }
        if (info.containsKey("relation")) {
            param("relation", info.getInt("relation") + "");
        }
        if (info.containsKey("relation_partner")) {
            UserProfile p = (UserProfile) info.getParcelable("relation_partner");
            param("relation_partner_id", p != null ? p.uid + "" : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        }
        if (info.containsKey("bday")) {
            param("bdate", info.getInt("bday") + "." + info.getInt("bmonth") + "." + info.getInt("byear"));
        }
        if (info.containsKey("bdate_vis")) {
            param("bdate_visibility", info.getInt("bdate_vis") + "");
        }
        if (info.containsKey("country_id")) {
            param("country_id", info.getInt("country_id") + "");
        }
        if (info.containsKey("city_id")) {
            param("city_id", info.getInt("city_id") + "");
        }
    }

    public AccountSaveProfileInfo(int cancelNameReq) {
        super("account.saveProfileInfo");
        param("cancel_request_id", cancelNameReq);
    }

    public AccountSaveProfileInfo(String screenName) {
        super("account.saveProfileInfo");
        param("screen_name", screenName);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        Result result;
        try {
            JSONObject r = o.getJSONObject(ServerKeys.RESPONSE);
            if (r.has("name_request")) {
                JSONObject nreq = r.getJSONObject("name_request");
                String status = nreq.getString("status");
                if ("processing".equals(status)) {
                    result = new Result(1, 0, null, null);
                } else if ("declined".equals(status)) {
                    result = new Result(2, 0, null, null);
                } else if ("was_accepted".equals(status)) {
                    result = new Result(3, nreq.getInt("repeat_date"), null, null);
                } else if ("was_declined".equals(status)) {
                    result = new Result(4, nreq.getInt("repeat_date"), null, null);
                }
                return result;
            }
            result = new Result(0, 0, r.optString("new_first"), r.optString("new_last"));
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }

    /* loaded from: classes2.dex */
    public static class Result {
        public int nameRetryIn;
        public int nameStatus;
        public String newFirst;
        public String newLast;

        public Result(int nameStatus, int nameRetryIn, String newFirst, String newLast) {
            this.nameStatus = nameStatus;
            this.nameRetryIn = nameRetryIn;
            this.newFirst = newFirst;
            this.newLast = newLast;
        }
    }
}
