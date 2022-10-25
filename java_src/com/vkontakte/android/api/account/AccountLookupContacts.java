package com.vkontakte.android.api.account;

import android.os.Bundle;
import android.text.TextUtils;
import com.facebook.GraphRequest;
import com.facebook.internal.FacebookRequestErrorClassification;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AccountLookupContacts extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public ArrayList<UserProfile> found;
        public ArrayList<UserProfile> other;
    }

    public AccountLookupContacts(List<String> contacts, String service, String myContact) {
        super("account.lookupContacts");
        param("contacts", TextUtils.join(",", contacts));
        param("service", service);
        if (myContact != null) {
            param("mycontact", myContact);
        }
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_50,photo_200,common_count");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            ArrayList<UserProfile> found = new ArrayList<>();
            ArrayList<UserProfile> other = new ArrayList<>();
            JSONObject o2 = o.getJSONObject(ServerKeys.RESPONSE);
            JSONArray jfound = o2.getJSONArray("found");
            JSONArray jother = o2.getJSONArray(FacebookRequestErrorClassification.KEY_OTHER);
            for (int i = 0; i < jfound.length(); i++) {
                JSONObject jp = jfound.getJSONObject(i);
                UserProfile profile = new UserProfile(jp);
                profile.extra = new Bundle();
                profile.extra.putString("external_id", jp.optString("contact"));
                profile.university = jp.optInt("common_count") > 0 ? VKApplication.context.getResources().getQuantityString(R.plurals.num_mutual_friends_req, jp.getInt("common_count"), Integer.valueOf(jp.getInt("common_count"))) : "";
                found.add(profile);
            }
            for (int i2 = 0; i2 < jother.length(); i2++) {
                UserProfile profile2 = new UserProfile();
                JSONObject jp2 = jother.getJSONObject(i2);
                profile2.uid = -1;
                profile2.extra = new Bundle();
                profile2.extra.putString("external_id", jp2.optString("contact"));
                other.add(profile2);
            }
            Result res = new Result();
            res.found = found;
            res.other = other;
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
