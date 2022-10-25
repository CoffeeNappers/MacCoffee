package com.vkontakte.android.api.friends;

import com.facebook.GraphRequest;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class FriendsGet extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public List<UserProfile> friends = new ArrayList();
        public List<Friends.Folder> lists;
    }

    public FriendsGet(int uid, boolean mutual) {
        super("execute.getFriendsAndLists");
        param(GraphRequest.FIELDS_PARAM, "photo_200,photo_100,photo_50,online" + ((uid == VKAccountManager.getCurrent().getUid() || uid == 0) ? ",bdate,first_name_gen,domain,last_name_gen,sex,verified" : ""));
        if (uid == 0 || uid == VKAccountManager.getCurrent().getUid()) {
            param("order", "hints");
            param("need_lists", 1);
        }
        param("user_id", uid);
    }

    private UserProfile parseProfile(JSONObject p) throws JSONException {
        UserProfile profile = new UserProfile(p);
        profile.bdate = p.optString("bdate");
        profile.country = 0;
        if (p.has("lists")) {
            JSONArray lists = p.getJSONArray("lists");
            for (int i = 0; i < lists.length(); i++) {
                int l = lists.getInt(i);
                profile.country |= 1 << l;
            }
        }
        if (p.has("first_name_gen")) {
            profile.university = p.getString("first_name_gen") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + p.getString("last_name_gen");
        }
        return profile;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            ArrayList<UserProfile> users = new ArrayList<>();
            Result result = new Result();
            JSONArray a = o.getJSONObject(ServerKeys.RESPONSE).getJSONArray(ServerKeys.ITEMS);
            if (a != null) {
                for (int i = 0; i < a.length(); i++) {
                    users.add(parseProfile(a.getJSONObject(i)));
                }
                result.friends = users;
                if (o.getJSONObject(ServerKeys.RESPONSE).has("lists")) {
                    ArrayList<Friends.Folder> lists = new ArrayList<>();
                    JSONArray jl = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("lists");
                    if (jl != null) {
                        for (int i2 = 0; i2 < jl.length(); i2++) {
                            JSONObject jlist = jl.getJSONObject(i2);
                            Friends.Folder list = new Friends.Folder();
                            list.id = jlist.getInt("id");
                            list.name = jlist.getString("name");
                            lists.add(list);
                        }
                    }
                    result.lists = lists;
                    return result;
                }
                return result;
            }
            return result;
        } catch (Exception x) {
            L.e(o);
            Log.w("vk", x);
            return null;
        }
    }
}
