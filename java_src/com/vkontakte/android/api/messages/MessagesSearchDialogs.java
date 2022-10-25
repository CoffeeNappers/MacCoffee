package com.vkontakte.android.api.messages;

import com.facebook.GraphRequest;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesSearchDialogs extends VKAPIRequest<ArrayList<UserProfile>> {
    public MessagesSearchDialogs(String q) {
        super("messages.searchDialogs");
        param("q", q).param(GraphRequest.FIELDS_PARAM, (Global.displayDensity > 1.0f ? "photo_medium_rec" : "photo_rec") + ",online");
    }

    private UserProfile parseProfile(JSONObject p) throws JSONException {
        UserProfile profile = new UserProfile();
        profile.firstName = p.getString("first_name");
        profile.lastName = p.getString("last_name");
        profile.fullName = profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profile.lastName;
        profile.photo = p.getString(Global.displayDensity > 1.0f ? "photo_medium_rec" : "photo_rec");
        profile.uid = p.getInt("id");
        profile.online = Global.getUserOnlineStatus(p);
        return profile;
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public ArrayList<UserProfile> mo1093parse(JSONObject o) {
        try {
            ArrayList<UserProfile> users = new ArrayList<>();
            JSONArray a = o.getJSONArray(ServerKeys.RESPONSE);
            for (int i = 0; i < a.length(); i++) {
                JSONObject e = a.getJSONObject(i);
                if ("profile".equals(e.optString(ServerKeys.TYPE, "profile"))) {
                    users.add(parseProfile(e));
                }
                if ("chat".equals(e.optString(ServerKeys.TYPE))) {
                    UserProfile p = new UserProfile();
                    p.uid = 2000000000 + e.getInt("id");
                    String string = e.getString("title");
                    p.firstName = string;
                    p.fullName = string;
                    p.lastName = "";
                    p.photo = e.optString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50", null);
                    users.add(p);
                }
                if ("group".equals(e.optString(ServerKeys.TYPE))) {
                    UserProfile p2 = new UserProfile();
                    p2.uid = -e.getInt("id");
                    String string2 = e.getString("name");
                    p2.firstName = string2;
                    p2.fullName = string2;
                    p2.lastName = "";
                    p2.photo = e.optString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50", null);
                    users.add(p2);
                }
            }
            return users;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
