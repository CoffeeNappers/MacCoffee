package com.vkontakte.android.api.newsfeed;

import com.facebook.GraphRequest;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Global;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class NewsfeedGetSuggestedSources extends VKAPIRequest<List<UserProfile>> {
    public NewsfeedGetSuggestedSources() {
        super("newsfeed.getSuggestedSources");
        param(ServerKeys.COUNT, 200);
        param(GraphRequest.FIELDS_PARAM, "photo_50,photo_100,activity");
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public List<UserProfile> mo1093parse(JSONObject o) {
        try {
            ArrayList<UserProfile> result = new ArrayList<>();
            JSONArray r = o.getJSONObject(ServerKeys.RESPONSE).getJSONArray(ServerKeys.ITEMS);
            for (int i = 0; i < r.length(); i++) {
                JSONObject u = r.getJSONObject(i);
                UserProfile p = new UserProfile();
                if (u.getString(ServerKeys.TYPE).equals("profile")) {
                    p.uid = u.getInt("id");
                    p.firstName = u.getString("first_name");
                    p.lastName = u.getString("last_name");
                    p.fullName = p.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + p.lastName;
                } else {
                    p.uid = -u.getInt("id");
                    p.fullName = u.getString("name");
                }
                p.photo = u.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                p.university = u.getString("activity");
                result.add(p);
            }
            return result;
        } catch (Exception e) {
            return null;
        }
    }
}
