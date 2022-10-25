package com.vkontakte.android.api.account;

import android.os.Bundle;
import com.facebook.GraphRequest;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AccountGetProfileInfo extends VKAPIRequest<Bundle> {
    public static final int MIN_AGE = 14;
    public static final int MIN_BDATE_YEAR = 1901;

    public AccountGetProfileInfo() {
        super("account.getProfileInfo");
        param(GraphRequest.FIELDS_PARAM, "photo_50");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Bundle mo1093parse(JSONObject o) {
        int status = 0;
        try {
            JSONObject r = o.getJSONObject(ServerKeys.RESPONSE);
            Bundle res = new Bundle();
            res.putString("first_name", r.getString("first_name"));
            res.putString("last_name", r.getString("last_name"));
            res.putInt("gender", r.getInt("sex"));
            res.putInt("relation", r.getInt("relation"));
            if (r.has("relation_partner")) {
                JSONObject ju = r.getJSONObject("relation_partner");
                UserProfile user = new UserProfile();
                user.uid = ju.getInt("id");
                user.firstName = ju.getString("first_name");
                user.lastName = ju.getString("last_name");
                user.fullName = user.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + user.lastName;
                user.photo = ju.getString("photo_50");
                res.putParcelable("relation_partner", user);
            }
            String bdate = r.getString("bdate");
            try {
                String[] bd = bdate.split("\\.");
                res.putInt("bday", Integer.parseInt(bd[0]));
                res.putInt("bmonth", Integer.parseInt(bd[1]));
                res.putInt("byear", Math.max(Integer.parseInt(bd[2]), (int) MIN_BDATE_YEAR));
            } catch (NumberFormatException e) {
            }
            res.putInt("bdate_vis", r.getInt("bdate_visibility"));
            if (r.has("country")) {
                JSONObject jc = r.getJSONObject("country");
                res.putInt("country_id", jc.getInt("id"));
                res.putString("country_name", jc.getString("title"));
            }
            if (r.has("city")) {
                JSONObject jc2 = r.getJSONObject("city");
                res.putInt("city_id", jc2.getInt("id"));
                res.putString("city_name", jc2.getString("title"));
            }
            if (r.has("name_request")) {
                JSONObject nr = r.getJSONObject("name_request");
                if (nr.getString("status").equals("processing")) {
                    status = 1;
                }
                res.putInt("name_req_status", status);
                if (status == 1) {
                    res.putInt("name_req_id", nr.getInt("id"));
                }
                res.putString("name_req_name", nr.getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + nr.getString("last_name"));
                return res;
            }
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
