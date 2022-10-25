package com.vkontakte.android.api.common;

import com.facebook.GraphRequest;
import com.vk.core.util.Screen;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GetUsersGroupRequest extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public ArrayList<UserProfile> groups;
        public ArrayList<UserProfile> users;
    }

    public static GetUsersGroupRequest getNewsfeedBanned() {
        return new GetUsersGroupRequest("newsfeed.getBanned");
    }

    public static GetUsersGroupRequest getStoriesBanned() {
        return new GetUsersGroupRequest("stories.getBanned");
    }

    public GetUsersGroupRequest(String method) {
        super(method);
        param("extended", 1).param(GraphRequest.FIELDS_PARAM, "photo_50,photo_100,photo_200");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        String str;
        try {
            ArrayList<UserProfile> users = new ArrayList<>();
            ArrayList<UserProfile> groups = new ArrayList<>();
            JSONArray ju = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("profiles");
            JSONArray jg = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("groups");
            if (ju != null) {
                for (int i = 0; i < ju.length(); i++) {
                    users.add(new UserProfile(ju.getJSONObject(i)));
                }
            }
            if (jg != null) {
                for (int i2 = 0; i2 < jg.length(); i2++) {
                    JSONObject u = jg.getJSONObject(i2);
                    UserProfile p = new UserProfile();
                    p.uid = -u.getInt("id");
                    p.fullName = u.getString("name");
                    if (Global.displayDensity >= 2.0f || Screen.isTablet()) {
                        str = "photo_200";
                    } else {
                        str = Global.displayDensity > 1.0f ? "photo_100" : "photo_50";
                    }
                    p.photo = u.optString(str, u.getString("photo_100"));
                    groups.add(p);
                }
            }
            Result r = new Result();
            r.users = users;
            r.groups = groups;
            return r;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
